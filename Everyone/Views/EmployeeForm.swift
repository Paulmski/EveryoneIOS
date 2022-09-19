//
//  EmployeeForm.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-19.
//

import SwiftUI

struct EmployeeForm: View {
    @Binding var name: String
    @Binding var sexuality: String
    @Binding var ethnicity: String
    @Binding var gender: String
    @Binding var pronouns: String
    // Need to get upto date list of genders from api
    let sexualities = ["Heterosexual", "Homesexual", "Bisexual", "Other/Prefer not to say"]
    let genders = ["Male", "Female", "Other/Prefer not to say"]
    let ethnicities = ["White", "Asian", "Black", "Other/Prefer not to say"]
    let pronounsList = ["He/Him", "She/Her", "They/Them", "Other/Prefer not to say"]
    var body: some View {
        
        Form {
            Section("Name") {
                TextField("Name", text: $name)
            }
            Section("Sexuality")  {
                Picker("Sexuality", selection: $sexuality) {
                    ForEach (sexualities, id: \.self) { option in
                        Text(option)
                        
                    }
                }
                .pickerStyle(.menu)
            }
            
            Section("Gender") {
                Picker("Gender", selection: $gender) {
                    ForEach (genders, id: \.self) { option in
                        Text(option)
                        
                    }
                }
                .pickerStyle(.menu)
            }
            
            Section("ethnicity/race") {
                Picker("Ethnicity", selection: $ethnicity) {
                    ForEach (ethnicities, id: \.self) { option in
                        Text(option)
                        
                    }
                }
                .pickerStyle(.menu)
            }
            
            Section("Pronouns") {
                Picker("Pronouns", selection: $pronouns) {
                    ForEach (pronounsList, id: \.self) { option in
                        Text(option)
                        
                    }
                }
            }
                .pickerStyle(.menu)
                HStack {
                    Spacer()
                    Button("Save") {
                        // Todo
                    }
                    Spacer()
                }
            }
    }
}

struct EmployeeForm_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeForm(name: .constant("Will"), sexuality: .constant("Heterosexual"), ethnicity: .constant("African American"), gender: .constant("Male"), pronouns: .constant("He/Him"))
    }
}
