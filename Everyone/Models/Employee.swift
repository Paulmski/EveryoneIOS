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

struct Employee: Identifiable, Codable {
      var id: UUID = UUID()
    var employeeId: Int?
    var name: String = ""
    var genderIdentity: String = "Female"
    var sexualOrientation: String = "Heterosexual"
    var ethnicity: String = "Arab"
    var employerId: Int = 0
    var departmentId: Int?
    var departmentName: String?
    var podId: Int?
    var podName: String?
    var pronoun: String = "she/her"
    
    init(name: String, genderIdentity: String, sexualOrientation: String, ethnicity: String, employerId: Int, pronoun: String) {
        self.name = name
        self.genderIdentity = genderIdentity
        self.sexualOrientation = sexualOrientation
        self.ethnicity = ethnicity
        self.employerId = employerId
        self.pronoun = pronoun
        employeeId = nil
        id = UUID()
        departmentId = nil
        podId = nil
        podName = nil
        departmentName = nil
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
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
    
    
    
    //    {
    //      "name": "string",
    //      "genderIdentity": 0,
    //      "sexualOrientation": 0,
    //      "ethnicity": 0,
    //      "departmentId": 0,
    //      "podId": 0,
    //      "pronoun": 0
    //    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(departmentId, forKey: .departmentId)
        try container.encode(podId, forKey: .podId)
        try container.encode(name, forKey: .name)
        try container.encode(Keys.Genders[genderIdentity], forKey: .genderIdentity)
        try container.encode(Keys.Sexualities[sexualOrientation], forKey: .sexualOrientation)
        try container.encode(Keys.Ethnicities[ethnicity], forKey: .ethnicity)
        try container.encode(Keys.Pronouns[pronoun], forKey: .pronoun)
        
        
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
             pronoun,
             id
    }
    
  
}


