//
//  HomeScreen.swift
//  Top
//
//  Created by Otto Willborn on 2023-01-05.
//
import Foundation
import SwiftUI

    
struct HomeScreen: View {
        @State private var selectedTab = "home"

        var body: some View {
            
            TabView(selection: $selectedTab) {
                
                LeaderboardsScreen()
                    .onTapGesture {
                        selectedTab = "leaderboards"
                    }
                    .tabItem {
                        Label("leaderboards", systemImage: "stairs")
                    }
                    .tag("leaderboards")

                MessagesScreen()
                    .tabItem {
                        Label("Messages", systemImage: "bubble.left.fill")
                    }
                    .tag("messages")
                
                SwipingScreen()
                    .tabItem {
                        Label("Home", systemImage: "house") //put top logo here
                    }
                    .tag("home")
                
                ProfileScreen()
                    .tabItem {
                        Label("profile", systemImage: "person.fill")
                    }
                    .tag("profile")
                
                SettingsScreen()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                    .tag("settings")
            }
    }
}

