//
//  Top App
//  Created by otto
//

import SwiftUI
import SwiftUIRouter
import FirebaseAuth
import Firebase

let user = UserClass()

struct RootView: View {
	@EnvironmentObject private var navigator: Navigator
    
    init(){
        // On app load: if user is logged in, set home page as main route, else set login page as main route.
        if Auth.auth().currentUser != nil {
            UserDefaults.standard.set("home", forKey: "mainRoute")
        } else {
            UserDefaults.standard.set("login", forKey: "mainRoute")
        }
        
    }
    
    // Load root
	var body: some View {
		VStack {
            RootRoutes()
		}
		.onChange(of: navigator.path) { newPath in
			print("Current path:", newPath)
		}
    }
}

struct RootRoutes: View {
	var body: some View {
        // Router for app navigation
		SwitchRoutes {
            if #available(iOS 16.0, *) {
                Route("home", content: HomeScreen())
            } else {
                // Fallback on earlier versions
            }
			Route("signUp", content: SignUpScreen())
            Route("forgotPassword", content: ForgotPasswordScreen())
            Route("login", content: LoginScreen(email: "", password: ""))
            
            Route("leaderboard", content: LeaderboardScreen())
            Route("profile", content: ProfileScreen())
            Route("messages", content: MessagesScreen())
            Route("settings", content: SettingsScreen())
            
			Route {
                Navigate(to: "/"+user.mainRoute!, replace: true)
			}
		}
	}
}
