//
//  NavigationBar.swift
//  Top
//
//  Created by Otto Willborn on 2023-01-07.
//

import Foundation
import SwiftUI
import SwiftUIRouter
import FirebaseAuth
import PhotosUI
import Firebase

// Nav bar
struct NavigationBar: View {
    @EnvironmentObject private var navigator: Navigator
    let colors = Colors()
    
    var body: some View {
        SwitchRoutes{
            HStack(spacing: -10){
                Button(action: {navigator.navigate("/leaderboard")}) {
                    Text(Image(systemName: "stairs"))
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(colors.black)
                .foregroundColor(colors.white)
                Button(action: {navigator.navigate("/messages")}) {
                    Text(Image(systemName: "bubble.right"))
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(colors.black)
                .foregroundColor(colors.white)
                Button(action: {navigator.navigate("/home")}) {
                    Text(Image(systemName: "house.circle"))
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(colors.black)
                .foregroundColor(colors.white)
                Button(action: {navigator.navigate("/settings")}) {
                    Text(Image(systemName: "gearshape"))
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(colors.black)
                .foregroundColor(colors.white)
                Button(action: {navigator.navigate("/profile")}) {
                    Text(Image(systemName: "person.crop.circle"))
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(colors.black)
                .foregroundColor(colors.white)
            }
        }
        
    }
    
}
