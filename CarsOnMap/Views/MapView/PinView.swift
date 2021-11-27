//
//  PinView.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import SwiftUI
import Kingfisher

struct PinView: View {
    var title: String
    var imageURL: String?
    
    var body: some View {
        if let imageURL = imageURL{
            KFImage(URL(string: imageURL)!)
                .resizable()
                .frame(width: 60, height: 40)
        } else{
            Image(systemName: "car.fill")
                .font(.system(size: 20.0))
        }
        
    }
}
