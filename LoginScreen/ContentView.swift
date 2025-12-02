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
            TextField("Usuário", text: $username).frame(maxWidth: 100)
            SecureField("Senha", text: $password).frame(maxWidth: 100)
            Button("Login", action: handleLogin)
            
            Button("Esqueci a senha") {
                alertMessage = "Função de recuperação de senha não implementada."
                showAlert = true
            }
        }
        .padding()
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
