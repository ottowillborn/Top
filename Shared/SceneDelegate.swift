//
//  SceneDelegate.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-10.
//

import UIKit
import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        let appFlowCoordinator = AppFlowCoordinator()
        let rootView = RootView().environmentObject(appFlowCoordinator)
        window.rootViewController = UIHostingController(rootView: rootView)
        self.window = window
        self.window?.overrideUserInterfaceStyle = .light
        window.makeKeyAndVisible()
    }
}
