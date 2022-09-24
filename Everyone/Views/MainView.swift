//
//  MainView.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
            TabView {
                DepartmentsView()
                .tabItem {
                    Image(systemName: "folder.fill.badge.person.crop")
                        Image(systemName: "person.3.fill")
                            Text("Departments")
                }
                EmployeesView()
                    .tabItem {
                        VStack {
                        Image(systemName: "person.3.fill")
                            Text("Employees")
                        }
                    }
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
