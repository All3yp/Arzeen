//
//  SelectedStoreView.swift
//  Coffee
//
//  Created by Brena Amorim on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit
import MapKit

class SelectedStoreView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.globalMarromColor
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        //set center of location
        //        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        
        // restringe o zoom do usuario
        let fortalCenter = CLLocation(latitude: -3.731401, longitude: -38.490090)
        let region = MKCoordinateRegion(
            center: fortalCenter.coordinate,
            latitudinalMeters: 50000,
            longitudinalMeters: 60000)
        
        mapView.setRegion(region, animated: true)
        
        mapView.setCameraBoundary(
            MKMapView.CameraBoundary(coordinateRegion: region),
            animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        //
        
        //        mapView.delegate = self
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        return mapView
    }()
    
    let storeImageView: UIImageView = {
        let storeImage = UIImageView()
        storeImage.layer.borderWidth = 1.0
        storeImage.layer.masksToBounds = false
        storeImage.layer.borderColor = UIColor.systemYellow.cgColor
        storeImage.layer.cornerRadius = 25
        storeImage.clipsToBounds = true
        storeImage.translatesAutoresizingMaskIntoConstraints = false
        return storeImage
    }()
    
    let storeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.amareloEscuroCustomized
        // ajusta pro texto caber no label
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 0
        label.text = "Amika Coffehouse"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.whiteColorCustomized
        // ajusta pro texto caber no label
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 0
        label.text = "R. Ana Bilhar, 1136B - Meireles, Fortaleza - CE, 60160-110"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let partitionStore: UIView = {
        let partition = UIView()
        partition.backgroundColor = UIColor.whiteColorCustomized
        partition.translatesAutoresizingMaskIntoConstraints = false
        return partition
    }()
    
    let grainLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.amareloClaroCustomized
        label.numberOfLines = 1
        label.text = "Catuaí"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let originOfGrainLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.whiteColorCustomized
        label.numberOfLines = 1
        label.text = "Poços, Minas Gerais"
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailsLabel = CustomLabel(text: "Detalhes", textColor: UIColor.amareloClaroCustomized!,
                                   font: UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    let sensoryProfileLabel = CustomLabel(text: "Perfil Sensorial", textColor: UIColor.amareloClaroCustomized!,
                                          font: UIFont.systemFont(ofSize: 15, weight: .light))
    
    let descriptionSensory: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.amareloEscuroCustomized
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 0
        label.text = "Melado de Cana, Mirtilo, Pralinê"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let partitionDetails: UIView = {
        let partition = UIView()
        partition.backgroundColor = UIColor.whiteColorCustomized
        partition.translatesAutoresizingMaskIntoConstraints = false
        return partition
    }()
    
    let altitudeLabel = CustomLabel(text: "Altitude", textColor: UIColor.amareloClaroCustomized!,
                                    font: UIFont.systemFont(ofSize: 15, weight: .light))
    
    let altitudeValueLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.amareloEscuroCustomized
        label.numberOfLines = 1
        label.text = "1200m"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let partitionDetails1: UIView = {
        let partition = UIView()
        partition.backgroundColor = UIColor.whiteColorCustomized
        partition.translatesAutoresizingMaskIntoConstraints = false
        return partition
    }()
    
    let bodyLabel = CustomLabel(text: "Corpo", textColor: UIColor.amareloClaroCustomized!,
                                font: UIFont.systemFont(ofSize: 15, weight: .light))
    
    let partitionDetails2: UIView = {
        let partition = UIView()
        partition.backgroundColor = UIColor.whiteColorCustomized
        partition.translatesAutoresizingMaskIntoConstraints = false
        return partition
    }()
    
    let acidityLabel = CustomLabel(text: "Acidez", textColor: UIColor.amareloClaroCustomized!,
                                   font: UIFont.systemFont(ofSize: 15, weight: .light))
    
    let ratingBody = FiveStarsView(rate: 4)
    let ratingAcidity = FiveStarsView(rate: 3)
    
    func setupViews() {
        
        self.addSubview(mapView)
        self.addSubview(storeImageView)
        self.addSubview(storeLabel)
        self.addSubview(locationLabel)
        self.addSubview(partitionStore)
        self.addSubview(grainLabel)
        self.addSubview(originOfGrainLabel)
        self.addSubview(detailsLabel)
        self.addSubview(sensoryProfileLabel)
        self.addSubview(partitionDetails)
        self.addSubview(descriptionSensory)
        self.addSubview(altitudeLabel)
        self.addSubview(altitudeValueLabel)
        self.addSubview(partitionDetails1)
        self.addSubview(bodyLabel)
        self.addSubview(ratingBody)
        self.addSubview(partitionDetails2)
        self.addSubview(acidityLabel)
        self.addSubview(ratingAcidity)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: super.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            storeImageView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 11),
            storeImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            storeImageView.widthAnchor.constraint(equalToConstant: 50),
            storeImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            storeLabel.centerYAnchor.constraint(equalTo: storeImageView.centerYAnchor),
            storeLabel.leadingAnchor.constraint(equalTo: storeImageView.trailingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: storeLabel.bottomAnchor, constant: 16),
            locationLabel.leadingAnchor.constraint(equalTo: storeLabel.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            partitionStore.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 30),
            partitionStore.heightAnchor.constraint(equalToConstant: 1),
            partitionStore.widthAnchor.constraint(equalToConstant: 351),
            partitionStore.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            grainLabel.topAnchor.constraint(equalTo: partitionStore.bottomAnchor, constant: 16),
            grainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
            originOfGrainLabel.topAnchor.constraint(equalTo: grainLabel.bottomAnchor, constant: 7),
            originOfGrainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45)
        ])
        
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: originOfGrainLabel.bottomAnchor, constant: 7),
            detailsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
            sensoryProfileLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 15),
            sensoryProfileLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
            descriptionSensory.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 15),
            descriptionSensory.bottomAnchor.constraint(equalTo: partitionDetails.topAnchor, constant: -8),
