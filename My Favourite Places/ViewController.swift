//
//  ViewController.swift
//  My Favourite Places
//
//  Created by Joao Garrido on 18/11/2021.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    let defaults = Defaults()
    var location : Locations = Locations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let name = location.name else {return}
        guard let lat = location.lat else {return}
        guard let lon = location.lon else {return}
        let span = MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let region =   MKCoordinateRegion(center: coordinate, span: span)
        self.map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = name
        self.map.addAnnotation(annotation)

    }
    
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        if(sender.state == .began){
            let touchPoint = sender.location(in: self.map)
            let newCoordinate = self.map.convert(touchPoint, toCoordinateFrom: self.map)
            print(newCoordinate)
            let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            var title = ""
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                if(error != nil){
                    print(error as Any)
                }else{
                    if let placemark = placemarks?[0] {
                        if(placemark.subThoroughfare != nil){
                            title += placemark.subThoroughfare! + " "
                        }
                        if(placemark.thoroughfare != nil){
                            title += placemark.thoroughfare!
                        }
                    }
                }
                if(title == ""){
                    title = "Added \(NSDate())"
                }
                let annotation = MKPointAnnotation()
                annotation.coordinate = newCoordinate
                annotation.title = title
                self.map.addAnnotation(annotation)
                self.defaults.addLocation(location: Locations(name: title, lat: newCoordinate.latitude, lon: newCoordinate.longitude))
            })
        }
    }
    
    @IBOutlet weak var map: MKMapView!
}

