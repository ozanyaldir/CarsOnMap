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
        Map(coordinateRegion: $mapVM.region, annotationItems: mapVM.annotations) { (annotationVM) -> MapAnnotation<PinView> in
            MapAnnotation(coordinate: annotationVM.coordinate) {
                PinView(title: annotationVM.modelName, imageURL: annotationVM.carImageUrl)
            }
        }
        .onAppear {
            mapVM.getCarList()
        }
    }
}

struct MapView_Previews: PreviewProvider{
    static var previews: some View{
        MapView()
    }
}

