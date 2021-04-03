//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 31.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Spacer()
            Text("Hi, \(user.name)!")
                .font(.title)
            Spacer()
            Text("\(timer.counter)")
                .font(.largeTitle)
            Spacer()
            ButtonView()
                .environmentObject(timer)
            Spacer()
            LogOutButtonView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    
    @EnvironmentObject var timer: TimeCounter
    
    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text("\(timer.buttonTitle)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct LogOutButtonView: View {
    
    @EnvironmentObject var user: UserManager
    
    @AppStorage("is_registered") private var userRegisteredStored = false
    @AppStorage("user_name") private var userNameStored = ""
    
    var body: some View {
        Button(action: { logOut() }) {
            Text("Log out")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
    
    private func logOut() {
        withAnimation(.spring()) {
            userRegisteredStored = false
            userNameStored = ""
            user.isRegister = false
            user.name = ""
        }
    }

}
