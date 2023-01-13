//
//  Top App
//  Created otto 2023
//

import Foundation
import SwiftUI
import FirebaseAuth
import PhotosUI
import Firebase

// Screen to register a new user using FirebaseAuth
struct SignUpScreen: View {
    @EnvironmentObject var appFlowCoordinator: AppFlowCoordinator
    @State private var email = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var showLoginError = ""
    @State private var showPasswordError = ""
    @State var isActive: Bool = false
    

    let colors = Colors()
    
    var body: some View {
            VStack(spacing: 15){
                Text("Register")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
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
                //add isactive
                    Button(action: {
                        if password != passwordConfirm {
                            password = ""
                            passwordConfirm = ""
                            showPasswordError = "Passwords must match"
                            return
                        }
                        signUp(email: email, password: password, completion: { error in
                            if error?.localizedDescription != nil {
                                showLoginError = error!.localizedDescription
                            }else{
                                APICalls.initUser()
                                UserDefaults.standard.set(true,forKey: "isForwardAnimation")
                                appFlowCoordinator.showNameView()
                            }
                        })
                    }){
                        Text("Register")
                    }
            }
            .padding([.trailing, .leading], 25)
            .padding(.top, 30)
            .padding(.bottom, 10)
    }
    
    // Validate and register new user
    func signUp(email: String, password: String, completion:@escaping (_ error: Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(error) //<-- Here
        } else {
            completion(nil)
            }
        }
    }
}


