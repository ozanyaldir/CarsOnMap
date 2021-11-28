//
//  CarListView.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 28.11.2021.
//

import SwiftUI
import Kingfisher

struct CarListView: View {
    
    @StateObject private var carListVM = CarListViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack{
                List(carListVM.cars, id: \.id){ car in
                    VStack{
                        NavigationLink(
                            destination: CarDetailView(car: car)
                        ) {
                            HStack{
                                KFImage(URL(string: car.carImageUrl ?? ""))
                                    .placeholder {
                                        Image(uiImage: UIImage(named: "simple-car")!)
                                            .resizable()
                                            .frame(width: 50, height: 20)
                                    }
                                    .resizable()
                                    .frame(width: 50, height: 30)
                                Text("\(car.name ?? "Undefined")").fontWeight(.medium)
                                Text("(\(car.modelName))").fontWeight(.light)
                            }
                        }
                    }
                }
            }
            .onAppear {
                carListVM.getCarList()
            }
            .navigationBarTitle("Cars", displayMode: .inline)
        }
    }
}

struct CarListView_Previews: PreviewProvider{
    static var previews: some View{
        CarListView()
    }
}
