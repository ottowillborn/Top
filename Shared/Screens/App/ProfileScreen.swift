//
//  ProfileScreen.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-07.
//

import Foundation
import SwiftUI
import FirebaseAuth
import PhotosUI
import Firebase

// Leaderboard screen
struct ProfileScreen: View {
    @State private var name = ""
    @State private var bio = ""
    
    let colors = Colors()
    
    var body: some View {
            Text("Profile")
                .font(.title)
                .padding(30)
            VStack{
                TextField("Name", text: $name )
                    .padding(15)
                    .background(colors.lightGray)
                    .cornerRadius(10)
                Button(action: {APICalls.updateUser()}) {
                    Text("upload")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
