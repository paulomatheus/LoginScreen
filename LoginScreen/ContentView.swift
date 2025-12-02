//
//  ContentView.swift
//  LoginScreen
//
//  Created by Paulo Matheus on 02/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "lock.shield.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
                .padding(.top, 260)
                .padding(.bottom, 30)
            
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    TextField("Usuário", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200)
                    SecureField("Senha", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200)
                }
                VStack(spacing: 10) {
                    Button("Login", action: handleLogin)
                        .frame(width: 200)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    
                    Button("Esqueci a senha") {
                        alertMessage = "Liga no 0800 e pede ajuda =)"
                        showAlert = true
                    }
                    .foregroundColor(.blue)
                }
            }
            
            Spacer()
            
            Text("v13.04.203")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 1.0, green: 1.0, blue: 0.8))
        .ignoresSafeArea()
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    private func handleLogin() {
            if username == "Admin" && password == "123" {
                alertMessage = "Login feito com sucesso!"
            } else {
                alertMessage = "Credenciais invalidas"
            }
            showAlert = true
        }
}

#Preview {
    ContentView()
}
