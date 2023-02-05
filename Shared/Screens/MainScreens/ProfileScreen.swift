//
//  ProfileScreen.swift
//  Top (iOS)
//
//  Created by Otto Willborn on 2023-01-07.
//

import Foundation
import SwiftUI
import FirebaseAuth
import PhotosUI
import Firebase
import UIKit


struct ProfileScreen: View {
    
    var body: some View {
        Text("Profile")
    }
}
//
//
//var body: some View {
//
    
//            PhotosPicker(
//                selection: $selectedItem,
//                matching: .images,
//                photoLibrary: .shared()) {
//                    Text("Select a photo")
//                }.onChange(of: selectedItem) { newItem in
//                    Task {
//                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
//                            selectedPhotoData = data
//                        }
//                    }
//                }
//            Button(action: {uploadPhoto()}) {
//                Text("upload image")
//            }
//            Button(action: {downloadPhoto()}) {
//                Text("download image")
//            }.padding(.bottom, 10)
//                VStack{
//                        Button(action: {
//                            print(isActive)
//                            signOut(completion: { error in
//                                if error! {
//                                    isActive = false
//                                    print("error")
//                                }else{
//                                    isActive = true
//                                }
//                            })
//                            print(isActive)
//                        }){
//                            Text("Sign Out")
//                        }
//                }
//            }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//
//}
//func uploadPhoto(){
//    print(type(of: selectedItem))
//    if selectedItem != nil {
//        let email = Auth.auth().currentUser?.email
//        let image = UIImage(data: selectedPhotoData!)
//        let base64 = image!.base64
//        // Convert back to image
//        //let rebornImg = base64?.imageFromBase64
//        db.collection("users").document(email!).setData([
//            "first": "unam",
//            "img1": base64!
//        ]) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added with ID: \(email!)")
//            }
//        }
//    }
//}
//func downloadPhoto() {
//    let email = Auth.auth().currentUser?.email
//    db.collection("users").getDocuments() { (querySnapshot, err) in
//        if let err = err {
//            print("Error getting documents: \(err)")
//            return
//        } else {
//            for document in querySnapshot!.documents {
//                if document.documentID == email {
//                    let base64 = document.data()["img1"] as? String
//                    displayImage = base64?.imageFromBase64
//                }
//            }
//        }
//    }
//}
//}
//
//
