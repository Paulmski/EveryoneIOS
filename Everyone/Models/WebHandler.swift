//
//  WebHandler.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-21.
//

import Foundation

class WebHandler {
    // Connects to api with the provided path and queries given
    func connect(path: String, query: String, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let url = URL(string: "https://everyoneapi.azurewebsites.net/api/"+path+"?"+query)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            return completionHandler(data,response,error)
        }.resume()
        
    }
    func getEmployeeDetails(employerUuid: UUID, id: Int, completionHandler: @escaping (Employee?) -> Void) {
        connect(path: "Employees/Details", query: "id="+id.description+"&uuid="+employerUuid.description) { nullableData, response, error in
            guard let data = nullableData else { return }
                  let decoder = JSONDecoder()
              let employee = try? decoder.decode(Employee.self, from: data)
            completionHandler(employee)
        }
        }
    }
