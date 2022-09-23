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

struct Employer: Codable {
    var email: String
    var password: String
}
