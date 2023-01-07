//
//  RandomUsers App
//  Created by Freek (github.com/frzi) 2021
//

import Foundation
import SwiftUI
import SwiftUIRouter
import FirebaseAuth

struct LoginScreen: View {
    @EnvironmentObject private var routeInformation: RouteInformation
    @EnvironmentObject private var navigator: Navigator
    @State var email: String
    @State var password: String
    @State private var showLoginError = false

    let colors = Colors()
    
    var body: some View {
        SwitchRoutes {
            ZStack(){
                Circle()
                    .scale(1.9)
                    .foregroundColor(colors.orange.opacity(0.5))
                Circle()
                    .scale(1.45)
                    .foregroundColor(.white)
                VStack(spacing: 15){
                    Text("Top")
                        .font(.largeTitle)
                        .padding(.bottom, 40)
                    TextField("Email", text: $email )
                        .padding(15)
                        .background(colors.lightGray)
                        .cornerRadius(10)
                    SecureField("Password", text: $password )
                        .padding(15)
                        .background(colors.lightGray)
                        .cornerRadius(10)
                    if showLoginError {
                        Text("Invalid Login")
                            .foregroundColor(colors.redError)
                    }
                    Button(action: {
                        login()
                    }){
                        Text("Log In")
                    }
                    .padding(15)
                    .background(colors.orange)
                    .cornerRadius(10)
                    .foregroundColor(Color.black)
                    HStack(spacing: 0){
                        Text("Don't have an account?")
                        Button(action: { navigator.navigate("/signUp") }) {
                            Text("Sign Up")
                        }
                        .padding(10)
                    }
                    HStack(spacing: 0){
                        Text("Forgot Password?")
                        Button(action: {navigator.navigate("/forgotPassword")}) {
                            Text("Reset Password")
                        }
                        .padding(10)
                    }
                }
            }
            .padding([.trailing, .leading], 25)
            .padding(.bottom, 40)
            
        }
        .navigationTransition()
    }
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
                showLoginError = true
            }else{
                navigator.navigate("/home")
                showLoginError = false
            }
        }
    }
}
