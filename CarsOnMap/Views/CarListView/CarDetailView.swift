//
//  CarDetailView.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 28.11.2021.
//

import SwiftUI

struct CarDetailView: View {
    
    let car: CarListItemViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                Text("\(car.name ?? "Undefined")").bold()
            }
            .navigationBarTitle(Text("Car Details"), displayMode: .inline)
        }
    }
}

struct CarDetailView_Previews: PreviewProvider{
    static var previews: some View{
        CarListView()
    }
}
