//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 01.04.2021.
//

import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject var user: UserManager
    
    @AppStorage("is_registered") private var userRegisteredStored: Bool = false
    @AppStorage("user_name") private var userNameStored: String = ""

    
    var body: some View {
        
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]),
                           center: .topLeading,
                           startRadius: 5,
                           endRadius: UIScreen.main.bounds.height)
                .ignoresSafeArea()
                .onAppear(perform: {
                    user.isRegister = userRegisteredStored
                    user.name = userNameStored
                })
            
            if user.isRegister {
                ContentView()
            } else {
                RegisterView()
            }
            
        }
        
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
