//
//  MainView.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 28.11.2021.
//

import Foundation
import SwiftUI


struct MainView: View {
    
    
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            CarListView()
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
        }
        
    }
    
}

struct MainView_Previews: PreviewProvider{
    static var previews: some View{
        MainView()
    }
}
