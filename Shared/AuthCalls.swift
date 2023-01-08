//
//  AuthCalls.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-07.
//

import Foundation
import SwiftUI
import SwiftUIRouter
import FirebaseAuth
import PhotosUI
import Firebase

// Create a new auth user
class AuthCalls{
    func createUser(email: String, password: String) {
            Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
                if let user = authResult?.user {
                    print(user)
                } else {
                    print("error in user")
                }
            }
        }
}
