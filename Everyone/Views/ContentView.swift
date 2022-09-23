//
//  ContentView.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-19.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var userName: String  = ""
    @State private var showLogin: Bool = false
    @State private var showSignUp: Bool = false
    var body: some View {
        VStack {
            Button {
                showLogin = true
            } label: {
                Text("Login")
                    .font(.title3)
            }
            Button {
                showSignUp = true
            } label: {
                Text("Sign Up")
                    .font(.title3)
            }
        }
        .sheet(isPresented: $showLogin) {
            LoginView(isPresented: $showLogin)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
