//
//  BioScreen.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-08.
//

import Foundation
import SwiftUI
import FirebaseAuth
import PhotosUI
import Firebase

// Bio screen
struct BioScreen: View {
    @EnvironmentObject var appFlowCoordinator: AppFlowCoordinator
    @State private var bio = ""
    
    let colors = Colors()
    
    var body: some View {
            VStack{
                
                Text("Bio") //make buble get bigger
                    .font(.title)
                    .padding(30)
                
                TextField("Tell us about yourself", text: $bio ).onAppear(){
                    self.bio = UserDefaults.standard.string(forKey: "bio")!
                }
                    .padding(15)
                    .background(colors.lightGray)
                    .cornerRadius(10)
                
                HStack(spacing: 20){
                    
                    Button(action: {
                        UserDefaults.standard.set(bio, forKey: "bio")
                        UserDefaults.standard.set(false, forKey: "isForwardAnimation")
                        appFlowCoordinator.showLocationView()
                    }){
                        Text("Back")
                    }
                    
                    Button(action: {
                        UserDefaults.standard.set(bio, forKey: "bio")
                        UserDefaults.standard.set(true, forKey: "isForwardAnimation")
                        appFlowCoordinator.showPhotosView()
                    }){
                        Text("Next")
                    }
                    
                }
            }
            .padding(25)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
}
