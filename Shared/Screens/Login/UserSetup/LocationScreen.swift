//
//  LocationScreen.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-08.
//

import Foundation
import SwiftUI
import FirebaseAuth
import PhotosUI
import Firebase

// Location screen
struct LocationScreen: View {
    @EnvironmentObject var appFlowCoordinator: AppFlowCoordinator
    @State private var location = ""
    let colors = Colors()
    
    var body: some View {
            VStack{
                
                Text("location pls")
                    .font(.title)
                    .padding(30)
                
                TextField("Location", text: $location ).onAppear(){
                    self.location = UserDefaults.standard.string(forKey: "location")!
                }
                    .padding(15)
                    .background(colors.lightGray)
                    .cornerRadius(10)
                
                HStack(spacing: 20){
                    
                    Button(action: {
                        UserDefaults.standard.set(location, forKey: "location")
                        UserDefaults.standard.set(false, forKey: "isForwardAnimation")
                        appFlowCoordinator.showBirthdayView()
                    }){
                        Text("Back")
                    }
                    
                    Button(action: {
                        UserDefaults.standard.set(location, forKey: "location")
                        UserDefaults.standard.set(true, forKey: "isForwardAnimation")
                        appFlowCoordinator.showBioView()
                    }){
                        Text("Next")
                    }
                    
                }
            }
            .padding(25)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
