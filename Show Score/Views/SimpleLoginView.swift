//
//  SimpleLoginView.swift
//  Show Score
//
//  Created by Felipe Duarte on 6/02/25.
//

import SwiftUI

struct SimpleLoginView: View {
    
    @State var requestToken : String?
    @State private var sessionId : String? = UserDefaults.standard.string(forKey: "sessionId")

    @Environment(\.openURL) var openURL
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            if let sessionId = sessionId {
                VStack {
                    Text("Sesión activa")
                        .font(.title)
                        .foregroundColor(.green)

                    Button("Cargar películas favoritas") {
                        Task {
                            await getFavouriteMovies(sessionId: sessionId, modelContext: modelContext)
                        }
                    }

                    Button("Cerrar sesión") {
                        logout()
                    }
                }
            } else {
                VStack {
                    if let token = requestToken {
                        Button("Iniciar Sesión") {
                            if let url = URL(string: "https://www.themoviedb.org/authenticate/\(token)?redirect_to=showscoreapp://loginsuccessful") {
                                openURL(url)
                            }
                        }
                    } else {
                        Text("Cargando...")
                            .onAppear {
                                Task {
                                    self.requestToken = await createReQuestToken()
                                }
                            }
                    }

                    Button("Crear SessionID") {
                        Task {
                            if let tokenAuthenticated = self.requestToken {
                                let newSessionId = await createSessionId(token: tokenAuthenticated)
                                if let validSessionId = newSessionId {
                                    self.sessionId = validSessionId
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                let storedSessionId = UserDefaults.standard.string(forKey: "sessionId") ?? "No sessionId guardado"
                print("📌 sessionId al abrir la app: \(storedSessionId)")

                let isValid = await validateSession()
                if !isValid {
                    print("⚠️ Sesión inválida, eliminando sessionId guardado.")
                    UserDefaults.standard.removeObject(forKey: "sessionId")
                    self.sessionId = nil
                } else {
                    self.sessionId = UserDefaults.standard.string(forKey: "sessionId")
                    print("✅ Sesión válida, usando sessionId: \(self.sessionId ?? "None")")
                }
            }
        }
    }

    func logout() {
        UserDefaults.standard.removeObject(forKey: "sessionId")
        sessionId = nil
        print("Sesión cerrada correctamente.")
    }
}


#Preview {
    SimpleLoginView()
}
