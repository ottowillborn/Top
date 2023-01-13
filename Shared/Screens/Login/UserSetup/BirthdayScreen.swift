//
//  BirthdayScreen.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-08.
//

import Foundation
import SwiftUI
import FirebaseAuth
import PhotosUI
import Firebase

//  Birthday screen
struct BirthDayScreen: View {
    @EnvironmentObject var appFlowCoordinator: AppFlowCoordinator
    @State private var selectedDate = Date()
    
    let colors = Colors()
    
    var body: some View {
            VStack{
                Text("Birthday bum")
                    .font(.title)
                    .padding(30)
                VStack{
                        Text("Enter your birthday")
                    DatePicker("", selection: $selectedDate, displayedComponents: .date).onAppear(){
                        self.selectedDate = UserDefaults.standard.object(forKey: "birthDate") as! Date
                    }
                            .datePickerStyle(.wheel)
                    
                    if !validateDate() {
                        Text("You must be 18+ to use Top")
                            .foregroundColor(colors.redError)
                    }
                }
                HStack(spacing: 20){
                    //store on back as well
                    Button(action: {
                        UserDefaults.standard.set(selectedDate, forKey: "birthDate")
                        UserDefaults.standard.set(false, forKey: "isForwardAnimation")
                        appFlowCoordinator.showNameView()
                    }){
                        Text("Back")
                    }

                    if validateDate(){
                        Button(action: {
                            UserDefaults.standard.set(selectedDate, forKey: "birthDate")
                            UserDefaults.standard.set(true, forKey: "isForwardAnimation")
                            appFlowCoordinator.showLocationView()
                        }){
                            Text("Next")
                        }
                    }
                }
            }
            .padding(25)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func validateDate() -> Bool {
        let now = Date()
        let diffs = Calendar.current.dateComponents([.year, .month, .day], from: selectedDate, to: now)
        return diffs.year! >= 18 
    }
}
