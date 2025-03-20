//
//  SearchResultCellView.swift
//  Show Score
//
//  Created by Felipe Duarte on 6/03/25.
//

import SwiftUI

struct SearchResultCellView: View {
    
    let result : SearchResult
    
//    var body: some View {
//        NavigationLink (value: result){
//            HStack {
//                if let posterPath = result.posterPath {
//                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(posterPath)")) { image in
//                        image.resizable().scaledToFit()
//                    } placeholder: {
//                        Color.gray.frame(width: 50, height: 75)
//                    }
//                    .frame(width: 50, height: 75)
//                    .cornerRadius(8)
//                }
//
//                VStack(alignment: .leading) {
//                    Text(result.title ?? result.name ?? "Desconocido")
//                        .font(.headline)
//                    Text(result.mediaType.rawValue.capitalized)
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//            }
//        }
//    }
    
    
    var body: some View {
        HStack {
            if let imageURL = result.posterPath {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(imageURL)")) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 60, height: 90)
                .cornerRadius(8)
            }
            
            if let imageURL = result.profilePath {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(imageURL)")) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 60, height: 90)
                .cornerRadius(8)
            }
            
            VStack(alignment: .leading) {
                Text(result.name ?? result.title ?? "Unknown")
                    .font(.headline)
                
                Text(result.mediaType.rawValue.capitalized)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}

//#Preview {
//    SearchResultCellView()
//}
