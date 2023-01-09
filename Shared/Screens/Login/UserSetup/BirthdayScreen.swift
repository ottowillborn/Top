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
    @EnvironmentObject private var navigator: Navigator
    @State private var name = ""
    @State var selectedDate = Date()
    
    let colors = Colors()
    
    var body: some View {
        SwitchRoutes{
            Text("Birthday bum")
                .font(.title)
                .padding(30)
            VStack{
                Form {
                    DatePicker("When is your birthday?", selection: $selectedDate, displayedComponents: .date)
                }
                Button(action: { navigator.navigate("..") }) {
                    Text("Back")
                }
                Button(action: { navigator.navigate("/locationScreen") }) {
                    Text("Next")
                }
            }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
}
