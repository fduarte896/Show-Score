//
//  TabView.swift
//  Show Score
//
//  Created by Laura Isabel Rojas Bustamante on 10/01/25.
//

import SwiftUI

struct TabViewHome: View {
    
    @State var viewModel = ViewModel()
    
    var body: some View {
        
        TabView {
            ListView()
                .tabItem { Label("Home", systemImage: "house") }
            
            ContentView()
                .tabItem { Label("My space", systemImage: "person") }
        }
    }
}

#Preview {
    TabViewHome()
}
