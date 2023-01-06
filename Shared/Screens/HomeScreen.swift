//
//  HomeScreen.swift
//  Top
//
//  Created by Otto Willborn on 2023-01-05.
//

import Foundation
import SwiftUI
import SwiftUIRouter

/// (18) This screen was added to demonstrate how easy it is to navigate to another parth of the app, as well as the
/// results of navigating to a path that doesn't exist, or isn't valid
struct HomeScreen: View {
    @EnvironmentObject private var usersData: UsersData
    @EnvironmentObject private var navigator: Navigator
    
    @StateObject var user = UserClass()
        
    var body: some View {
        SwitchRoutes{
            Text("HOME")
                .font(.title)
                .padding(30)
            Text(UserDefaults.standard.string(forKey: "username")!)
                .font(.title)
                .padding(30)
            Text(UserDefaults.standard.string(forKey: "password")!)
                .font(.title)
                .padding(30)
            Button(action: { navigator.navigate("..") }) {
                Text("Back")
            }
        }
        .environmentObject(user)
        .navigationTransition()
    }
    
}
