//
//  HomeScreen.swift
//  Top
//
//  Created by Otto Willborn on 2023-01-05.
//

import Foundation
import SwiftUI
import SwiftUIRouter
import FirebaseAuth

// Main screen for app when logged in
struct HomeScreen: View {
    @EnvironmentObject private var navigator: Navigator
        
    var body: some View {
        SwitchRoutes{
            Text("HOME")
                .font(.title)
                .padding(30)
            Text(Auth.auth().currentUser?.uid ?? "")
                .font(.title)
                .padding(30)
            Text(Auth.auth().currentUser?.description ?? "")
                .font(.title)
                .padding(30)
            Button(action: {
                navigator.navigate("/login")
                signOut()
                }) {
                Text("Sign Out")
            }
        }
        .navigationTransition()
    }
}

