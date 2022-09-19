//
//  Empoyee.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-19.
//

import Foundation

//EmployeeId (PK)
//Name
//GenderIdentity (FK)
//SexualOrientation (FK)
//Ethnicity (FK)
//EmployerId (FK)
//DepartmentId? (FK)
//PodId? (FK)


struct Employee: Identifiable {
    var id: UUID
    var employeeId: Int
    var employerId: Int
    var podId: Int
    var name: String
    var gender: String
    var sexuality: String
    var pronouns: String
    var ethnicity: String
    var department: String?
}
