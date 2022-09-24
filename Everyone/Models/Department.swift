//
//  Department.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-23.
//

import Foundation

struct Department: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String = ""
    var departmentId: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        departmentId = try container.decode(Int?.self, forKey: .departmentId)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(departmentId, forKey: .name)
    }
   
    enum CodingKeys: CodingKey {
        case name, departmentId, id
    }
    
    
}
