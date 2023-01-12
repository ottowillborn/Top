//
//  RandomUsers App
//  Created by Freek (github.com/frzi) 2021
//

import Foundation
import SwiftUI
import SwiftUIRouter
import FirebaseAuth
import PhotosUI
import Firebase

let db = Firestore.firestore()
// MARK: - Navigation transition view modifier
extension View {
	func navigationTransition() -> some View {
		modifier(NavigationTransition())
	}
}

private struct NavigationTransition: ViewModifier {
	@EnvironmentObject private var navigator: Navigator
	
	private func transition(for direction: NavigationAction.Direction?) -> AnyTransition {
        return AnyTransition.opacity.animation(.easeInOut)

	}
	
	func body(content: Content) -> some View {
		content
			.transition(transition(for: navigator.lastAction?.direction))
	}
}

extension AnyTransition {
    static var nextslide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))}
}

extension AnyTransition {
    static var backslide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .leading),
            removal: .move(edge: .trailing))}
}
