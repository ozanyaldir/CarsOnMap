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
                                if let imageURLString = car.carImageUrl,
                                    let imageUrl = URL(string: imageURLString){
                                    KFImage(imageUrl)
                                        .resizable()
                                        .frame(width: 50, height: 30)
                                } else{
                                    Image(systemName: "car.fill")
                                        .font(.system(size: 20.0))
                                }
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
            .navigationBarTitle(Text("Cars"), displayMode: .inline)
        }
    }
}

struct CarListView_Previews: PreviewProvider{
    static var previews: some View{
        CarListView()
    }
}
