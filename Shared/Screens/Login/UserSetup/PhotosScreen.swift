//
//  PhotosScreen.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-08.
//

import Foundation
import SwiftUI
import SwiftUIRouter
import FirebaseAuth
import PhotosUI
import Firebase

// Photos screen
struct PhotosScreen: View {
    @EnvironmentObject private var navigator: Navigator
    @State private var name = ""
    
    let colors = Colors()
    
    var body: some View {
        SwitchRoutes{
            Text("show me")
                .font(.title)
                .padding(30)
            VStack{
                Button(action: { navigator.navigate("..") }) {
                    Text("Back")
                }
                Button(action: { navigator.navigate("/home") }) {
                    Text("Submit")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
