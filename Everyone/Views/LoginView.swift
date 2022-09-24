//
//  LoginView.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-23.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var showMainScreen = false
    var body: some View {
        
        NavigationView {
            VStack() {
                Image("logo_transparent") .resizable()
                    .scaledToFit()
                TextField("Username", text: $username)
                    .padding(.top)
                    .textFieldStyle(.roundedBorder)
                Spacer()
                SecureField("Password", text: $password)
                    .padding(.bottom)
                    .textFieldStyle(.roundedBorder)
                Button {
                  
                    WebHandler.loginEmployee(email: username, password: password) { uuid in
                        if let safeUuid = uuid {
                            UserDefaults.standard.set(safeUuid.uuidString, forKey: "token")
                            showMainScreen = true
//                            passwordistest123123@gmail.com
                        } else {
                            showAlert = true
                        }
                    }
                    
                    
                } label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .frame(minWidth: 100, minHeight: 30)
                        .background(Color.vibrantPurple)
                        .cornerRadius(5)
                        
                }
                
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .frame(minWidth: 100, minHeight: 30)
                        .background(Color.darkPurple)
                        .cornerRadius(5)
                }

                
                
            }
            .padding()
            .navigationTitle("Login")
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Login Failed :("),
                    message: Text("Check your internet connection or try a different username / password"),
                    dismissButton: .default(Text("Dismiss"))
                )
            }
            .fullScreenCover(isPresented: $showMainScreen) {
                MainView()
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
