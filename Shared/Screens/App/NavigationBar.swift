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
                    Text("L")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(colors.black)
                .foregroundColor(colors.white)
                Button(action: {}) {
                    Text("M")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(colors.black)
                .foregroundColor(colors.white)
                Button(action: {navigator.navigate("/home")}) {
                    Text("T")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(colors.black)
                .foregroundColor(colors.white)
                Button(action: {}) {
                    Text("S")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(colors.black)
                .foregroundColor(colors.white)
                Button(action: {}) {
                    Text("P")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(colors.black)
                .foregroundColor(colors.white)
            }
        }
        
    }
    
}
