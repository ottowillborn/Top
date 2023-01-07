//
//  RandomUsers App
//  Created by Freek (github.com/frzi) 2021
//

import SwiftUI
import SwiftUIRouter
import Firebase
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
    
    var body: some Scene {
        WindowGroup {
			Router {
				RootView()
			}
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
