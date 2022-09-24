//
//  DepartmentView.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-24.
//

import SwiftUI

struct DepartmentView: View {
    
    @State var department: Department
    @State private var showEmployeeForm = false
    var body: some View {
        List {
            ForEach(department.employees) { employee in
                NavigationLink {
                    EmployeeForm(employee: employee, isPresented: $showEmployeeForm, newEmployee: false)
                } label: {
                    VStack {
                        Text(employee.name)
                        Text(employee.podName ?? "")
                            .font(.caption)
                    }
                }
                .listRowBackground((employee.podId ?? -1) % 2 == 0 ? Color.team1Color : Color.white)

            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // TODO
                } label: {
                    Image(systemName: "dice")
                }

            }
        }
            .onAppear() {
                guard let uuid = UUID(uuidString: UserDefaults.standard.string(forKey: "token") ?? "") else { return }
                WebHandler.getEmployeesByDepartment(uuid: uuid, departmentId: department.departmentId ?? 0) { employees in
                    department.employees = employees
                    department.employees.sort(by: {$0.podId ?? -1 < $1.podId ?? -1})
                }
            }
    }
}

//struct DepartmentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DepartmentView(employees: Department()
//    }
//}
