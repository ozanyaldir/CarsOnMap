//
//  CarDetailView.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 28.11.2021.
//

import SwiftUI
import Kingfisher

struct CarDetailView: View {
    let car: CarListItemViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                CarDetailHeaderView(car: car)
                CarDetailBodyView(car: car)
            }
            .navigationBarTitle("Car Details")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct CarDetailView_Previews: PreviewProvider{
    static var previews: some View{
        CarListView()
    }
}
