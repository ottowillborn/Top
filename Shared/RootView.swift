//
//  RootView.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-10.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct RootView: View {
    @EnvironmentObject var appFlowCoordinator: AppFlowCoordinator
    @State private var animationAmount = 1.0
    init(){
        FirebaseApp.configure()
        UserDefaults.standard.set("", forKey: "name")
        UserDefaults.standard.set(Date(), forKey: "birthDate")
        UserDefaults.standard.set("forward", forKey: "slideDirection")
        UserDefaults.standard.set(true, forKey: "isForwardAnimation")
       
        // On app load: if user is logged in, set home page as main route, else set login page as main route.
        if Auth.auth().currentUser != nil {
            UserDefaults.standard.set(true, forKey: "loggedIn")
        } else {
            UserDefaults.standard.set(false, forKey: "loggedIn")
        }
    }
    

    @ViewBuilder
    
    var body: some View {
        ContentView()
    }
}
