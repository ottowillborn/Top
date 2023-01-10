//
//  ContentView.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-09.
//

import SwiftUI
let user = UserClass()
struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                if user.loggedIn{
                    if #available(iOS 16.0, *) {
                        HomeScreen()
                    } else {
                        // Fallback on earlier versions
                        LoginScreen()
                    }
                }else{
                    LoginScreen()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct AppPreview: PreviewProvider {
    static var previews: some View {
        NavigationView(){
            ContentView()
        }
    }
}
