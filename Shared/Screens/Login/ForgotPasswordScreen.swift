//
//  ForgotPasswordScreen.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-06.
//

import Foundation
import SwiftUI
import FirebaseAuth

//Password reset screen, WIP
struct ForgotPasswordScreen: View {
    @State private var email = ""

    let lightGray = Color(#colorLiteral(red: 0.8124992251, green: 0.8971869349, blue: 0.8967813849, alpha: 1))
    let orange = Color(#colorLiteral(red: 0.9417511225, green: 0.6201518178, blue: 0.2676982284, alpha: 1))
    let redError = Color(#colorLiteral(red: 0.853534162, green: 0, blue: 0, alpha: 1))
    
    var body: some View {
            Text("Reset Password")
                .font(.largeTitle)
                .padding(.bottom, 20)
            VStack(spacing: 15){
                TextField("Email", text: $email )
                    .padding(15)
                    .background(lightGray)
                    .cornerRadius(10)

                Button(action: {
                    Auth.auth().sendPasswordReset(withEmail: email) { error in
                        if error != nil {
                            print(error!.localizedDescription)
                        }
                    }
                    }){
                    Text("Send password reset email")
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
}
