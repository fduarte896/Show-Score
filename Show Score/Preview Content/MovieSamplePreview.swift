//
//  MovieSamplePreview.swift
//  Show Score
//
//  Created by Felipe Duarte on 27/01/25.
//

import Foundation

extension MovieModel {
    static var movieSample : MovieModel {
        MovieModel(id: 1, title: "Inception Preview", originalTitle: "Inception", overview: "A thief who steals corporate secrets through the use of dream-sharing technology.", popularity: 82.3, posterPath: "/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg", backdropPath: "https://image.tmdb.org/t/p/w500/s3TBrRGB1iav7gFOCNx3H31MoES.jpg", releaseDate: "2010-07-16", voteAverage: 8.3, voteCount: 22187, genreIDs: [28, 12, 878], adult: false, video: false, isPopular: true)
    }
}

extension PersonModel {
    /*
     var adult: Bool
     var gender: Int
     var knownForDepartment: String
     var name: String
     var originalName: String
     var popularity: Double
     var profilePath: String
     var profileImage: Data?
     */
    static var personSample : PersonModel {
        PersonModel(id: 1, adult: false, gender: 1, knownForDepartment: "Acting", name: "Leonardo DiCaprio", originalName: "Leonardo DiCaprio", popularity: 9.023, profilePath: "/uQpC3dNfvXJiU1qQ11Wm4NbUttK.jpg")
    }
}

extension TVShowModel {
    static var tvShowSample : TVShowModel {
        TVShowModel(id: 1, adult: false, backdropPath: "https://image.tmdb.org/t/p/w500/s3TBrRGB1iav7gFOCNx3H31MoES.jpg", genreIDs: [2, 4, 5], originCountry: ["Col", "US"], originalLanguage: "en", originalName: "Two and a half men", overview: "A man's life takes a wild turn when he meets a woman who is pregnant with his child.", popularity:  8.3, posterPath:  "/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg", firstAirDate: "2003-09-24", name: "Two and a half men", voteAverage:  8.3, voteCount:  22187,isPopular: false)
        
        /*
         let id: Int
         let adult: Bool
         let backdropPath: String?
         let genreIDs: [Int]
         let originCountry: [String]
         let originalLanguage: String
         let originalName: String
         let overview: String
         let popularity: Double
         let posterPath: String
         let posterImage: Data?
         let firstAirDate: String
         let name: String
         let voteAverage: Double
         let voteCount: Int
         */
    }
}
