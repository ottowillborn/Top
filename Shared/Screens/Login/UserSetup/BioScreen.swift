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
    @EnvironmentObject var appFlowCoordinator: AppFlowCoordinator
    @State private var bio = ""
    
    let colors = Colors()
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Bio")
                    .font(.title)
                    .padding(30)
                TextField("Tell us abt urself", text: $bio )
                    .padding(15)
                    .background(colors.lightGray)
                    .cornerRadius(10)
                HStack(spacing: 20){
                    Button(action: {
                        UserDefaults.standard.set(false, forKey: "isForwardAnimation")
                        appFlowCoordinator.showLocationView()
                    }){
                        Text("Back")
                    }
                    Button(action: {
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
        .navigationBarHidden(true)
    }
}
