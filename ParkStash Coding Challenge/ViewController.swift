//
//  ViewController.swift
//  ParkStash Coding Challenge
//
//  Created by Shreyas Zagade on 3/21/18.
//  Copyright © 2018 Shreyas Zagade. All rights reserved.
//

import UIKit
import SideMenu
import GooglePlaces
import GooglePlacePicker
import GoogleMaps
import Locksmith

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuFadeStatusBar = false
        
        var (latitude, longitude) = DataStore.retriveDataOrDefault()
        setupMap(latitude: latitude, longitude: longitude)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func searchButtonClicked(_ sender: UIBarButtonItem) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    
    func setupMap(latitude : Double, longitude : Double, name : String = ""){
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 18.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = name
        marker.map = mapView
    }
    
}

extension ViewController: GMSAutocompleteViewControllerDelegate {
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        dismiss(animated: true, completion: nil)
        DataStore.saveData(lat: place.coordinate.latitude, long: place.coordinate.longitude)
        setupMap(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude, name: place.name)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error: ", error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
