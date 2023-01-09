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
    let colors = Colors()
    
    var body: some View {
        SwitchRoutes{
            Text("Home")
                .font(.title)
                .padding(10)
            
            VStack{
                Text(Auth.auth().currentUser?.email ?? "")
                    .font(.title)
                    .padding(30)
                if displayImage != nil {
                    Image(uiImage: displayImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 500, alignment: .topLeading)
                        .border(colors.orange)
                }
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
                Button(action: {uploadPhoto()}) {
                    Text("upload image")
                }
                Button(action: {downloadPhoto()}) {
                    Text("download image")
                }.padding(.bottom, 10)
                Button(action: {
                    signOut()
                    navigator.navigate("/login")
                }) {
                    Text("Sign Out")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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

