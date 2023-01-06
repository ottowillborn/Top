//
//  RandomUsers App
//  Created by Freek (github.com/frzi) 2021
//

import SwiftUI
import SwiftUIRouter
final class UserClass: ObservableObject{
    var username = UserDefaults.standard.string(forKey: "username")
    var password = UserDefaults.standard.string(forKey: "password")
}

struct RootView: View {
	@EnvironmentObject private var navigator: Navigator
	var body: some View {
		VStack {
			/// (2) Render the top level routes. See (3).
            RootRoutes()
		}
		.onChange(of: navigator.path) { newPath in
			print("Current path:", newPath)
		}
    }

	@ViewBuilder
	private func toolbarContents() -> some View {
		Button(action: { navigator.goBack() }) {
			Image(systemName: "arrow.left")
		}
		.disabled(!navigator.canGoBack)
		.help("Go back")
	
		Button(action: { navigator.goForward() }) {
			Image(systemName: "arrow.right")
		}
		.disabled(!navigator.canGoForward)
		.help("Go forward")
		
		Button(action: { navigator.clear() }) {
			Image(systemName: "clear")
		}
		.disabled(!navigator.canGoBack && !navigator.canGoForward)
		.help("Clear history stacks")

		Button(action: { navigator.navigate("..") }) {
			Image(systemName: "arrow.turn.left.up")
		}
		.disabled(navigator.path == "/users" || navigator.path == "/shortcuts")
		.help("Go to parent")
	}
}
//struct AppPreview: PreviewProvider {
//    static var previews: some View{
//        Router{
//            RootView()
//        }
//    }
//}
// MARK: - Routes
/// (3) The only purpose of this view is to determine what to render depending on the path.
/// By using a simple view like this we can better separate our routing logic without obfuscating it with unrelated
/// code.
/// A component like this is called a 'Routes view', or simply 'Middleware'.
struct RootRoutes: View {
	var body: some View {
		SwitchRoutes {
            Route("home", content: HomeScreen())
			Route("signUp", content: SignUpScreen())
            Route("login/*", content: LoginScreen(username: "", password: ""))
			Route {
				Navigate(to: "/login", replace: true)
			}
		}
		.navigationTransition()
	}
}
