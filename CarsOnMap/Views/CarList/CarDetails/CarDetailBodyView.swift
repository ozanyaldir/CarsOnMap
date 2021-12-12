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
                    .accessibilityIdentifier("licensePlateText")
            }
            HStack{
                Text("Color:").fontWeight(.medium)
                Text("\(car.color ?? "Undefined")").fontWeight(.light)
                    .accessibilityIdentifier("colorText")
            }
            HStack{
                Text("Inner cleanliness:").fontWeight(.medium)
                Text("\(car.innerCleanliness ?? "Undefined")").fontWeight(.light)
                    .accessibilityIdentifier("innerCleanlinessText")
            }
            HStack{
                Text("Fuel Level:").fontWeight(.medium)
                Text("\( car.fuelLevel != nil ? "%\(String(format: "%.2f", (car.fuelLevel! * 100)))" : "Undefined")").fontWeight(.light)
                    .accessibilityIdentifier("fuelLevelText")
            }
        }
        Section("Technical Details") {
            HStack{
                Text("Fuel Type:").fontWeight(.medium)
                Text("\(car.fuelType ?? "Undefined")").fontWeight(.light)
                    .accessibilityIdentifier("fuelTypeText")
            }
            HStack{
                Text("Series:").fontWeight(.medium)
                Text("\(car.series ?? "Undefined")").fontWeight(.light)
                    .accessibilityIdentifier("seriesText")
            }
            HStack{
                Text("Group:").fontWeight(.medium)
                Text("\(car.group ?? "Undefined")").fontWeight(.light)
                    .accessibilityIdentifier("groupText")
            }
            HStack{
                Text("Make:").fontWeight(.medium)
                Text("\(car.make ?? "Undefined")").fontWeight(.light)
                    .accessibilityIdentifier("makeText")
            }
            HStack{
                Text("Transmission:").fontWeight(.medium)
                Text("\(car.transmission ?? "Undefined")").fontWeight(.light)
                    .accessibilityIdentifier("transmissionText")
            }
            HStack{
                Text("Model Identifier:").fontWeight(.medium)
                Text("\(car.modelIdentifier ?? "Undefined")").fontWeight(.light)
                    .accessibilityIdentifier("modelIdentifierText")
            }
        }
    }
}
