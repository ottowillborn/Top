//
//  RandomUsers App
//  Created by Freek (github.com/frzi) 2021
//

import SwiftUI
import SwiftUIRouter

@main
struct Top: App {
    var body: some Scene {
        WindowGroup {
			/// (1) This is the first and perhaps the most important step when using SwiftUI Router.
			/// The `Router` view initializes all necessary environment values and objects. Every view in the
			/// SwiftUI Router library works only inside a `Router`.
			///
			/// Although it isn't necessary to put the `Router` at the `App` level, it is recommended to put it as
			/// high as possible in your View hierarchy.
			Router {
				RootView()
			}
        }
    }
}
