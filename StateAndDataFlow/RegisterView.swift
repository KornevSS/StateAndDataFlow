//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 31.03.2021.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var user: UserManager
    @State private var userName: String = ""
    
    @AppStorage("is_registered") private var userRegisteredStored: Bool = false
    @AppStorage("user_name") private var userNameStored: String = ""

    private var okButtonEnabled: Bool {
        userName.count >= 3
    }
    
    var body: some View {
        VStack (spacing: 20){
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            HStack {
                TextField("Enter your name", text: $userName)
                .font(.headline)
                .frame(height: 35)
                .padding(.horizontal)
                .multilineTextAlignment(.leading)
                .background(Color.white)
                .padding(.horizontal)
                .cornerRadius(10)
                
                Text(String(userName.count))
                    .foregroundColor(okButtonEnabled ? .green : .red)
                    .frame(width: 50)
                
            }
            Button(action: registerUser) {
                Image(systemName: "checkmark.circle")
                Text("Ok")
            }
            .disabled(!okButtonEnabled)
        }
    }
    
    private func registerUser() {
        withAnimation(.spring()) {
            if !userName.isEmpty {
                user.name = userName
                userNameStored = userName
                user.isRegister = true
                userRegisteredStored = true
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
