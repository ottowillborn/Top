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
    @State private var name = ""
    
    let colors = Colors()
    
    var body: some View {
        NavigationView{
            VStack{
                Text("show me")
                    .font(.title)
                    .padding(30)
                HStack(spacing: 20){
                    NavigationLink(destination: BioScreen()) {
                        Text("Back")
                    }
                    if #available(iOS 16.0, *) {
                        NavigationLink(destination: HomeScreen()) {
                            Text("Done")
                        }
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarHidden(true)
    }
}
