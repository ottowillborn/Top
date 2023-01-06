//
//  RandomUsers App
//  Created by Freek (github.com/frzi) 2021
//

import Foundation
import SwiftUI
import SwiftUIRouter

/// (18) This screen was added to demonstrate how easy it is to navigate to another parth of the app, as well as the
/// results of navigating to a path that doesn't exist, or isn't valid
struct SignUpScreen: View {
	@EnvironmentObject private var usersData: UsersData
    @EnvironmentObject private var navigator: Navigator
		
    var body: some View {
        SwitchRoutes{
            Text("Sign Up")
                .font(.title)
        }
        .navigationTransition()
    }
	
}
