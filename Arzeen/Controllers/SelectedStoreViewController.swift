//
//  StoreSelectedViewController.swift
//  Coffee
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = selectedStore
        // substituindo a view pela selected store view
        selectedStore.mapView.centerToLocation(initialLocation)

        // 3 - Cria um arquivo com a struct dos dados dos lugares//Artwork
        // 4 - Cria um arquivo com os dados dos lugares (estão em Artworl.swift)
        // 5 - Mostrando o artwork no mapa
        //        let artwork = Artwork(
        //          title: "King David Kalakaua",
        //          locationName: "Waikiki Gateway Park",
        //          discipline: "Sculpture",
        //          coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
        //        mapView.addAnnotation(artwork)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        selectedStore.ratingAcidity.animate()
        selectedStore.ratingBody.animate()

    }
    
        let initialLocation = CLLocation(latitude: -3.731401, longitude: -38.490090)
    
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
