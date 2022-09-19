//
//  Pod.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-19.
//

import Foundation
//PodId (PK)
//Name
//DepartmentId (FK)
struct Pod: Identifiable {
    var id: UUID
    var podId: Int
    var department: String

}
