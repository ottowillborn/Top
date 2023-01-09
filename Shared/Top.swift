//
//  RandomUsers App
//  Created by Freek (github.com/frzi) 2021
//

import SwiftUI
import SwiftUIRouter
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

// User class holds values that will be preserved when app is closed.
final class UserClass: ObservableObject{
    var mainRoute = UserDefaults.standard.string(forKey: "mainRoute")
}

@main
struct Top: App {
    init(){
        FirebaseApp.configure()
    }
    let colors = Colors()
    let colors2 = Colors()
    
    var body: some Scene {
        WindowGroup {
			Router {
				RootView()
			}
        }
    }
}
