//
//  Models.swift
//  Show Score
//
//  Created by Felipe Duarte on 8/01/25.
//

import Foundation
import SwiftData
import UIKit

@Model
class UserModel {
    var avatar: Avatar
    var id: Int
    var iso639_1: String
    var iso3166_1: String
    var name: String
    var includeAdult: Bool
    var username: String

    struct Avatar: Codable {
        let gravatar: Gravatar
        let tmdb: TMDB

        struct Gravatar: Codable {
            let hash: String
        }

        struct TMDB: Codable {
            let avatarPath: String?

            enum CodingKeys: String, CodingKey {
                case avatarPath = "avatar_path"
            }
        }
    }

    enum CodingKeys: String, CodingKey {
        case avatar
        case id
        case iso639_1
        case iso3166_1
        case name
        case includeAdult = "include_adult"
        case username
    }
    
    init(avatar: Avatar, id: Int, iso639_1: String, iso3166_1: String, name: String, includeAdult: Bool, username: String) {
        self.avatar = avatar
        self.id = id
        self.iso639_1 = iso639_1
        self.iso3166_1 = iso3166_1
        self.name = name
        self.includeAdult = includeAdult
        self.username = username
    }
}

struct UserModelDecode : Codable {
    var avatar: Avatar
    var id: Int
    var iso639_1: String?
    var iso3166_1: String?
    var name: String
    var includeAdult: Bool?
    var username: String
    
    struct Avatar: Codable {
        let gravatar: Gravatar
        let tmdb: TMDB

        struct Gravatar: Codable {
            let hash: String
        }

        struct TMDB: Codable {
            let avatarPath: String?

            enum CodingKeys: String, CodingKey {
                case avatarPath = "avatar_path"
            }
        }
    }
}

extension UserModelDecode {
    func toUserModel() -> UserModel {
        return UserModel(avatar: avatar.toAvatar(), id: self.id, iso639_1: self.iso639_1 ?? "", iso3166_1: self.iso3166_1 ?? "", name: self.name, includeAdult: self.includeAdult ?? false, username: self.username)
    }
}


extension UserModelDecode.Avatar {
    func toAvatar() -> UserModel.Avatar {
        return UserModel.Avatar(
            gravatar: gravatar.toGravatar(),
            tmdb: tmdb.toTMDB()
        )
    }
}

extension UserModelDecode.Avatar.Gravatar {
    func toGravatar() -> UserModel.Avatar.Gravatar {
        return UserModel.Avatar.Gravatar(hash: hash)
    }
}

extension UserModelDecode.Avatar.TMDB {
    func toTMDB() -> UserModel.Avatar.TMDB {
        return UserModel.Avatar.TMDB(avatarPath: avatarPath)
    }
}

// Modelo principal que representa la respuesta completa de la API de popular movies.
@Model
class PopularMoviesResponseModel {
    var page: Int
    var results: [MovieModel]
    var totalPages: Int
    var totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(page: Int, results: [MovieModel], totalPages: Int, totalResults: Int) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

class PopularMoviesResponseModelDecode : Codable {
    var page: Int
    var results: [MovieModelDecode]
    var totalPages: Int
    var totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(page: Int, results: [MovieModelDecode], totalPages: Int, totalResults: Int) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

// Modelo para cada película individual
@Model
class MovieModel {
//    @Attribute(.unique)
    var id: Int
    var title: String
    var originalTitle: String
    var overview: String
    var popularity: Double
    var posterPath: String
    var posterImage : Data?
    var backdropPath: String
    var releaseDate: String
    var voteAverage: Double
    var voteCount: Int
    var genreIDs: [Int]
    var adult: Bool
    var video: Bool
    var isPopular : Bool
    
    var urlToGetMovieImage : URL? {
        let urlBase = "https://image.tmdb.org/t/p/w500"
        let url = URL(string: urlBase + posterPath)
        return url
    }
    
    var urlToGetBackdropImage: URL? {
        guard !backdropPath.isEmpty else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w1280" + backdropPath)
    }
    
    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case genreIDs = "genre_ids"
        case posterImage
        case adult
        case video
    }
    
    init(id: Int, title: String, originalTitle: String, overview: String, popularity: Double, posterPath: String, posterImage: Data? = nil, backdropPath: String, releaseDate: String, voteAverage: Double, voteCount: Int, genreIDs: [Int], adult: Bool, video: Bool, isPopular: Bool) {
        self.id = id
        self.title = title
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.genreIDs = genreIDs
        self.adult = adult
        self.video = video
        self.posterImage = posterImage
        self.isPopular = isPopular
    }
}

struct MovieModelDecode: Identifiable, Codable {
    let id: Int
    var title: String
    var originalTitle: String?
    var originalLanguage: String?
    var overview: String?
    var popularity: Double?
    var posterPath: String?
    var backdropPath: String?
    var releaseDate: String?
    var voteAverage: Double?
    var voteCount: Int?
    var genreIDs: [Int]?
    var adult: Bool?
    var video: Bool?
    var budget: Int?  // Nuevo campo
    var revenue: Int?  // Nuevo campo
    var runtime: Int?  // Nuevo campo
    var status: String?  // Nuevo campo
    var tagline: String?  // Nuevo campo
    var belongsToCollection: BelongsToCollection? // Nuevo campo
    var genres: [Genre]?  // Nuevo campo
    
    struct BelongsToCollection: Codable {
        let id: Int
        let name: String
        let posterPath: String?
        let backdropPath: String?
    }
    
    struct Genre: Codable {
        let id: Int
        let name: String
    }

    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case genreIDs = "genre_ids"
        case adult
        case video
        case budget
        case revenue
        case runtime
        case status
        case tagline
        case belongsToCollection = "belongs_to_collection"
        case genres
        case id
        case title
        case overview
        case popularity
    }
}

//Vamos a crear este modelo para manejar las películas favoritas que vengan de la llamada a red y poder relacionar la película que devuelva la llamada con su verión ya guardada.
@Model
class FavoriteMovieModel {
    @Attribute(.unique) var id: Int
    var movie : MovieModel // Esta seria la relacion con la película ya guardada.
    
