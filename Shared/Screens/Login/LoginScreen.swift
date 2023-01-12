//
//  Top App
//  Created by otto 2023
//

import Foundation
import SwiftUI
import SwiftUIRouter
import FirebaseAuth
import PhotosUI
import Firebase

struct LoginScreen: View {
    @EnvironmentObject var appFlowCoordinator: AppFlowCoordinator
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showLoginError = ""
    @State var isActive: Bool = false
    

    let colors = Colors()
    
    var body: some View {
            ZStack(){
                Circle()
                    .scale(1.9)
                    .foregroundColor(colors.orange.opacity(0.5))
                Circle()
                    .scale(1.45)
                    .foregroundColor(.white)
                VStack(spacing: 15){
                    Image("topLogo")
                        .resizable()
                        .frame(maxWidth: 100, maxHeight: 100)
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
                    Button(action: {
                        signIn(email: email, password: password, completion: { error in
                            if error?.localizedDescription != nil {
                                showLoginError = error!.localizedDescription
                            }else{
                                appFlowCoordinator.showHomeView()
                            }
                        })
                    }){
                        Text("Log In")
                    }
                    .padding(15)
                    .background(colors.orange)
                    .cornerRadius(10)
                    .foregroundColor(Color.black)
                            
                    HStack(spacing: 0){
                        Text("Don't have an account? ")
                        Button(action: appFlowCoordinator.showSignUpView) {
                            Text("Sign Up")
                        }
                    }
                }
            }
            .padding([.trailing, .leading], 25)
            .padding(.bottom, 40)
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
