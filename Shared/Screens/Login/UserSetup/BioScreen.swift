//
//  BioScreen.swift
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

// Bio screen
struct BioScreen: View {
    @EnvironmentObject private var navigator: Navigator
    @State private var bio = ""
    
    let colors = Colors()
    
    var body: some View {
        SwitchRoutes{
            Text("Bio")
                .font(.title)
                .padding(30)
            VStack{
                TextField("Name", text: $bio )
                    .padding(15)
                    .background(colors.lightGray)
                    .cornerRadius(10)
                Button(action: { navigator.navigate("..") }) {
                    Text("Back")
                }
                Button(action: { navigator.navigate("/photosScreen") }) {
                    Text("Next")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
