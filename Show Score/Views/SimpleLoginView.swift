import SwiftUI

struct SimpleLoginView: View {
    @EnvironmentObject private var viewModel: LoginViewModel
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()

                VStack(spacing: 32) {
                    if let sessionId = viewModel.sessionId {
                        VStack(spacing: 12) {
                            if let avatarURL = avatarURL() {
                                AsyncImage(url: avatarURL) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                            .frame(width: 80, height: 80)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                            .shadow(radius: 4)
                                    case .failure:
                                        Image(systemName: "person.crop.circle.fill")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .foregroundColor(.gray)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            }

                            Text(viewModel.currentUser?.name ?? "Nombre")
                                .font(.title2)
                                .fontWeight(.semibold)

                            Text("@\(viewModel.currentUser?.username ?? "usuario")")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            Label("Sesión activa", systemImage: "checkmark.seal.fill")
                                .foregroundColor(.green)
                                .padding(.top, 8)
                        }

                        Button {
                            viewModel.logout()
                        } label: {
                            Text("Cerrar sesión")
                                .fontWeight(.medium)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.red.opacity(0.9))
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .padding(.horizontal)
                        
                    } else if let token = viewModel.requestToken {
                        VStack(spacing: 16) {
                            Text("Autenticación requerida")
                                .font(.headline)

                            Button {
                                if let url = URL(string: "https://www.themoviedb.org/authenticate/\(token)?redirect_to=showscoreapp://loginsuccessful") {
                                    openURL(url)
                                }
                                Task {
                                    await viewModel.fetchUserDetails()
                                }
                            } label: {
                                Text("Iniciar sesión con TMDB")
                                    .fontWeight(.medium)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                            .padding(.horizontal)
                        }
                    } else {
                        if viewModel.isLoading {
                            ProgressView("Cargando token de sesión...")
                                .padding()
                        } else {
                            Text("Preparando autenticación...")
                                .foregroundColor(.secondary)
                        }
                    }

                    if let error = viewModel.errorMessage {
                        Text("⚠️ \(error)")
                            .foregroundColor(.red)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }

                    Spacer()
                }
                .padding(.top, 60)
                .padding(.horizontal)
            }
            .onOpenURL { url in
                if url.scheme == "showscoreapp", url.host == "loginsuccessful" {
                    Task {
                        await viewModel.createSessionId()
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.validateStoredSession()
                    if viewModel.sessionId == nil {
                        await viewModel.fetchRequestToken()
                    }
                    await viewModel.fetchUserDetails()
                }
            }
        }
    }

    // Helper para generar el avatar URL
    private func avatarURL() -> URL? {
        if let path = viewModel.currentUser?.avatar.tmdb.avatarPath {
            return URL(string: "https://image.tmdb.org/t/p/w185\(path)")
        }
        return nil
    }
}

#Preview {
    SimpleLoginView()
        .environmentObject(LoginViewModel())
}
