//
//  PeopleCellView.swift
//  Show Score
//
//  Created by Felipe Duarte on 24/01/25.
//

import SwiftUI

struct PeopleCellView: View {
    
    var person : PersonModel
    var body: some View {
        VStack{
            Image(uiImage: person.viewImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(.rect(cornerRadius: 8))
            Text(person.name)
            Text(person.knownForDepartment)
        }
    }
}

//#Preview {
//    HomeView().modelContainer(MovieModel.preview)
//}