    init(movie: MovieModel) {
        self.id = movie.id
        self.movie = movie
    }
}



extension MovieModel {

    
    var viewImage: UIImage {
        guard let image = posterImage else { return UIImage(resource: .interstellar)}
        
        return UIImage(data: image) ?? UIImage(resource: .interstellar)
    }
    
    //Definimos un actor para que no haya problemas de concurrencia y que la traida de data desde la API sea lo más óptima posible. Queremos que la UI no se congele y sea rápida.

    
    @ModelActor
    actor BackgroundActor {

        func downloadMovieImages() async {
            let filter = #Predicate<MovieModel> {$0.posterImage == nil }
            guard let moviesWithOutImages = try? modelContext.fetch(FetchDescriptor(predicate: filter)) else { return }
            
            for movie in moviesWithOutImages {
                guard let url = movie.urlToGetMovieImage else {    break   }
//                print("Downloading movie Image: ", movie.posterPath)
                do {
                    let (data, _) = try await URLSession.shared.getData1(for: url)
                    movie.posterImage = data
                } catch {
                    print("Error downloading movie image: \(movie.posterPath). Error \(error.localizedDescription)")
                }
            }
            do {
                try modelContext.save()
            } catch {
                print("Error saving movie images: \(error.localizedDescription)")
            }
        }

        
        struct Movies : Decodable {
            
            private var apiKey: String {
                Bundle.main.infoDictionary?["TMDB_API_KEY"] as? String ?? ""
            }
            let results: [Movie]
            //Definimos el struct para que se pueda usar con el modelo en swiftdata.
            struct Movie : Decodable {
                let id: Int
                let title: String
                let originalTitle: String
                let overview: String
                let popularity: Double
                let posterPath: String
                let backdropPath: String
                let releaseDate: String
                let voteAverage: Double
                let voteCount: Int
                let genreIDs: [Int]
                let adult: Bool
                let video: Bool
                
                enum CodingKeys: String, CodingKey {
                    case id
                    case title
                    case originalTitle = "original_title"
                    case overview
                    case popularity
                    case posterPath = "poster_path"
                    case backdropPath = "backdrop_path"
                    case releaseDate = "release_date"
                    case voteAverage = "vote_average"
                    case voteCount = "vote_count"
                    case genreIDs = "genre_ids"
                    case adult
                    case video
                }
            }
            
        }
        private var apiKey: String {
            Bundle.main.infoDictionary?["TMDB_API_KEY"] as? String ?? ""
        }
        
        //Ahora definimos la función para traer las películas.
        
        func importMovies() async throws  {
            
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/week")!
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
            let queryItems: [URLQueryItem] = [
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: "1"),
            ]
            components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
            
            var request = URLRequest(url: components.url!)
            request.httpMethod = "GET"
            request.timeoutInterval = 10
            request.allHTTPHeaderFields = [
                "accept": "application/json",
                "Authorization": "Bearer \(apiKey)"
            ]
            
            do {
                let (data, _) = try await URLSession.shared.getData2(for: request) //Traemos el JSON de la URLSession, el ´get data´ viene custom en una extensión porque necesitamos que el argumento sea sendable.
                
    //            print(String(decoding: data, as: UTF8.self))
                let movies = try JSONDecoder().decode(PopularMoviesResponseModelDecode.self, from: data)

                //Finalmente hacemos un loop por el array de structs que llegan de la llamada para insertarlos como modelos de SwiftData.
                
//                var insertedMoviesIDs : Set<Int> = []
                
                for movie in movies.results {
                    
                    let existingMovies = try modelContext.fetch(FetchDescriptor<MovieModel>())
                    let existingMoviesIDs = Set(existingMovies.map{ $0.id })
                    
                    if !existingMoviesIDs.contains(movie.id) {
                        let movieModel = MovieModel(
                            id: movie.id,
                            title: movie.title,
                            originalTitle: movie.originalTitle ?? "",
                            overview: movie.overview ?? "",
                            popularity: movie.popularity ?? 0.0,
                            posterPath: movie.posterPath ?? "",
                            backdropPath: movie.backdropPath ?? "",
                            releaseDate: movie.releaseDate ?? "",
                            voteAverage: movie.voteAverage ?? 0.0,
                            voteCount: movie.voteCount ?? 0,
                            genreIDs: movie.genreIDs ?? [],
                            adult: movie.adult ?? false,
                            video: movie.video ?? false,
                            isPopular: true
                            )
                        print(
                            "Importing movie: ", movie.title
                        )
                        modelContext.insert(movieModel)
                    }

                }
                try modelContext.save()
                await downloadMovieImages()
                
            } catch {
                print("Error in the background task of importing movies: \(error)")
            }
            
        }
    }
    
    @MainActor
    static var preview: ModelContainer {
        let previewContainer = try! ModelContainer(for: MovieModel.self, TVShowModel.self, PersonModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        
        
        // Crear un array de películas de ejemplo
        let sampleMovies = [
            MovieModel(id: 1, title: "Inception Preview", originalTitle: "Inception", overview: "A thief who steals corporate secrets through the use of dream-sharing technology.", popularity: 82.3, posterPath: "https://image.tmdb.org/t/p/w500/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg", backdropPath: "https://image.tmdb.org/t/p/w500/s3TBrRGB1iav7gFOCNx3H31MoES.jpg", releaseDate: "2010-07-16", voteAverage: 8.3, voteCount: 22187, genreIDs: [28, 12, 878], adult: false, video: false, isPopular: false),
            MovieModel(id: 2, title: "Interstellar Preview", originalTitle: "Interstellar", overview: "A team of explorers travel through a wormhole in space.", popularity: 75.5, posterPath: "https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg", backdropPath: "https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg", releaseDate: "2014-11-07", voteAverage: 8.6, voteCount: 19123, genreIDs: [12, 18, 878], adult: false, video: false, isPopular: false),
            MovieModel(id: 3, title: "The Dark Knight Preview", originalTitle: "The Dark Knight", overview: "Batman sets out to dismantle the remaining criminal organizations that plague the streets.", popularity: 85.1, posterPath: "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg", backdropPath: "https://image.tmdb.org/t/p/w500/hbU0NzUlcjeJYvrqJjBXunAO3nx.jpg", releaseDate: "2008-07-18", voteAverage: 9.0, voteCount: 25192, genreIDs: [28, 80, 18], adult: false, video: false, isPopular: false),
            MovieModel(id: 4, title: "Pulp Fiction Preview", originalTitle: "Pulp Fiction", overview: "The lives of two mob hitmen, a boxer, and others intertwine in four tales of violence and redemption.", popularity: 69.7, posterPath: "https://image.tmdb.org/t/p/w500/tlxFSN8Q6oV1b6Ko3vR3s3rJMNQ.jpg", backdropPath: "https://image.tmdb.org/t/p/w500/8kSerJrhrJWKLk1LViesGcnrUPE.jpg", releaseDate: "1994-10-14", voteAverage: 8.9, voteCount: 23211, genreIDs: [80, 18], adult: false, video: false, isPopular: false),
            MovieModel(id: 5, title: "The Matrix Preview", originalTitle: "The Matrix", overview: "A computer hacker learns about the true nature of reality and his role in the war against its controllers.", popularity: 79.4, posterPath: "https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg", backdropPath: "https://image.tmdb.org/t/p/w500/9fgcUOC2epVrNnVnOFXMlZmG3CQ.jpg", releaseDate: "1999-03-31", voteAverage: 8.7, voteCount: 19052, genreIDs: [28, 878], adult: false, video: false, isPopular: false),
            MovieModel(id: 6, title: "Fight Club Preview", originalTitle: "Fight Club", overview: "An insomniac office worker forms an underground fight club.", popularity: 72.8, posterPath: "https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg", backdropPath: "https://image.tmdb.org/t/p/w500/nqzTOePp7WgKAZi7h1VQ7zqj9yY.jpg", releaseDate: "1999-10-15", voteAverage: 8.8, voteCount: 19501, genreIDs: [18], adult: false, video: false, isPopular: false),
            MovieModel(id: 7, title: "Forrest Gump Preview", originalTitle: "Forrest Gump", overview: "The presidencies of Kennedy and Johnson and events of the 20th century unfold from the perspective of a man with an IQ of 75.", popularity: 78.2, posterPath: "https://image.tmdb.org/t/p/w500/h5J4W4veyxMXDMjeNxZI46TsHOb.jpg", backdropPath: "https://image.tmdb.org/t/p/w500/s5zKfPsuLz3sxvPrGVB0Bg5W9oK.jpg", releaseDate: "1994-07-06", voteAverage: 8.8, voteCount: 21115, genreIDs: [18, 35, 10749], adult: false, video: false, isPopular: false),
            MovieModel(id: 8, title: "The Godfather Preview", originalTitle: "The Godfather", overview: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.", popularity: 81.4, posterPath: "https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg", backdropPath: "https://image.tmdb.org/t/p/w500/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg", releaseDate: "1972-03-14", voteAverage: 9.2, voteCount: 18452, genreIDs: [80, 18], adult: false, video: false, isPopular: false),
            MovieModel(id: 9, title: "The Shawshank Redemption Preview", originalTitle: "The Shawshank Redemption", overview: "Two imprisoned men bond over a number of years.", popularity: 83.5, posterPath: "https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", backdropPath: "https://image.tmdb.org/t/p/w500/iNh3BivHyg5sQRPP1KOkzguEX0H.jpg", releaseDate: "1994-09-22", voteAverage: 9.3, voteCount: 21175, genreIDs: [18, 80], adult: false, video: false, isPopular: false),
            MovieModel(id: 10, title: "Gladiator Preview", originalTitle: "Gladiator", overview: "A former Roman General sets out to exact vengeance against the corrupt emperor.", popularity: 77.2, posterPath: "https://image.tmdb.org/t/p/w500/jf9M1IIMRY3INyA0E7z9GmkB5yu.jpg", backdropPath: "https://image.tmdb.org/t/p/w500/vE4gXAFhzy1AAcsfSXBFGHV1EK2.jpg", releaseDate: "2000-05-01", voteAverage: 8.5, voteCount: 19023, genreIDs: [28, 18, 12], adult: false, video: false, isPopular: false)
            
            
        ]
        
        
        // Insertar los datos de ejemplo en el contenedor
        for movie in sampleMovies {
            previewContainer.mainContext.insert(movie)
        }
        
        //Descargamos las imagenes de los datos ficticios
//        Task {
//            await downloadPreviewMovieImages()
//        }

        let sampleTVShows = [
            TVShowModel(id: 1, adult: false, backdropPath: "/backdrop1.jpg", genreIDs: [18, 10765], originCountry: ["US"], originalLanguage: "en", originalName: "Stranger Things", overview: "A group of kids uncovers mysterious events in their small town.", popularity: 85.6, posterPath: "/poster1.jpg", firstAirDate: "2016-07-15", name: "Stranger Things", voteAverage: 8.7, voteCount: 15000, isPopular: false),
            TVShowModel(id: 2, adult: false, backdropPath: "/backdrop2.jpg", genreIDs: [18, 10759], originCountry: ["US"], originalLanguage: "en", originalName: "Breaking Bad", overview: "A high school teacher turned meth producer.", popularity: 92.3, posterPath: "/poster2.jpg", firstAirDate: "2008-01-20", name: "Breaking Bad", voteAverage: 9.5, voteCount: 22000, isPopular: false),
            TVShowModel(id: 3, adult: false, backdropPath: "/backdrop3.jpg", genreIDs: [18, 10765, 9648], originCountry: ["US"], originalLanguage: "en", originalName: "The X-Files", overview: "FBI agents investigate paranormal phenomena.", popularity: 78.2, posterPath: "/poster3.jpg", firstAirDate: "1993-09-10", name: "The X-Files", voteAverage: 8.6, voteCount: 13000, isPopular: false),
            TVShowModel(id: 4, adult: false, backdropPath: "/backdrop4.jpg", genreIDs: [10759, 18, 10768], originCountry: ["US"], originalLanguage: "en", originalName: "24", overview: "Agent Jack Bauer prevents terrorist threats.", popularity: 75.1, posterPath: "/poster4.jpg", firstAirDate: "2001-11-06", name: "24", voteAverage: 8.4, voteCount: 9000, isPopular: false),
            TVShowModel(id: 5, adult: false, backdropPath: "/backdrop5.jpg", genreIDs: [35, 18], originCountry: ["US"], originalLanguage: "en", originalName: "Friends", overview: "Six friends navigate life in New York City.", popularity: 98.5, posterPath: "/poster5.jpg", firstAirDate: "1994-09-22", name: "Friends", voteAverage: 8.9, voteCount: 19000, isPopular: false),
            TVShowModel(id: 6, adult: false, backdropPath: "/backdrop6.jpg", genreIDs: [18, 10765], originCountry: ["US"], originalLanguage: "en", originalName: "The Mandalorian", overview: "A bounty hunter explores the galaxy.", popularity: 89.4, posterPath: "/poster6.jpg", firstAirDate: "2019-11-12", name: "The Mandalorian", voteAverage: 8.8, voteCount: 20000, isPopular: false),
            TVShowModel(id: 7, adult: false, backdropPath: "/backdrop7.jpg", genreIDs: [16, 10765], originCountry: ["JP"], originalLanguage: "ja", originalName: "Attack on Titan", overview: "Humans fight against man-eating giants.", popularity: 95.0, posterPath: "/poster7.jpg", firstAirDate: "2013-04-07", name: "Attack on Titan", voteAverage: 9.0, voteCount: 25000, isPopular: false),
            TVShowModel(id: 8, adult: false, backdropPath: "/backdrop8.jpg", genreIDs: [18, 9648], originCountry: ["US"], originalLanguage: "en", originalName: "Twin Peaks", overview: "FBI investigates a young woman's murder.", popularity: 70.3, posterPath: "/poster8.jpg", firstAirDate: "1990-04-08", name: "Twin Peaks", voteAverage: 8.5, voteCount: 8000, isPopular: false),
            TVShowModel(id: 9, adult: false, backdropPath: "/backdrop9.jpg", genreIDs: [16, 10759], originCountry: ["JP"], originalLanguage: "ja", originalName: "Naruto", overview: "A young ninja dreams of becoming Hokage.", popularity: 88.7, posterPath: "/poster9.jpg", firstAirDate: "2002-10-03", name: "Naruto", voteAverage: 8.6, voteCount: 21000, isPopular: false),
            TVShowModel(id: 10, adult: false, backdropPath: "/backdrop10.jpg", genreIDs: [18, 35], originCountry: ["US"], originalLanguage: "en", originalName: "The Office", overview: "A mockumentary on office life.", popularity: 82.9, posterPath: "/poster10.jpg", firstAirDate: "2005-03-24", name: "The Office", voteAverage: 8.9, voteCount: 19000, isPopular: false)
        ]
        
        for tvShow in sampleTVShows {
            previewContainer.mainContext.insert(tvShow)
        }
        
        let samplePeople = [
            PersonModel(id: 1, adult: false, gender: 2, knownForDepartment: "Acting", name: "Leonardo DiCaprio", originalName: "Leonardo DiCaprio", popularity: 95.7, profilePath: "/profile1.jpg"),
            PersonModel(id: 2, adult: false, gender: 1, knownForDepartment: "Acting", name: "Scarlett Johansson", originalName: "Scarlett Johansson", popularity: 90.3, profilePath: "/profile2.jpg"),
            PersonModel(id: 3, adult: false, gender: 2, knownForDepartment: "Acting", name: "Tom Hanks", originalName: "Tom Hanks", popularity: 88.1, profilePath: "/profile3.jpg"),
            PersonModel(id: 4, adult: false, gender: 1, knownForDepartment: "Acting", name: "Meryl Streep", originalName: "Meryl Streep", popularity: 85.4, profilePath: "/profile4.jpg"),
            PersonModel(id: 5, adult: false, gender: 2, knownForDepartment: "Acting", name: "Brad Pitt", originalName: "Brad Pitt", popularity: 89.9, profilePath: "/profile5.jpg"),
            PersonModel(id: 6, adult: false, gender: 1, knownForDepartment: "Acting", name: "Jennifer Lawrence", originalName: "Jennifer Lawrence", popularity: 87.5, profilePath: "/profile6.jpg"),
            PersonModel(id: 7, adult: false, gender: 2, knownForDepartment: "Directing", name: "Steven Spielberg", originalName: "Steven Spielberg", popularity: 83.2, profilePath: "/profile7.jpg"),
            PersonModel(id: 8, adult: false, gender: 1, knownForDepartment: "Acting", name: "Emma Watson", originalName: "Emma Watson", popularity: 80.8, profilePath: "/profile8.jpg"),
            PersonModel(id: 9, adult: false, gender: 2, knownForDepartment: "Acting", name: "Chris Hemsworth", originalName: "Chris Hemsworth", popularity: 84.6, profilePath: "/profile9.jpg"),
            PersonModel(id: 10, adult: false, gender: 1, knownForDepartment: "Acting", name: "Natalie Portman", originalName: "Natalie Portman", popularity: 86.7, profilePath: "/profile10.jpg")
        ]
        
        for person in samplePeople {
            previewContainer.mainContext.insert(person)
        }

        return previewContainer
    }
}

//Vamos a crear una extension de MovieModelDecode que nos permita crear instancias de MovieModel a partir de MovieModelDecode y asi poderlas usar con swiftdata pq MovieModelDecode no es un modelo sino solo una estructura.

extension MovieModelDecode {
    func toMovieModel() -> MovieModel {
        return MovieModel(
            id: self.id,
            title: self.title,
            originalTitle: self.originalTitle ?? "Desconocido",
            overview: self.overview ?? "No hay descripción disponible.",
            popularity: self.popularity ?? 0.0,
            posterPath: self.posterPath ?? "",
            backdropPath: self.backdropPath ?? "",
            releaseDate: self.releaseDate ?? "Fecha desconocida",
            voteAverage: self.voteAverage ?? 0.0,
            voteCount: self.voteCount ?? 0,
            genreIDs: self.genreIDs ?? [],
            adult: self.adult ?? false,
            video: self.video ?? false,
            isPopular: false // Ajusta esto según sea necesario
        )
    }
}
@Model
class TVShowsResponseModel {
    var page: Int
    var results: [TVShowModel]  // Lista de TVShowModel
    var totalPages: Int
    var totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(
        page: Int,
        results: [TVShowModel],
        totalPages: Int,
        totalResults: Int
    ) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

//Para poder hacer la decodificacion del JSON, debo tener TVShowsResponseModel en versión codable.

class TVShowsResponseModelCodable: Codable {
    var page: Int
    var results: [TVShowModelDecode]  // Lista de TVShowModel
    var totalPages: Int
    var totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(
        page: Int,
        results: [TVShowModelDecode],
        totalPages: Int,
        totalResults: Int
    ) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

@Model
class TVShowModel {
    
//    @Attribute(.unique)
    var id: Int
    var adult: Bool
    var backdropPath: String
    var genreIDs: [Int]
    var originCountry: [String]
    var originalLanguage: String
    var originalName: String
    var overview: String
    var popularity: Double
    var posterPath: String
    var posterImage: Data?
    var firstAirDate: String
    var name: String
    var voteAverage: Double
    var voteCount: Int
    var isPopular : Bool
    
    var urlToGetTVShowImage: URL? {
        let urlBase = "https://image.tmdb.org/t/p/w500"
        let url = URL(string: urlBase + posterPath)
        return url
    }
    
    var urlToGetBackdropImage : URL? {
        guard !backdropPath.isEmpty else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w1280" + backdropPath)
    }

    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case backdropPath = "backdrop_path"
        case genreIDs = "genre_ids"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case popularity
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case name
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case posterImage
    }

    init(
        id: Int,
        adult: Bool,
        backdropPath: String?,
        genreIDs: [Int],
        originCountry: [String],
        originalLanguage: String,
        originalName: String,
        overview: String,
        popularity: Double,
        posterPath: String,
        firstAirDate: String,
        name: String,
        voteAverage: Double,
        voteCount: Int,
        isPopular: Bool
    ) {
        self.id = id
        self.adult = adult
        self.backdropPath = backdropPath ?? ""
        self.genreIDs = genreIDs
        self.originCountry = originCountry
        self.originalLanguage = originalLanguage
        self.originalName = originalName
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.firstAirDate = firstAirDate
        self.name = name
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.isPopular = isPopular
    }
}

struct TVShowModelDecode: Identifiable, Codable {
    let id: Int
    var adult: Bool
    var backdropPath: String?
    var genreIDs: [Int]?
    var genres: [Genre]? // ✅ Ahora se usa correctamente
    var originCountry: [String]?
    var originalLanguage: String?
    var originalName: String?
    var overview: String?
    var popularity: Double?
    var posterPath: String?
    var firstAirDate: String?
    var lastAirDate: String?
    var name: String?
    var voteAverage: Double?
    var voteCount: Int?
    var numberOfEpisodes: Int?
    var numberOfSeasons: Int?
    var homepage: String?
    var status: String?
    var tagline: String?
    var type: String?
    var networks: [Network]?
    var createdBy: [Creator]?
    var seasons: [Season]?
    
    struct Genre: Codable {
        let id: Int
        let name: String
    }

    struct Network: Codable {
        let id: Int
        let name: String
        let logoPath: String?
        let originCountry: String?
    }

    struct Creator: Codable {
        let id: Int
        let name: String
        let originalName: String?
        let profilePath: String?
    }

    struct Season: Codable {
        let id: Int
        let name: String
        let overview: String?
        let airDate: String?
        let episodeCount: Int?
        let seasonNumber: Int?
        let posterPath: String?
    }

    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case backdropPath = "backdrop_path"
        case genreIDs = "genre_ids"
        case genres
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case popularity
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case lastAirDate = "last_air_date"
        case name
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case homepage
        case status
        case tagline
        case type
        case networks
        case createdBy = "created_by"
        case seasons
    }
}


extension TVShowModel {
    
    var viewImage: UIImage {
        guard let image = posterImage else { return UIImage(resource: .twoAndAHalfMen)}
        
        return UIImage(data: image) ?? UIImage(resource: .twoAndAHalfMen)
    }
    
    
    @ModelActor
    actor BackgroundActor {
        
        private var apiKey: String {
            Bundle.main.infoDictionary?["TMDB_API_KEY"] as? String ?? ""
        }
        
        func downloadTVShowImages() async {
            let filter = #Predicate<TVShowModel> { $0.posterImage == nil }
            guard let tvShowsWithOutImages = try? modelContext.fetch(FetchDescriptor(predicate: filter)) else { return }
            
            for tvShow in tvShowsWithOutImages {
                guard let url = tvShow.urlToGetTVShowImage else {continue}
//                print("Downloading tvShow image for \(tvShow.posterPath)")
                do {
                    let (data, _) = try await URLSession.shared.getData1(for: url)
                    tvShow.posterImage = data
                } catch {
                    print("Error downloading TVShow image for \(tvShow.posterPath) : \(error)")
                }
            }
            do {
                try modelContext.save()
            } catch {
                print("Error saving movie images: \(error.localizedDescription)")
            }
        }
        
        
        struct TVShows : Decodable {
            let results : [TVShow]
            struct TVShow : Decodable {
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
                
                enum CodingKeys: String, CodingKey {
                    case id
                    case adult
                    case backdropPath = "backdrop_path"
                    case genreIDs = "genre_ids"
                    case originCountry = "origin_country"
                    case originalLanguage = "original_language"
                    case originalName = "original_name"
                    case overview
                    case popularity
                    case posterPath = "poster_path"
                    case firstAirDate = "first_air_date"
                    case name
                    case voteAverage = "vote_average"
                    case voteCount = "vote_count"
                    case posterImage
                }
            }

        }
        
        func importTVShows() async throws {

            let url = URL(string: "https://api.themoviedb.org/3/trending/tv/week")!
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
            let queryItems: [URLQueryItem] = [
              URLQueryItem(name: "language", value: "en-US"),
              URLQueryItem(name: "page", value: "1"),
            ]
            components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

            var request = URLRequest(url: components.url!)
            request.httpMethod = "GET"
            request.timeoutInterval = 10
            request.allHTTPHeaderFields = [
              "accept": "application/json",
              "Authorization": "Bearer \(apiKey)"
            ]

            do {
                let (data, _) = try await URLSession.shared.getData2(for: request)
                let tvShows = try JSONDecoder().decode(TVShows.self, from: data)
                
                for tvShow in tvShows.results {

                    let existingTVShows = try modelContext.fetch(FetchDescriptor<TVShowModel>())
                    let existingTVShowIDs = Set(existingTVShows.map { $0.id })
                    
                        if !existingTVShowIDs.contains(tvShow.id){
                            let tvShowModel = TVShowModel(
                                id: tvShow.id,
                                adult: tvShow.adult,
                                backdropPath: tvShow.backdropPath,
                                genreIDs: tvShow.genreIDs,
                                originCountry: tvShow.originCountry,
                                originalLanguage: tvShow.originalLanguage,
                                originalName: tvShow.originalName,
                                overview: tvShow.overview,
                                popularity: tvShow.popularity,
                                posterPath: tvShow.posterPath,
                                firstAirDate: tvShow.firstAirDate,
                                name: tvShow.name,
                                voteAverage: tvShow.voteAverage,
                                voteCount: tvShow.voteCount,
                                isPopular: true
                            )
                            print("Importing TVShow: ", tvShowModel.name)
                            modelContext.insert(tvShowModel)
                        }
                    
                }
                try modelContext.save()
                await downloadTVShowImages()
            } catch {
                print("Error in the bacground task of importing TV Shows: \(error)")
            }
        }

    }
    
    @MainActor
    static var preview: ModelContainer {
        let previewContainer = try! ModelContainer(for: TVShowModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        // Crear un array de TV shows de ejemplo

        
        let sampleTVShows = [
            TVShowModel(id: 1, adult: false, backdropPath: "/backdrop1.jpg", genreIDs: [18, 10765], originCountry: ["US"], originalLanguage: "en", originalName: "Stranger Things", overview: "A group of kids uncovers mysterious events in their small town.", popularity: 85.6, posterPath: "/poster1.jpg", firstAirDate: "2016-07-15", name: "Stranger Things", voteAverage: 8.7, voteCount: 15000, isPopular: false),
            TVShowModel(id: 2, adult: false, backdropPath: "/backdrop2.jpg", genreIDs: [18, 10759], originCountry: ["US"], originalLanguage: "en", originalName: "Breaking Bad", overview: "A high school teacher turned meth producer.", popularity: 92.3, posterPath: "/poster2.jpg", firstAirDate: "2008-01-20", name: "Breaking Bad", voteAverage: 9.5, voteCount: 22000, isPopular: false),
            TVShowModel(id: 3, adult: false, backdropPath: "/backdrop3.jpg", genreIDs: [18, 10765, 9648], originCountry: ["US"], originalLanguage: "en", originalName: "The X-Files", overview: "FBI agents investigate paranormal phenomena.", popularity: 78.2, posterPath: "/poster3.jpg", firstAirDate: "1993-09-10", name: "The X-Files", voteAverage: 8.6, voteCount: 13000, isPopular: false),
            TVShowModel(id: 4, adult: false, backdropPath: "/backdrop4.jpg", genreIDs: [10759, 18, 10768], originCountry: ["US"], originalLanguage: "en", originalName: "24", overview: "Agent Jack Bauer prevents terrorist threats.", popularity: 75.1, posterPath: "/poster4.jpg", firstAirDate: "2001-11-06", name: "24", voteAverage: 8.4, voteCount: 9000, isPopular: false),
            TVShowModel(id: 5, adult: false, backdropPath: "/backdrop5.jpg", genreIDs: [35, 18], originCountry: ["US"], originalLanguage: "en", originalName: "Friends", overview: "Six friends navigate life in New York City.", popularity: 98.5, posterPath: "/poster5.jpg", firstAirDate: "1994-09-22", name: "Friends", voteAverage: 8.9, voteCount: 19000, isPopular: false),
            TVShowModel(id: 6, adult: false, backdropPath: "/backdrop6.jpg", genreIDs: [18, 10765], originCountry: ["US"], originalLanguage: "en", originalName: "The Mandalorian", overview: "A bounty hunter explores the galaxy.", popularity: 89.4, posterPath: "/poster6.jpg", firstAirDate: "2019-11-12", name: "The Mandalorian", voteAverage: 8.8, voteCount: 20000, isPopular: false),
            TVShowModel(id: 7, adult: false, backdropPath: "/backdrop7.jpg", genreIDs: [16, 10765], originCountry: ["JP"], originalLanguage: "ja", originalName: "Attack on Titan", overview: "Humans fight against man-eating giants.", popularity: 95.0, posterPath: "/poster7.jpg", firstAirDate: "2013-04-07", name: "Attack on Titan", voteAverage: 9.0, voteCount: 25000, isPopular: false),
            TVShowModel(id: 8, adult: false, backdropPath: "/backdrop8.jpg", genreIDs: [18, 9648], originCountry: ["US"], originalLanguage: "en", originalName: "Twin Peaks", overview: "FBI investigates a young woman's murder.", popularity: 70.3, posterPath: "/poster8.jpg", firstAirDate: "1990-04-08", name: "Twin Peaks", voteAverage: 8.5, voteCount: 8000, isPopular: false),
            TVShowModel(id: 9, adult: false, backdropPath: "/backdrop9.jpg", genreIDs: [16, 10759], originCountry: ["JP"], originalLanguage: "ja", originalName: "Naruto", overview: "A young ninja dreams of becoming Hokage.", popularity: 88.7, posterPath: "/poster9.jpg", firstAirDate: "2002-10-03", name: "Naruto", voteAverage: 8.6, voteCount: 21000, isPopular: false),
            TVShowModel(id: 10, adult: false, backdropPath: "/backdrop10.jpg", genreIDs: [18, 35], originCountry: ["US"], originalLanguage: "en", originalName: "The Office", overview: "A mockumentary on office life.", popularity: 82.9, posterPath: "/poster10.jpg", firstAirDate: "2005-03-24", name: "The Office", voteAverage: 8.9, voteCount: 19000, isPopular: false)
        ]
        
        for tvShow in sampleTVShows {
            previewContainer.mainContext.insert(tvShow)
        }

        return previewContainer
    }
}

extension TVShowModelDecode {
    func toTVShowModel() -> TVShowModel {
        return TVShowModel(
            id: self.id,
            adult: self.adult,
            backdropPath: self.backdropPath ?? "",
            genreIDs: self.genreIDs ?? [],
            originCountry: self.originCountry ?? [],
            originalLanguage: self.originalLanguage ?? "",
            originalName: self.originalName ?? "",
            overview: self.overview ?? "No hay descripción disponible.",
            popularity: self.popularity ?? 0.0,
            posterPath: self.posterPath ?? "",
            firstAirDate: self.firstAirDate ?? "Fecha desconocida",
            name: self.name ?? "",
            voteAverage: self.voteAverage ?? 0.0,
            voteCount: self.voteCount ?? 0,
            isPopular: false
        )
    }
}

@Model
class FavoriteTVShowModel {
    @Attribute(.unique) var id: Int
    var tvShow : TVShowModel
    
    init(tvShow: TVShowModel){
        self.id = tvShow.id
        self.tvShow = tvShow
    }
}

@Model
class PeopleResponseModel {
    var page: Int
    var results: [PersonModel]    // Array de personas
    var totalPages: Int
    var totalResults: Int

    // Mapeo de las claves JSON a las propiedades Swift
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(page: Int, results: [PersonModel], totalPages: Int, totalResults: Int) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

class PeopleResponseModelDecode: Decodable {
    var page: Int
    var results: [PersonModelDecode]    // Array de personas
    var totalPages: Int
    var totalResults: Int

    // Mapeo de las claves JSON a las propiedades Swift
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(page: Int, results: [PersonModelDecode], totalPages: Int, totalResults: Int) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

struct PersonModelDecode: Identifiable, Decodable {
    var id: Int
    var adult: Bool
    var gender: Int
    var knownForDepartment: String?
    var name: String
    var originalName: String
    var popularity: Double
    var profilePath: String?
    var profileImage: Data?
    
    var urlToGetPersonImage: URL? {
        guard let profilePath = profilePath else { return nil }
        let urlBase = "https://image.tmdb.org/t/p/w500"
        let url = URL(string: urlBase + profilePath)
        return url
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case gender
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case profileImage
    }
}

@Model
class PersonModel {
    
    @Attribute(.unique) var id: Int
    var adult: Bool
    var gender: Int
    var knownForDepartment: String
    var name: String
    var originalName: String
    var popularity: Double
    var profilePath: String?
    var profileImage: Data?
    
    var urlToGetPersonImage: URL? {
        guard let profilePath = profilePath else { return nil }
        let urlBase = "https://image.tmdb.org/t/p/w500"
        let url = URL(string: urlBase + profilePath)
        return url
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case gender
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case profileImage
    }
    
    init(
        id: Int,
        adult: Bool,
        gender: Int,
        knownForDepartment: String,
        name: String,
        originalName: String,
        popularity: Double,
        profilePath: String

    ) {
        self.id = id
        self.adult = adult
        self.gender = gender
        self.knownForDepartment = knownForDepartment
        self.name = name
        self.originalName = originalName
        self.popularity = popularity
        self.profilePath = profilePath
        
    }
}



extension PersonModel {
    
    var viewImage: UIImage {
        
        guard let image = profileImage else { return UIImage(resource: .diCaprio)}
        
        return UIImage(data: image) ?? UIImage(resource: .diCaprio)
    }
    
    
    @ModelActor
    actor BackgroundActor {
        
        private var apiKey: String {
            Bundle.main.infoDictionary?["TMDB_API_KEY"] as? String ?? ""
        }
        
        func downloadPeopleImages() async {
            let filter = #Predicate<PersonModel> { $0.profileImage == nil }
            guard let peopleWithOutImages = try? modelContext.fetch(FetchDescriptor(predicate: filter)) else { return }
            print("Downloading people images")
            for person in peopleWithOutImages {
                guard let url = person.urlToGetPersonImage else { break }

                do {
                    let (data, _) = try await URLSession.shared.getData1(for: url)
                    person.profileImage = data
                } catch {
                    print ("Error downloading person image: \(error.localizedDescription)")
                }
            }
            do {
                try modelContext.save()
            } catch {
                print("Error saving people images: \(error.localizedDescription)")
            }
        }
        
        struct People : Decodable {
            let results: [Person]
            struct Person : Decodable {
                
                var id: Int
                var adult: Bool
                var gender: Int
                var knownForDepartment: String
                var name: String
                var originalName: String
                var popularity: Double
                var profilePath: String
                
                enum CodingKeys: String, CodingKey {
                    case id
                    case adult
                    case gender
                    case knownForDepartment = "known_for_department"
                    case name
                    case originalName = "original_name"
                    case popularity
                    case profilePath = "profile_path"
                    
                }
            }
        }
                
                func importPeople() async throws {

                    let url = URL(string: "https://api.themoviedb.org/3/trending/person/week")!
                    var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
                    let queryItems: [URLQueryItem] = [
                      URLQueryItem(name: "language", value: "en-US"),
                      URLQueryItem(name: "page", value: "1"),
                    ]
                    components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

                    var request = URLRequest(url: components.url!)
                    request.httpMethod = "GET"
                    request.timeoutInterval = 10
                    request.allHTTPHeaderFields = [
                      "accept": "application/json",
                      "Authorization": "Bearer \(apiKey)"
                    ]

                    do {
                        let (data, _) = try await URLSession.shared.getData2(for: request)
                        let people = try JSONDecoder().decode(PeopleResponseModelDecode.self, from: data)
                        print("Importing people")
                        for person in people.results {
                            
                            let personModel = PersonModel(
                                id: person.id,
                                adult: person.adult,
                                gender: person.gender,
                                knownForDepartment: person.knownForDepartment ?? "",
                                name: person.name,
                                originalName: person.originalName,
                                popularity: person.popularity,
                                profilePath: person.profilePath ?? ""

                            )
//                            print(person.name)
                            modelContext.insert(personModel)


                        }
                        try modelContext.save()
                        await downloadPeopleImages()
                    } catch {
                        print("Error in the background task of importing people: (\(error))")
                    }
                    
                }
            }
    
    @MainActor
    static var preview: ModelContainer {
        let previewContainer = try! ModelContainer(for: PersonModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        // Crear un array de personas de ejemplo

        
        let samplePeople = [
            PersonModel(id: 1, adult: false, gender: 2, knownForDepartment: "Acting", name: "Leonardo DiCaprio", originalName: "Leonardo DiCaprio", popularity: 95.7, profilePath: "/profile1.jpg"),
            PersonModel(id: 2, adult: false, gender: 1, knownForDepartment: "Acting", name: "Scarlett Johansson", originalName: "Scarlett Johansson", popularity: 90.3, profilePath: "/profile2.jpg"),
            PersonModel(id: 3, adult: false, gender: 2, knownForDepartment: "Acting", name: "Tom Hanks", originalName: "Tom Hanks", popularity: 88.1, profilePath: "/profile3.jpg"),
            PersonModel(id: 4, adult: false, gender: 1, knownForDepartment: "Acting", name: "Meryl Streep", originalName: "Meryl Streep", popularity: 85.4, profilePath: "/profile4.jpg"),
            PersonModel(id: 5, adult: false, gender: 2, knownForDepartment: "Acting", name: "Brad Pitt", originalName: "Brad Pitt", popularity: 89.9, profilePath: "/profile5.jpg"),
            PersonModel(id: 6, adult: false, gender: 1, knownForDepartment: "Acting", name: "Jennifer Lawrence", originalName: "Jennifer Lawrence", popularity: 87.5, profilePath: "/profile6.jpg"),
            PersonModel(id: 7, adult: false, gender: 2, knownForDepartment: "Directing", name: "Steven Spielberg", originalName: "Steven Spielberg", popularity: 83.2, profilePath: "/profile7.jpg"),
            PersonModel(id: 8, adult: false, gender: 1, knownForDepartment: "Acting", name: "Emma Watson", originalName: "Emma Watson", popularity: 80.8, profilePath: "/profile8.jpg"),
            PersonModel(id: 9, adult: false, gender: 2, knownForDepartment: "Acting", name: "Chris Hemsworth", originalName: "Chris Hemsworth", popularity: 84.6, profilePath: "/profile9.jpg"),
            PersonModel(id: 10, adult: false, gender: 1, knownForDepartment: "Acting", name: "Natalie Portman", originalName: "Natalie Portman", popularity: 86.7, profilePath: "/profile10.jpg")
        ]
        
        for person in samplePeople {
            previewContainer.mainContext.insert(person)
        }
        return previewContainer
    }
        
    }

//Para decodificar la respuesta de details de una persona que es distinta a la que llega de popular people.
struct PersonDetailModel: Identifiable, Codable {
    let id: Int
    let name: String
    let biography: String?
    let birthday: String?
    let deathday: String?
    let gender: Int
    let placeOfBirth: String?
    let popularity: Double
    let profilePath: String?
    let knownForDepartment: String
    let alsoKnownAs: [String]
    var profileImage: Data?
    
    var urlToGetPersonImage: URL? {
        guard let profilePath = profilePath else { return nil }
        let urlBase = "https://image.tmdb.org/t/p/w500"
        let url = URL(string: urlBase + profilePath)
        return url
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, biography, birthday, deathday, gender, popularity
        case placeOfBirth = "place_of_birth"
        case profilePath = "profile_path"
        case knownForDepartment = "known_for_department"
        case alsoKnownAs = "also_known_as"
    }
    
    
    var viewImage: UIImage {
        
        guard let image = profileImage else { return UIImage(resource: .diCaprio)}
        
        return UIImage(data: image) ?? UIImage(resource: .diCaprio)
    }
    
}


extension URLSession {
    
    //EL término nonisolated se usa porque los actores aislan los datos para que no haya data racing, pero esto no es conveniente en este caso entonces quitamos ese aislamiento porque igual esta función es solo de lectura y no muta ni cmabia nada dentro del actor.
    public nonisolated func getData1(for url: URL) async throws -> (Data, URLResponse) {
        try await data(from: url)
    }
    
    public nonisolated func getData2(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await data(for: request)
    }

}



enum MediaType: String, Decodable {
    case movie, tv, person
}

struct SearchResult : Decodable, Identifiable, Hashable {
    let id: Int
    let title: String?
    let name: String?
    let mediaType: MediaType
    let posterPath: String?
    let backdropPath: String?
    let overview: String?
    let popularity: Double?
    let releaseDate: String?
    let firstAirDate: String?
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, name, overview, popularity
        case mediaType = "media_type"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case firstAirDate = "first_air_date"
        case profilePath = "profile_path"
    }
    
}

struct SearchResponse : Decodable {
    let results: [SearchResult]
}
