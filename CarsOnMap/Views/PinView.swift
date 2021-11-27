//
//  PinView.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import SwiftUI

struct PinView: View {
    var title: String
    var imageURL: String
    
    var body: some View {
        //AsyncImage(url: URL(string: imageURL))
        //.frame(idealHeight: 100)
        Image(systemName: "paperplane")
            .font(.system(size: 20.0))
    }
}
