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

struct Employee: Identifiable, Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        employeeId = try container.decode(Int.self, forKey: .employeeId)
        name = try container.decode(String.self, forKey: .name)
        genderIdentity = try container.decode(String.self, forKey: .genderIdentity)
        sexualOrientation = try container.decode(String.self, forKey: .sexualOrientation)
        ethnicity = try container.decode(String.self, forKey: .ethnicity)
        employerId = try container.decode(Int.self, forKey: .employerId)
        departmentId = try container.decode(Int?.self, forKey: .departmentId)
        departmentName = try container.decode(String?.self, forKey: .departmentName)
        podId = try container.decode(Int?.self, forKey: .podId)
        podName = try container.decode(String?.self, forKey: .podName)
        pronoun = try container.decode(String.self, forKey: .pronoun)
      }
    
    enum CodingKeys: String, CodingKey {
        case employeeId,
             name,
             genderIdentity,
             sexualOrientation,
             ethnicity,
             employerId,
             departmentId,
             departmentName,
             podId,
             podName,
             pronoun
    }
    
    var id: UUID
    var employeeId: Int
    var name: String
    var genderIdentity: String
    var sexualOrientation: String
    var ethnicity: String
    var employerId: Int
    var departmentId: Int?
    var departmentName: String?
    var podId: Int?
    var podName: String?
    var pronoun: String
    
}
