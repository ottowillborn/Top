//
//  RandomUsers App
//  Created by Freek (github.com/frzi) 2021
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

// User class holds values that will be preserved when app is closed.
final class UserClass: ObservableObject{
    var loggedIn = UserDefaults.standard.bool(forKey: "loggedIn")
}

@main

struct Top: App {
    init(){
        FirebaseApp.configure()
        // On app load: if user is logged in, set home page as main route, else set login page as main route.
        if Auth.auth().currentUser != nil {
            UserDefaults.standard.set(true, forKey: "loggedIn")
        } else {
            UserDefaults.standard.set(false, forKey: "loggedIn")
        }
    }
    var body: some Scene {
        WindowGroup{
            ContentView()
        }
    }
}