//            descriptionSensory.leadingAnchor.constraint(equalTo: sensoryProfileLabel.trailingAnchor, constant: 16),
            descriptionSensory.trailingAnchor.constraint(equalTo: partitionDetails.trailingAnchor)

        ])
        
        NSLayoutConstraint.activate([
            partitionDetails.topAnchor.constraint(equalTo: sensoryProfileLabel.bottomAnchor, constant: 8),
            partitionDetails.heightAnchor.constraint(equalToConstant: 1),
            partitionDetails.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            partitionDetails.leadingAnchor.constraint(equalTo: sensoryProfileLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            altitudeLabel.topAnchor.constraint(equalTo: partitionDetails.bottomAnchor, constant: 8),
            altitudeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
            altitudeValueLabel.topAnchor.constraint(equalTo: partitionDetails.topAnchor, constant: 8),
            altitudeValueLabel.trailingAnchor.constraint(equalTo: partitionDetails.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            partitionDetails1.topAnchor.constraint(equalTo: altitudeLabel.bottomAnchor, constant: 8),
            partitionDetails1.heightAnchor.constraint(equalToConstant: 1),
            partitionDetails1.leadingAnchor.constraint(equalTo: altitudeLabel.leadingAnchor),
            partitionDetails1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: partitionDetails1.bottomAnchor, constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
           ratingBody.topAnchor.constraint(equalTo: partitionDetails1.bottomAnchor, constant: 8),
           ratingBody.trailingAnchor.constraint(equalTo: partitionDetails1.trailingAnchor),
           ratingBody.heightAnchor.constraint(equalToConstant: 13),
           ratingBody.widthAnchor.constraint(equalToConstant: 81)
            
        ])
        
        NSLayoutConstraint.activate([
            partitionDetails2.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 8),
            partitionDetails2.heightAnchor.constraint(equalToConstant: 1),
            partitionDetails2.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor),
            partitionDetails2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            acidityLabel.topAnchor.constraint(equalTo: partitionDetails2.bottomAnchor, constant: 8),
            acidityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
           ratingAcidity.topAnchor.constraint(equalTo: partitionDetails2.bottomAnchor, constant: 8),
           ratingAcidity.trailingAnchor.constraint(equalTo: partitionDetails2.trailingAnchor),
           ratingAcidity.heightAnchor.constraint(equalToConstant: 13),
           ratingAcidity.widthAnchor.constraint(equalToConstant: 81)
            
        ])
        
    }
    
}
