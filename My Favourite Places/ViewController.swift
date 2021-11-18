//
//  ViewController.swift
//  My Favourite Places
//
//  Created by Ilkin Samedzade on 18/11/2021.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(currentPlace)
    }


    @IBOutlet weak var map: MKMapView!
}

