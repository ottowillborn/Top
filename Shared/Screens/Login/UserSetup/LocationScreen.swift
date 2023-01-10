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
    @State private var location = ""
    let colors = Colors()
    
    var body: some View {
        NavigationView{
            VStack{
                Text("location pls")
                    .font(.title)
                    .padding(30)
                TextField("Location", text: $location )
                    .padding(15)
                    .background(colors.lightGray)
                    .cornerRadius(10)
                HStack(spacing: 20){
                    NavigationLink(destination: BirthDayScreen()) {
                        Text("Back")
                    }
                    NavigationLink(destination: BioScreen()) {
                        Text("Next")
                    }
                }
            }
            .padding(25)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarHidden(true)
    }
}
