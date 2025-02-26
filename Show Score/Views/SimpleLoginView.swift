//
//  SimpleLoginView.swift
//  Show Score
//
//  Created by Felipe Duarte on 6/02/25.
//

import SwiftUI

struct SimpleLoginView: View {
    
    @State private var loginSuccess: Bool = false
    @State var requestToken : String?
    @State var sessionId : String?
    
    @Environment(\.openURL) var openURL
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        
        
        NavigationStack{
            if let token = requestToken {
                Button("Inicia sesión") {
                    if let url = URL(string: "https://www.themoviedb.org/authenticate/\(token)?redirect_to=showscoreapp://loginsuccessful") {
                        openURL(url)
                    }
                }
                .font(.title)
                .foregroundColor(.blue)
            } else {
                Text("Loading...")
                    .onAppear {
                        Task {
                            self.requestToken = await createReQuestToken()
    //                        if let tokenAuthenticated = self.requestToken {
    //                            self.sessionId = await createSessionId(token: tokenAuthenticated)
    //                        } else {
    //                            print( "No se obtuvo el token")
    //                        }
                            
                        }
                    }

            }
            Button("Create SessionID"){
                Task {
                    if let tokenAuthenticated = self.requestToken {
                        self.sessionId = await createSessionId(token: tokenAuthenticated)
                        print("Al menos se intentó crear la session")
                    } else {
                        print( "No se obtuvo el token")
                    }
                }
            }
            Button("Cargar las películas"){
                Task {
                    await getFavouriteMovies(sessionId: self.sessionId!, modelContext: modelContext)
                }

            }
            Button("Cargar los TV Shows") {
                Task {
                    await getFavouriteTVShows(sessionId: self.sessionId!, modelContext: modelContext)
                }
            }
        }
        

    }
    
}



#Preview {
    SimpleLoginView()
}
