//
//  RandomUsers App
//  Created by Freek (github.com/frzi) 2021
//

import Foundation
import SwiftUI
import SwiftUIRouter
import FirebaseAuth

struct LoginScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showLoginError = ""
    @State var isActive: Bool = false

    let colors = Colors()
    
    var body: some View {
        NavigationView {
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
                    Text(showLoginError)
                        .foregroundColor(colors.redError)
                    if #available(iOS 16.0, *) {
                        NavigationLink(destination: HomeScreen(), isActive: $isActive) {
                            ZStack{
                                Button(action: {
                                    signIn(email: email, password: password, completion: { error in
                                        if error?.localizedDescription != nil {
                                            showLoginError = error!.localizedDescription
                                            isActive = false
                                        }else{
                                            isActive = true
                                        }
                                    })
                                }){
                                    Text("Log In")
                                }
                                .padding(15)
                                .background(colors.orange)
                                .cornerRadius(10)
                                .foregroundColor(Color.black)
                            }
                        }
                    } else {
                        // Fallback on earlier versions
                    }
    
                    HStack(spacing: 0){
                        Text("Don't have an account? ")
                        NavigationLink(destination: SignUpScreen(isActive: false), label: {
                            Text("Sign Up")
                        })
                    }
                }
            }
            .padding([.trailing, .leading], 25)
            .padding(.bottom, 40)
            
        }
    }
    
    func signIn(email: String, password: String, completion:@escaping (_ error: Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(error) //<-- Here
        } else {
            completion(nil)
            }
        }
    }
}
