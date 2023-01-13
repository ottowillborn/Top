//
//  APICalls.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-07.
//

import Foundation
import SwiftUI
import FirebaseAuth
import PhotosUI
import Firebase

// Initiate a new users collection in database
class APICalls{
    
    static func initUser() {
        let date: Date = Date()
        print("in init")
        db.collection("users").document(Auth.auth().currentUser!.email!).setData([
            "creatonDate": date,
            "name": user.name!,
            "birthDate": user.birthDate,
            "location": user.location!,
            "bio": user.bio!,
            "photos": user.photos!
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    static func updateUser() {
        let userRef = db.collection("users").document(Auth.auth().currentUser!.email!)
        userRef.updateData([
            "name": UserDefaults.standard.string(forKey: "name")!,
            "birthDate": UserDefaults.standard.object(forKey: "birthDate")!,
            "location": UserDefaults.standard.string(forKey: "location")!,
            "bio": UserDefaults.standard.string(forKey: "bio")!,
            "photos": UserDefaults.standard.array(forKey: "photos")!,
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}

