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
    @EnvironmentObject var appFlowCoordinator: AppFlowCoordinator

    @State private var name = ""
    
    let colors = Colors()
    
    var body: some View {
            VStack{
                Text("show me")
                    .font(.title)
                    .padding(30)
                HStack(spacing: 20){
                    Button(action: {
                        UserDefaults.standard.set(false, forKey: "isForwardAnimation")
                        appFlowCoordinator.showBioView()
                    }){
                        Text("Back")
                    }
                    Button(action: {
                        UserDefaults.standard.set(true, forKey: "isForwardAnimation")
                        appFlowCoordinator.showHomeView()
                    }){
                        Text("Next")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
}
