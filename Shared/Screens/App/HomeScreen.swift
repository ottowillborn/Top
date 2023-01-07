//
//  HomeScreen.swift
//  Top
//
//  Created by Otto Willborn on 2023-01-05.
//

import Foundation
import SwiftUI
import SwiftUIRouter
import FirebaseAuth
import PhotosUI
import Firebase

// Main screen for app when logged in
@available(iOS 16.0, *)
struct HomeScreen: View {
    @EnvironmentObject private var navigator: Navigator
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedPhotoData: Data? = nil
    @State private var displayImage: UIImage? = nil
    let db = Firestore.firestore()
    
    var body: some View {
        SwitchRoutes{
            Text("HOME")
                .font(.title)
                .padding(30)
            Text(Auth.auth().currentUser?.uid ?? "")
                .font(.title)
                .padding(30)
            Text(Auth.auth().currentUser?.description ?? "")
                .font(.title)
                .padding(30)
            VStack{
                if displayImage != nil {
                    Image(uiImage: displayImage!)
                        .resizable()
                }
            }
            .frame(maxWidth: 200, maxHeight: 200)
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    Text("Select a photo")
                }.onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedPhotoData = data
                        }
                    }
                }
            Button(action: {
                navigator.navigate("/login")
                signOut()
            }) {
                Text("Sign Out")
            }
            Button(action: {uploadPhoto()}) {
                Text("upload image")
            }
            Button(action: {downloadPhoto()}) {
                Text("download image")
            }.padding(.bottom, 30)
            
            .safeAreaInset(edge: .bottom){
                NavigationBar()
            }
        }
        
    }
    func uploadPhoto(){
        print(type(of: selectedItem))
        if selectedItem != nil {
            let email = Auth.auth().currentUser?.email
            let image = UIImage(data: selectedPhotoData!)
            let base64 = image!.base64
            // Convert back to image
            //let rebornImg = base64?.imageFromBase64
            db.collection("users").document(email!).setData([
                "first": "unam",
                "DOB": 1815,
                "img1": base64!
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(email!)")
                }
            }
        }
    }
    func downloadPhoto() {
        let email = Auth.auth().currentUser?.email
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            } else {
                for document in querySnapshot!.documents {
                    if document.documentID == email {
                        let base64 = document.data()["img1"] as? String
                        displayImage = base64?.imageFromBase64
                    }
                }
            }
        }
    }
}


