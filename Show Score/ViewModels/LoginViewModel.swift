import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var requestToken: String? = UserDefaults.standard.string(forKey: "requestToken")
    @Published var sessionId: String? = UserDefaults.standard.string(forKey: "sessionId")
    
    @Published var tokenRequested: Bool = false
    @Published var isSessionCreated: Bool = false
    @Published var isCreatingSession: Bool = false  // Bandera para evitar múltiples llamadas
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    var onLoginSuccess: (() -> Void)? = nil
    
    @Published var currentUser: UserModel?
    
    
    private var apiKey: String {
        Bundle.main.infoDictionary?["TMDB_API_KEY"] as? String ?? ""
    }
    
    private var authHeader: [String: String] {
        [
            "accept": "application/json",
            "Authorization": "Bearer \(apiKey)",
            "content-type": "application/json"
        ]
    }
    
    // MARK: - Obtener Request Token
    func fetchRequestToken() async {
        print("🔐 apiKey desde Info.plist: \(apiKey)")
        print("📩 authHeader: \(authHeader)")
        isLoading = true
        defer { isLoading = false }

        guard let url = URL(string: "https://api.themoviedb.org/3/authentication/token/new") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = authHeader

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoded = try JSONDecoder().decode(RequestTokenResponse.self, from: data)
            self.requestToken = decoded.request_token
            UserDefaults.standard.set(decoded.request_token, forKey: "requestToken")
            print("la apikey escondida es \(apiKey)")
            print("🎫 Token obtenido: \(decoded.request_token)")
            self.tokenRequested = true
        } catch {
            errorMessage = "Error al obtener token"
            print("❌ Error al obtener el request token: \(error)")
        }
    }
    
    // MARK: - Crear sesión
    @MainActor
    func createSessionId() async {
        // Evitar llamadas repetidas si ya se está creando la sesión
        guard !isCreatingSession else {
            print("Ya se está creando la sesión")
            return
        }
        isCreatingSession = true
        defer { isCreatingSession = false }
        
        guard let token = requestToken else {
            errorMessage = "No hay token disponible"
            return
        }

        isLoading = true
        defer { isLoading = false }

        guard let url = URL(string: "https://api.themoviedb.org/3/authentication/session/new") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = authHeader

        let body = ["request_token": token]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoded = try JSONDecoder().decode(SessionIdResponse.self, from: data)

            if decoded.success {
                self.sessionId = decoded.session_id
                self.isSessionCreated = true
                UserDefaults.standard.set(decoded.session_id, forKey: "sessionId")
                print("✅ Sesión creada: \(decoded.session_id)")
                onLoginSuccess?()
            } else {
                errorMessage = "No se pudo crear la sesión"
            }
        } catch {
            errorMessage = "Error al crear sesión"
            print("❌ Error al crear sesión: \(error)")
        }
    }
    
    // MARK: - Validar sesión
    func validateStoredSession() async {
        guard let sessionId = UserDefaults.standard.string(forKey: "sessionId") else {
            print("No hay sesión guardada.")
            self.sessionId = nil
            return
        }

        guard let url = URL(string: "https://api.themoviedb.org/3/account?session_id=\(sessionId)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = authHeader

        do {
            try await Task.sleep(nanoseconds: 500_000_000) // pequeña espera
            let (_, response) = try await URLSession.shared.data(for: request)

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                print("✅ Sesión válida.")
                self.sessionId = sessionId
            } else {
                print("❌ Sesión inválida.")
                UserDefaults.standard.removeObject(forKey: "sessionId")
                self.sessionId = nil
            }
        } catch {
            print("❌ Error al validar la sesión: \(error)")
        }
    }
    
    func fetchUserDetails() async {
        

        let url = URL(string: "https://api.themoviedb.org/3/account/20701631")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer \(apiKey)"
        ]

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            print("Decodificando datos de usuario")
            let decoder = JSONDecoder()
            let userDecoded = try decoder.decode(UserModelDecode.self, from: data)
            self.currentUser = userDecoded.toUserModel()
        } catch {
            print("Error fetching users data: \(error)")
        }
        
    }

    // MARK: - Cerrar sesión
    func logout() {
        UserDefaults.standard.removeObject(forKey: "sessionId")
        sessionId = nil
        print("🚪 Sesión cerrada")
    }
}

