//
//  Utilities.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-06.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import SwiftUIRouter

// Sign user out in Firebase and set default route to login
func signOut(){
    UserDefaults.standard.set("login", forKey: "mainRoute")
    do {
        try Auth.auth().signOut()
    } catch let signOutError as NSError {
        print("Error signing out: %@", signOutError)
    }
}

// Global color pallet
struct Colors {
    let babyBlue = Color(#colorLiteral(red: 0.3326984644, green: 0.7221618891, blue: 1, alpha: 1))
    let blue1 = Color(#colorLiteral(red: 0.3034266829, green: 0.5427354574, blue: 1, alpha: 1))
    let lightGray = Color(#colorLiteral(red: 0.8124992251, green: 0.8971869349, blue: 0.8967813849, alpha: 1))
    let darkGray = Color(#colorLiteral(red: 0.624907136, green: 0.600016892, blue: 0.6044846773, alpha: 1))
    let black = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    let white = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    let orange = Color(#colorLiteral(red: 0.9417511225, green: 0.6201518178, blue: 0.2676982284, alpha: 1))
    let redError = Color(#colorLiteral(red: 0.853534162, green: 0, blue: 0, alpha: 1))
}

extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 0.3)?.base64EncodedString()
    }
}

extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}
