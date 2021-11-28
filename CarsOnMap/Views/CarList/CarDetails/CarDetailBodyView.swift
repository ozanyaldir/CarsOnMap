//
//  CarDetailBodyView.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 28.11.2021.
//

import SwiftUI

struct CarDetailBodyView: View {
    let car: CarListItemViewModel
    
    var body: some View {
        Section("Basic Details") {
            HStack{
                Text("License Plate:").fontWeight(.medium)
                Text("\(car.licensePlate ?? "Undefined")").fontWeight(.light)
            }
            HStack{
                Text("Color:").fontWeight(.medium)
                Text("\(car.color ?? "Undefined")").fontWeight(.light)
            }
            HStack{
                Text("Inner cleanliness:").fontWeight(.medium)
                Text("\(car.innerCleanliness ?? "Undefined")").fontWeight(.light)
            }
            HStack{
                Text("Fuel Level:").fontWeight(.medium)
                Text("\( car.fuelLevel != nil ? "%\(String(format: "%.2f", (car.fuelLevel! * 100)))" : "Undefined")").fontWeight(.light)
            }
        }
        Section("Technical Details") {
            HStack{
                Text("Fuel Type:").fontWeight(.medium)
                Text("\(car.fuelType ?? "Undefined")").fontWeight(.light)
            }
            HStack{
                Text("Series:").fontWeight(.medium)
                Text("\(car.series ?? "Undefined")").fontWeight(.light)
            }
            HStack{
                Text("Group:").fontWeight(.medium)
                Text("\(car.group ?? "Undefined")").fontWeight(.light)
            }
            HStack{
                Text("Make:").fontWeight(.medium)
                Text("\(car.make ?? "Undefined")").fontWeight(.light)
            }
            HStack{
                Text("Transmission:").fontWeight(.medium)
                Text("\(car.transmission ?? "Undefined")").fontWeight(.light)
            }
            HStack{
                Text("Model Identifier:").fontWeight(.medium)
                Text("\(car.modelIdentifier ?? "Undefined")").fontWeight(.light)
            }
        }
    }
}
