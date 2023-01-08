//
//  ProfileScreen.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-07.
//

import Foundation
import SwiftUI
import SwiftUIRouter
import FirebaseAuth
import PhotosUI
import Firebase

// Leaderboard screen
struct ProfileScreen: View {
    @EnvironmentObject private var navigator: Navigator
    @State private var name = ""
    @State private var bio = ""
    
    let colors = Colors()
    
    var body: some View {
        SwitchRoutes{
            Text("Profile")
                .font(.title)
                .padding(30)
            VStack{
                TextField("Name", text: $name )
                    .padding(15)
                    .background(colors.lightGray)
                    .cornerRadius(10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .safeAreaInset(edge: .bottom){
                NavigationBar()
            }
        }
    }
}
