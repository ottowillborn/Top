//
//  RandomUsers App
//  Created by Freek (github.com/frzi) 2021
//

import Foundation
import SwiftUI
import SwiftUIRouter
import FirebaseAuth

// Screen to register a new user using FirebaseAuth
struct SignUpScreen: View {
    @EnvironmentObject private var routeInformation: RouteInformation
    @EnvironmentObject private var navigator: Navigator
    @State private var email = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var showLoginError = ""

    let colors = Colors()
    
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
                Button(action: { register() }){
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
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                email = ""
                password = ""
                passwordConfirm = ""
                showLoginError = error!.localizedDescription
                print(error!.localizedDescription)
            }else{
                if password != passwordConfirm {
                    password = ""
                    passwordConfirm = ""
                    showLoginError = "Passwords must match"
                }else{
                    showLoginError = ""
                    // Because new user is "signed in"
                    signOut()
                    navigator.navigate("/login")
                }
            }
        }
    }
}
