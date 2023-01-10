//
//  BirthdayScreen.swift
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

//  Birthday screen
struct BirthDayScreen: View {
    @State private var selectedDate = Date()
    
    let colors = Colors()
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Birthday bum")
                    .font(.title)
                    .padding(30)
                ZStack{
                    Form {
                        DatePicker("When is your birthday?", selection: $selectedDate, displayedComponents: .date)
                    }
                }
                HStack(spacing: 20){
                    NavigationLink(destination: NameScreen()) {
                        Text("Back")
                    }
                    NavigationLink(destination: LocationScreen()) {
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
