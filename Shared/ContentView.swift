//
//  ContentView.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-09.
//

import SwiftUI
import UIKit
let user = UserClass()

struct ContentView: View {
    @EnvironmentObject var appFlowCoordinator: AppFlowCoordinator
    var body: some View {
        ZStack{
            if appFlowCoordinator.activeFlow == .login {
                LoginScreen()
            }
            else if appFlowCoordinator.activeFlow == .home {
                if #available(iOS 16.0, *) {
                    HomeScreen()
                } else {
                    // Fallback on earlier versions
                }
            }
            else if appFlowCoordinator.activeFlow == .signUp {
                SignUpScreen()
            }
            else if appFlowCoordinator.activeFlow == .name {
                if UserDefaults.standard.bool(forKey: "isForwardAnimation") {
                    NameScreen().transition(.nextslide)
                }else{
                    NameScreen().transition(.backslide)
                }
            }
            else if appFlowCoordinator.activeFlow == .birthday {
                if UserDefaults.standard.bool(forKey: "isForwardAnimation") {
                    BirthDayScreen().transition(.nextslide)
                }else{
                    BirthDayScreen().transition(.backslide)
                }
            }
            else if appFlowCoordinator.activeFlow == .location {
                if UserDefaults.standard.bool(forKey: "isForwardAnimation") {
                    LocationScreen().transition(.nextslide)
                }else{
                    LocationScreen().transition(.backslide)
                }
            }
            else if appFlowCoordinator.activeFlow == .bio {
                if UserDefaults.standard.bool(forKey: "isForwardAnimation") {
                    BioScreen().transition(.nextslide)
                }else{
                    BioScreen().transition(.backslide)
                }
            }
            else if appFlowCoordinator.activeFlow == .photos {
                if UserDefaults.standard.bool(forKey: "isForwardAnimation") {
                    PhotosScreen().transition(.nextslide)
                }else{
                    PhotosScreen().transition(.backslide)
                }
            }
            else {
                EmptyView()
            }
        }
        
    }
}

