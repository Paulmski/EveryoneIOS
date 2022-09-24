//
//  EmployeeForm.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-19.
//

import SwiftUI

struct EmployeeForm: View {
    @State var employee: Employee
    @Binding var isPresented: Bool
    @State private var isDisabled = false
    var newEmployee: Bool
    // Need to get upto date list of genders from api
    let sexualities = Array(Keys.Sexualities.keys)
    let genders = Array(Keys.Genders.keys)
    let ethnicities = Array(Keys.Ethnicities.keys)
    let pronounsList = Array(Keys.Pronouns.keys)
    var body: some View {
       
        Form {
            Section("Name") {
                TextField("Name", text: $employee.name)
            }
            Section("Sexuality")  {
                Picker("Sexuality", selection: $employee.sexualOrientation) {
                    ForEach (sexualities, id: \.self) { option in
                        Text(option)
                        
                    }
                }
                .pickerStyle(.menu)
            }
            
            Section("Gender") {
                Picker("Gender", selection: $employee.genderIdentity) {
                    ForEach (genders, id: \.self) { option in
                        Text(option)
                        
                    }
                }
                .pickerStyle(.menu)
            }
            
            Section("ethnicity/race") {
                Picker("Ethnicity", selection: $employee.ethnicity) {
                    ForEach (ethnicities, id: \.self) { option in
                        Text(option)
                        
                    }
                }
                .pickerStyle(.menu)
            }
            
            Section("Pronouns") {
                Picker("Pronouns", selection: $employee.pronoun) {
                    ForEach (pronounsList, id: \.self) { option in
                        Text(option)
                        
                    }
                }
            }
                .pickerStyle(.menu)
                HStack {
                    Spacer()
                    Button("Save") {
                       isDisabled = true
                        let token = UUID(uuidString: UserDefaults.standard.string(forKey: "token") ?? "")!
                        if newEmployee {
                            WebHandler.createEmployee(employerUuid: token, employee: employee) { result in
                                isDisabled = false
                                isPresented = false
                            }
                        } else {
                                
                                
                                
                        WebHandler.saveEmployee(uuid: token, employee: employee) { result in
                            isDisabled = false
                            isPresented = false
                            }
                        }
                    }
                    .disabled(isDisabled)
                    Spacer()
                }
            }
    }
}

struct EmployeeForm_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeForm(employee: Employee(name: "Fred", genderIdentity: "Male", sexualOrientation: "Bisexual", ethnicity: "Arab", employerId: 6, pronoun: "he/him"), isPresented: .constant(true), newEmployee: true)
    }
}
