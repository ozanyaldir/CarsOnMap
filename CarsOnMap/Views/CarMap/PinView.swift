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
        KFImage(URL(string: imageURL ?? ""))
            .placeholder {
                Image(uiImage: UIImage(named: "simple-car")!)
                    .resizable()
                    .frame(width: 40, height: 16)
            }
            .resizable()
            .frame(width: 50, height: 30)
        
    }
}

struct PinView_Previews: PreviewProvider{
    static var previews: some View{
        PinView(title: "Example Title", imageURL: "https://cdn.sixt.io/codingtask/images/mini.png")
    }
}
