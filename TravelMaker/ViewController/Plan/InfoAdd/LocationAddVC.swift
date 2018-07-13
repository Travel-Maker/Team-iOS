//
//  LocationAddVC.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 7..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
    
class LocationAddVC: UIViewController, CLLocationManagerDelegate , GMSMapViewDelegate, GMSAutocompleteViewControllerDelegate {
        
    // OUTLET
    @IBOutlet weak var googleMapsView: GMSMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    // VARIABLES
    var locationManager = CLLocationManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
            
        initGoogleMaps()
    }
        
    func initGoogleMaps() {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            mapView.isMyLocationEnabled = true
            
        self.googleMapsView.camera = camera
        self.googleMapsView.delegate = self;
        self.googleMapsView.isMyLocationEnabled = true
        self.googleMapsView.settings.myLocationButton = true
            
            
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
        
        // MARK: CLLocation Manager Delegate
        
        
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while get location \(error)")
    }
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
            
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
            
        self.googleMapsView.animate(to: camera)
        self.locationManager.stopUpdatingLocation()
        
        //print("위치정보: \(locations)")
        //let marker = GMSMarker()
        //marker.position = CLLocationCoordinate2D(latitude: , longitude: )
            
        }
        
        
        // MARK: GMSMapview Delegate
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        self.googleMapsView.isMyLocationEnabled = true
        }
        
        func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
            
            self.googleMapsView.isMyLocationEnabled = true
            if (gesture) {
                mapView.selectedMarker = nil
            }
            
        }
        
        // MARK: GOOGLE AUTO COMPLETE DELEGATE
        
        func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
            
            let camera = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude, longitude: place.coordinate.longitude, zoom: 15.0)
            self.googleMapsView.camera = camera
            self.dismiss(animated: true, completion: nil) // dismiss after select place
            
            //검색내용에 대한 위치정보 받아오기
            //print("검색 위치정보 = \(place)")
            addressLabel.text = place.formattedAddress
            
        }
        
        func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
            
            print("ERROR AUTO COMPLETE \(error)")
            
        }
        
        func wasCancelled(_ viewController: GMSAutocompleteViewController) {
            self.dismiss(animated: true, completion: nil) // when cancel search
        }
        
        
    @IBAction func openSearchAddress(_ sender: Any) {
        
        print("버튼을 눌렀습니다!!!")
        let autoCompleteController = GMSAutocompleteViewController()
        autoCompleteController.delegate = self
        
        self.locationManager.startUpdatingLocation()
        self.present(autoCompleteController, animated: true, completion: nil)
        
    }
    
    @IBAction func dismissBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
  
}

   
    


