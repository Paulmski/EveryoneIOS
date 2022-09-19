//
//  Employer.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-19.
//

import Foundation

//EmployerId (PK)
//Name
//AuthenticationTokens…
struct employer: Identifiable {
    var id: UUID
    var employerid: Int
    var name: String
    var token: String
}
