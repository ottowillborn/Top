//
//  RandomUsers App
//  Created by Freek (github.com/frzi) 2021
//

import Foundation
import SwiftUI
import SwiftUIRouter
import FirebaseAuth
import PhotosUI
import Firebase

// Screen to register a new user using FirebaseAuth
struct SignUpScreen: View {
    @EnvironmentObject private var routeInformation: RouteInformation
    @EnvironmentObject private var navigator: Navigator
    @State private var email = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var showLoginError = ""
    @State private var showPasswordError = ""

    let colors = Colors()
    let user = UserClass()
    let authCalls = AuthCalls()
    
    var body: some View {
        SwitchRoutes {
            Text("Register")
                .font(.largeTitle)
                .padding(.bottom, 20)
            VStack(spacing: 15){
                TextField("Email", text: $email )
                    .padding(15)
                    .background(colors.lightGray)
                    .cornerRadius(10)
                SecureField("Password", text: $password )
                    .padding(15)
                    .background(colors.lightGray)
                    .cornerRadius(10)
                SecureField("Confirm Password", text: $passwordConfirm )
                    .padding(15)
                    .background(colors.lightGray)
                    .cornerRadius(10)
                    Text(showLoginError)
                        .foregroundColor(colors.redError)
                    Text(showPasswordError)
                        .foregroundColor(colors.redError)
                Button(action: {
                    register()
                }){
                    Text("Submit")
                }
                .padding(15)
                .background(colors.orange)
                .cornerRadius(10)
                .foregroundColor(Color.black)
                Button(action: { navigator.navigate("..") }) {
                    Text("Back")
                }
                .padding(30)
            }
            .padding([.trailing, .leading], 25)
            .padding(.top, 30)
            .padding(.bottom, 10)
        }
        .navigationTransition()
    }
    
    // Validate and submit new account registration
    func register(){
        if password != passwordConfirm {
            password = ""
            passwordConfirm = ""
            showPasswordError = "Passwords must match"
        }
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
                print(user)
                APICalls.initUser(email: user.email!)
                showLoginError = ""
                navigator.navigate("/nameScreen")
            } else {
                showLoginError = error!.localizedDescription
            }
        }
    }
}


