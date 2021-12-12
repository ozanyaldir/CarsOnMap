//
//  CarListItem.swift
//  CarsOnMap
//
//  Created by Ozan Yaldır on 12.12.2021.
//

import SwiftUI
import Kingfisher

struct CarListItem: View {
    let car: CarListItemViewModel
    
    var body: some View {
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
                        Text("\(car.name)").fontWeight(.medium)
                        Text("(\(car.modelName))").fontWeight(.light)
                    }
                }
            }
    }
}

