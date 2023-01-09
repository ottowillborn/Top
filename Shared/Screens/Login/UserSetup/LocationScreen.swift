//
//  LocationScreen.swift
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

// Location screen
struct LocationScreen: View {
    @EnvironmentObject private var navigator: Navigator
    
    let colors = Colors()
    
    var body: some View {
        SwitchRoutes{
            Text("location pls")
                .font(.title)
                .padding(30)
            VStack{
                Button(action: { navigator.navigate("..") }) {
                    Text("Back")
                }
                Button(action: { navigator.navigate("/BioScreen") }) {
                    Text("Next")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
