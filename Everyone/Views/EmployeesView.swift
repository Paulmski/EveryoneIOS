//
//  EmployeesView.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-23.
//

import SwiftUI

struct EmployeesView: View {
    @State private var employees = [Employee]()
    var body: some View {
            List {
                ForEach(employees) { employee in
                    Text("hello")
                }
            }
            .onAppear() {
                
            }
        }
}

struct EmployeesView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesView()
    }
}
