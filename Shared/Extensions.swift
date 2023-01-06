//
//  RandomUsers App
//  Created by Freek (github.com/frzi) 2021
//

import Foundation
import SwiftUI
import SwiftUIRouter

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
