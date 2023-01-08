//
//  MessagesScreen.swift
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
struct MessagesScreen: View {
    @EnvironmentObject private var navigator: Navigator
    
    var body: some View {
        SwitchRoutes{
            Text("Messages")
                .font(.title)
                .padding(30)
            VStack{
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .safeAreaInset(edge: .bottom){
                NavigationBar()
            }
        }
    }
}
