//
//  ContentView.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
