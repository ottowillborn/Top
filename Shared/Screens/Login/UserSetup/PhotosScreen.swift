//
//  PhotosScreen.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-08.
//

import Foundation
import SwiftUI
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
                        print(UserDefaults.standard.bool(forKey: "loggedIn"))
                        print(UserDefaults.standard.string(forKey: "name")!)
                        print(UserDefaults.standard.object(forKey: "birthDate")!)
                        print(UserDefaults.standard.string(forKey: "location")!)
                        print(UserDefaults.standard.string(forKey: "bio")!)
                        print(UserDefaults.standard.array(forKey: "photos")!)
                        APICalls.updateUser()

                        UserDefaults.standard.set(true, forKey: "isForwardAnimation")
                        appFlowCoordinator.showHomeView()
                    }){
                        Text("Next")
                    }
                    Button(action: {
                        print(user.loggedIn)
                        print(user.name!)
                        print(user.birthDate)
                        print(user.location!)
                        print(user.bio!)
                        print(user.photos!)
                    }){
                        Text("print")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
}
