//
//  ViewController.swift
//  beachtraveler
//
//  Created by RAFAEL-_-LM on 1/12/21.
//

import UIKit
import FlyoverKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mapSetup()
    }

    let locationDictionary = [
        "Laguna Beach": FlyoverAwesomePlace.lagunaBeach,
        "Miami Beach": FlyoverAwesomePlace.miamiBeach,
        "Mullet Bay": FlyoverAwesomePlace.mulletBay
    ]

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locatioButton: UIButton!
    @IBOutlet weak var placeLabel: UILabel!
    @IBAction func locationButtonClicked(_ sender: Any) {
        let rand = locationDictionary.randomElement()!
        let camera = FlyoverCamera(mapView: self.mapView, configuration:
                                    FlyoverCamera.Configuration(duration: 6.0, altitude: 300, pitch: 45.0, headingStep: 40.0))
        camera.start(flyover: rand.value)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6), execute: {
            camera.stop()
        })
        
        placeLabel.text = "\(rand.key)"
    }
    
    func mapSetup() {
        self.mapView.mapType = .hybridFlyover
        self.mapView.showsBuildings = true
        self.mapView.isZoomEnabled = true
        self.mapView.isScrollEnabled = true
    }
}

