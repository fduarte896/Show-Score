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
            if let imagePath = person.profilePath{
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(imagePath)")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                } placeholder: {
                    Color.gray
                        .frame(height: 100)
                }
                
                .cornerRadius(8)
            }

            Text(person.name)
            Text(person.knownForDepartment)
        }
    }
}

//#Preview {
//    HomeView().modelContainer(MovieModel.preview)
//}
