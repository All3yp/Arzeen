//
//  StoreSelectedViewController.swift
//  Arzeen
//
//  Created by Brena Amorim on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit
import MapKit

class SelectedStoreViewController: UIViewController {
    
    lazy var selectedStore: SelectedStoreView = {
        return SelectedStoreView()
    }()
    
    var storeSelectedData = ListOfStore()
    var indexRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = selectedStore
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        selectedStore.ratingAcidity.animate()
        selectedStore.ratingBody.animate()
        // Animando as stars
        
        let initialLocation = CLLocation(latitude: storeSelectedData
        .latitude!, longitude: storeSelectedData.longitude!)
        
        // substituindo a view pela selected store view
        selectedStore.backgroundColor = UIColor.blackColorCustomized
        
        selectedStore.storeLabel.text = storeSelectedData.name
        selectedStore.storeImageView.image = UIImage(named: storeSelectedData.imageStore!)
        selectedStore.locationLabel.text = storeSelectedData.location
        selectedStore.grainLabel.text = storeSelectedData.grain?.name
        selectedStore.originOfGrainLabel.text = storeSelectedData.grain?.originOfGrain
        selectedStore.descriptionSensory.text = storeSelectedData.grain?.details?.sensoryProfile
        selectedStore.altitudeValueLabel.text = storeSelectedData.grain?.details?.altitude
        //Consumindo o model nos elementos da tela
        
        selectedStore.mapView.centerToLocation(initialLocation)
        
        let artwork = Artwork(
            title: storeSelectedData.name,
            coordinate: CLLocationCoordinate2D(latitude: storeSelectedData
                .latitude!, longitude: storeSelectedData.longitude!))
        selectedStore.mapView.addAnnotation(artwork)
        
    }
    
}

private extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
        // indica ao MKMapView pra mostrar a regiao representada por MKCoordinateRegion
    }
    
}
