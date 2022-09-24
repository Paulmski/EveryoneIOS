//
//  DepartmentsView.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-23.
//

import SwiftUI

struct DepartmentsView: View {
    @State private var departments: [Department] = []
    var body: some View {
        NavigationView {
            List {
                ForEach (departments) { department in
                    NavigationLink {
                       DepartmentView(department: department)
                    } label: {
                        Text(department.name)
                    }

                }
            }
           
        }
        .onAppear() {
            guard let uuid = UUID(uuidString: UserDefaults.standard.string(forKey: "token") ?? "") else { return }
            WebHandler.getDepartments(uuid: uuid, completionHandler: {departments in
                guard let departments = departments else {
                    return
                }
                self.departments = departments
                
            })
        }
    }
}

struct DepartmentsView_Previews: PreviewProvider {
    static var previews: some View {
        DepartmentsView()
    }
}
