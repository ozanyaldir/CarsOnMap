//
//  CarDetailHeaderView.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 28.11.2021.
//

import SwiftUI
import Kingfisher

struct CarDetailHeaderView: View {
    
    let car: CarListItemViewModel
    
    var body: some View {
        Section("Car"){
            HStack {
                VStack {
                    KFImage(URL(string: car.carImageUrl ?? ""))
                        .placeholder {
                            Image(uiImage: UIImage(named: "simple-car")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .cornerRadius(5)
                }
                VStack {
                    HStack{
                        Text("Name:").fontWeight(.medium)
                        Text("\(car.name ?? "Undefined")").fontWeight(.light)
                        Spacer()
                    }
                    HStack{
                        Text("Model Name:").fontWeight(.medium)
                        Text("\(car.modelName)").fontWeight(.light)
                        Spacer()
                    }
                }
            }
        }
    }
}
