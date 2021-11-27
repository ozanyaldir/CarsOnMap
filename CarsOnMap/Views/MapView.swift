//
//  MapView.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var mapVM = MapViewModel()
    
    var body: some View {
        Map(coordinateRegion: $mapVM.region, annotationItems: mapVM.locations) { (location) -> MapAnnotation<PinView> in
            MapAnnotation(coordinate: location.coordinate) {
                PinView(title: location.modelName, imageURL: location.carImageUrl!)
            }
        }
        .onAppear {
            mapVM.getCarList()
        }
    }
}

