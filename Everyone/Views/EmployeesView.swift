//
//  EmployeesView.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-23.
//

import SwiftUI

struct EmployeesView: View {
    @State private var employees = [Employee]()
    @State private var showEmployeeForm = false
    var body: some View {
        NavigationView{
            List {
                ForEach(employees) { employee in
                    NavigationLink(employee.name, isActive: $showEmployeeForm) {
                        EmployeeForm(employee: employee, isPresented: $showEmployeeForm, newEmployee: false)
                    }
                    
                    
                }
                
                
            }
                
                .onAppear() {
                    
                    guard let uuid = UUID(uuidString: UserDefaults.standard.string(forKey: "token") ?? "") else { return }
                    WebHandler.getAllEmployees(uuid: uuid) { employees in
                        guard let employees = employees else {
                            return
                        }
                        self.employees = employees
                    }
                }
                .toolbar {
                    
                    ToolbarItem {
                        NavigationLink {
                            EmployeeForm(employee: Employee(name: "Employee", genderIdentity: "Male", sexualOrientation: "heterosexual", ethnicity: "Arab", employerId: 0, pronoun: "he/him"), isPresented: $showEmployeeForm, newEmployee: true)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                        
                    }
                    
                }
            
           
                
            
        
    }
}

struct EmployeesView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesView()
    }
}
