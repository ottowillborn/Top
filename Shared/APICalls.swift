//
//  APICalls.swift
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

// Initiate a new users collection in database
class APICalls{
    
    static func initUser(email: String) {
        let date: Date = Date()
        print("in init")
        db.collection("users").document(email).setData([
            "creatonDate": date
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    static func updateName(name: String) {
        let userRef = db.collection("users").document(Auth.auth().currentUser!.email!)
        userRef.updateData([
            "name": name
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}

