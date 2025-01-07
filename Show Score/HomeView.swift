//
//  HomeView.swift
//  Show Score
//
//  Created by Felipe Duarte on 7/01/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<20) {
                    Text("Item \( $0 )")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
