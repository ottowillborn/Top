//
//  RandomUsers App
//  Created by Freek (github.com/frzi) 2021
//

import Foundation
import SwiftUI
import SwiftUIRouter

/// (11) Another view whose only job is to define routes, though this time it comes with some additional logic.

struct LoginScreen: View {
    @EnvironmentObject private var routeInformation: RouteInformation
    @EnvironmentObject private var usersData: UsersData
    @EnvironmentObject private var navigator: Navigator
    @State var username: String
    @State var password: String
    let lightGray = Color(#colorLiteral(red: 0.8124992251, green: 0.8971869349, blue: 0.8967813849, alpha: 1))
    let orange = Color(#colorLiteral(red: 0.9417511225, green: 0.6201518178, blue: 0.2676982284, alpha: 1))
    
    var body: some View {
        SwitchRoutes {
            Text("Top")
                .font(.largeTitle)
                .padding(.bottom, 40)
            VStack(spacing: 15){
                TextField("Username", text: $username )
                    .padding(15)
                    .background(lightGray)
                    .cornerRadius(10)
                SecureField("Password", text: $password )
                    .padding(15)
                    .background(lightGray)
                    .cornerRadius(10)
                Button(action: { navigator.navigate("/home") }) {
                    Text("Log In")
                }
                .padding(15)
                .background(orange)
                .cornerRadius(10)
                .foregroundColor(Color.black)
            }
            .padding([.trailing, .leading], 25)
            .padding(.top, 30)
            .padding(.bottom, 10)
            HStack(spacing: -10){
                Text("Don't have an account?")
                Button(action: { navigator.navigate("/signUp") }) {
                    Text("Sign Up")
                }
                .padding(20)
            }
            
        }
        .navigationTransition()
    }
}
