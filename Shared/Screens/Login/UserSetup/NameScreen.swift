//
//  NameScreen.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-08.
//

import Foundation
import SwiftUI
import FirebaseAuth
import PhotosUI
import Firebase

// Name screen
struct NameScreen: View {
    @EnvironmentObject var appFlowCoordinator: AppFlowCoordinator

    // Preserve name
    @State private var name = ""
    
    let colors = Colors()
    
    var body: some View {
            VStack(spacing: 15){
                
                Text("First Name")
                    .font(.title)
                    .padding(30)
                
                TextField("Name", text: $name ).onAppear(){
                    self.name = UserDefaults.standard.string(forKey: "name")!
                }
                    .padding(15)
                    .background(colors.lightGray)
                    .cornerRadius(10)
                
                VStack{
                    
                        Button(action: {
                            UserDefaults.standard.set(name, forKey: "name")
                            UserDefaults.standard.set(true, forKey: "isForwardAnimation")
                            appFlowCoordinator.showBirthdayView()
                        }){
                            Text("Next")
                        }
                    
                }
                .frame(width: 40, height: 20)
                
            }
            .padding(25)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

