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
                    .animation(.easeInOut, value: 2)
            }
            else if appFlowCoordinator.activeFlow == .name {
                if UserDefaults.standard.string(forKey: "slideDirection") == "forward" {
                    NameScreen().transition(.nextslide)
                }else{
                    NameScreen().transition(.backslide)
                }
                
            }
            else if appFlowCoordinator.activeFlow == .birthday {
                if UserDefaults.standard.string(forKey: "slideDirection") == "forward" {
                    BirthDayScreen().transition(.nextslide)
                }else{
                    BirthDayScreen().transition(.backslide)
                }
                }
            else {
                EmptyView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppFlowCoordinator())
    }
}
