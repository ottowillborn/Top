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
        withAnimation(.easeInOut(duration: 3)) {
            activeFlow = .home
        }
    }
    
    func showSignUpView() {
        withAnimation() {
            activeFlow = .signUp
        }
    }
    
    func showNameView() {
        withAnimation() {
            activeFlow = .name
        }
    }
    
    func showBirthdayView() {
        withAnimation() {
            activeFlow = .birthday
        }
    }
    
    func showLocationView() {
        withAnimation() {
            activeFlow = .location
        }
    }
    
    func showBioView() {
        withAnimation() {
            activeFlow = .bio
        }
    }
    
    func showPhotosView() {
        withAnimation() {
            activeFlow = .photos
        }
    }
}

extension AppFlowCoordinator {
    enum Flow {
        case login,
             main,
             home,
             signUp,
             name,
             birthday,
             location,
             bio,
             photos
    }
}
