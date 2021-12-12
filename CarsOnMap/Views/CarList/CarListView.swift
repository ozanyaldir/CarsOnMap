//
//  CarListView.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 28.11.2021.
//

import SwiftUI

struct CarListView: View {
    
    @StateObject private var carListVM = CarListViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack{
                List(carListVM.cars, id: \.id){ car in
                    CarListItem(car: car)
                }
            }
            .onAppear {
                carListVM.getCarList()
            }
            .alert("Failed Fetching", isPresented: $carListVM.isFailed) {
                Button("Reload") { self.carListVM.getCarList() }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                 ToolbarItem(placement: .principal, content: {
                 Text("Cars")
              })})  
        }
    }
}

struct CarListView_Previews: PreviewProvider{
    static var previews: some View{
        CarListView()
    }
}
