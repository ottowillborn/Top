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
    // Preserve name
    @State private var name = ""
    
    let colors = Colors()
    
    var body: some View {
        NavigationView{
            VStack(spacing: 15){
                
                Text("Who the fuck are you")
                    .font(.title)
                    .padding(30)
                
                TextField("Name", text: $name ).onAppear(){
                    self.name = UserDefaults.standard.string(forKey: "name")!
                }
                    .padding(15)
                    .background(colors.lightGray)
                    .cornerRadius(10)
                
                VStack{
                    if !name.isEmpty{
                        NavigationLink(destination: BirthDayScreen().onAppear {
                            UserDefaults.standard.set(name, forKey: "name")
                        }) {
                            Text("Next")
                        }
                    }
                }
                .frame(width: 40, height: 20)
                
            }
            .padding(25)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarHidden(true)
    }
}

