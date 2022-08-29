//
//  MapViewController.swift
//  RideSharer
//
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    
    //    IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    //    Location Manager
    private let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        checkLocationServices()
    }
    
    private func setupAppearance() {
        title = "Ride Sharer"
    }
    
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
            showAlertWithOk("Oops!",
                      "Your location services are turned off, please turn on location services in settings")
        }
    }
    
    
    private func checkLocationAuthorization() {
        
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
        case .denied:
            showAlertWithOk("Oops!",
                      "You have not provided permission to access location, you will not be able to see your location on the map")
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
        case .restricted:
            showAlertWithOk("Oops!",
                      "You have not provided restricted access to the location services, please allow 'When in use' access to the app in settings")
        case .authorizedAlways:
            showAlertWithOk("Oops!",
                      "You have not provided permission to access location, please allow location services for the app in settings")
        @unknown default:
            showAlertWithOk("Oops!",
                      "Not able to access your location, please make sure that location services are enabled for the app in settings")
        }
        
    }
    
    private func showAlertWithOk(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        navigationController?.present(alert, animated: true)
    }
    
}
