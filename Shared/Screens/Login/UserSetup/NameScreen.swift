//
//  NameScreen.swift
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

// Name screen
struct NameScreen: View {
    @State private var name = ""
    
    let colors = Colors()
    
    var body: some View {
        NavigationView{
            VStack(spacing: 15){
                Text("Who the fuck are you")
                    .font(.title)
                    .padding(30)
                TextField("Name", text: $name )
                    .padding(15)
                    .background(colors.lightGray)
                    .cornerRadius(10)
                HStack(spacing: 20){
                    NavigationLink(destination: BirthDayScreen()) {
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
