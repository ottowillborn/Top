//
//  RandomUsers App
//  Created by Freek (github.com/frzi) 2021
//

import Foundation
import SwiftUI
import SwiftUIRouter

/// (18) This screen was added to demonstrate how easy it is to navigate to another parth of the app, as well as the
/// results of navigating to a path that doesn't exist, or isn't valid
struct SignUpScreen: View {
    @EnvironmentObject private var routeInformation: RouteInformation
    @EnvironmentObject private var navigator: Navigator
    @State private var username = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var showLoginError = false
    @State private var showPasswordError = false

    let lightGray = Color(#colorLiteral(red: 0.8124992251, green: 0.8971869349, blue: 0.8967813849, alpha: 1))
    let orange = Color(#colorLiteral(red: 0.9417511225, green: 0.6201518178, blue: 0.2676982284, alpha: 1))
    let redError = Color(#colorLiteral(red: 0.853534162, green: 0, blue: 0, alpha: 1))
    
    var body: some View {
        SwitchRoutes {
            Text("Register")
                .font(.largeTitle)
                .padding(.bottom, 20)
            VStack(spacing: 15){
                TextField("Username", text: $username )
                    .padding(15)
                    .background(lightGray)
                    .cornerRadius(10)
                SecureField("Password", text: $password )
                    .padding(15)
                    .background(lightGray)
                    .cornerRadius(10)
                SecureField("Confirm Password", text: $passwordConfirm )
                    .padding(15)
                    .background(lightGray)
                    .cornerRadius(10)
                if showLoginError {
                    Text("Invalid username or password")
                        .foregroundColor(redError)
                }
                if showPasswordError {
                    Text("Passwords must match")
                        .foregroundColor(redError)
                }
                Button(action: {
                    if username.isEmpty || password.isEmpty {
                        password = ""
                        username = ""
                        passwordConfirm = ""
                        showLoginError = true
                        showPasswordError = false
                        return
                    }else if password != passwordConfirm {
                        passwordConfirm = ""
                        showPasswordError = true
                    }else{
                        showLoginError = false
                        UserDefaults.standard.set(username, forKey: "username")
                        UserDefaults.standard.set(password, forKey: "password")
                        navigator.navigate("..")
                    }
                    }){
                    Text("Submit")
                }
                .padding(15)
                .background(orange)
                .cornerRadius(10)
                .foregroundColor(Color.black)
            }
            .padding([.trailing, .leading], 25)
            .padding(.top, 30)
            .padding(.bottom, 10)
        }
        .navigationTransition()
    }
}
