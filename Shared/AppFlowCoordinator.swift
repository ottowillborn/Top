//
//  AppFlowCoordinator.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-10.
//

import SwiftUI

final class AppFlowCoordinator: ObservableObject {
    @Published var activeFlow: Flow = .login
    
    func showLoginView() {
        withAnimation {
            activeFlow = .login
        }
    }
    
    func showMainView() {
        withAnimation {
            activeFlow = .main
        }
    }
    
    func showHomeView() {
        withAnimation() {
            activeFlow = .home
        }
    }
    
    func showSignUpView() {
        withAnimation() {
            activeFlow = .signUp
        }
    }
    
    func showNameView(animationDirection: String) {
        UserDefaults.standard.set(animationDirection, forKey: "animationDirection")
        withAnimation() {
            activeFlow = .name
        }
    }
    
    func showBirthdayView(animationDirection: String) {
        UserDefaults.standard.set(animationDirection, forKey: "animationDirection")
        withAnimation() {
            activeFlow = .birthday
        }
    }
}

extension AppFlowCoordinator {
    enum Flow {
        case login, main, home, signUp, name, birthday
    }
}
