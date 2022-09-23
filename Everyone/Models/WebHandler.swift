//
//  WebHandler.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-21.
//

import Foundation

class WebHandler {
    
    static private let baseURL = "https://everyoneapi.azurewebsites.net/api/"
    static private let session = URLSession.shared
    
    
    static func getEmployeeDetails(employerUuid: UUID, id: Int, completionHandler: @escaping (Employee?) -> Void) {
        let url  = URL(string: baseURL+"Employees/Details?"+"id="+id.description+"&uuid="+employerUuid.description)!
        session.dataTask(with:url) { nullableData, response, error in

            guard let data = nullableData else {
                completionHandler(nil)
                return
            }
                  let decoder = JSONDecoder()
              let employee = try? decoder.decode(Employee.self, from: data)
            completionHandler(employee)
        }.resume()
        }
    
    
   static func createEmployee(employerUuid: UUID, employee: Employee) {
       let jsonData = try! JSONEncoder().encode(employee)
       let url = URL(string: baseURL+"Employees/create?uuid="+employerUuid.description)!
       var request = URLRequest(url: url)
       request.httpMethod = "POST"
       request.setValue("application/json", forHTTPHeaderField: "Content-Type")  // the request is JSON

       // insert json data to the request
       request.httpBody = jsonData

       let task = URLSession.shared.dataTask(with: request) { data, response, error in
           guard let data = data, error == nil else {
               print(error?.localizedDescription ?? "No data")
               return
           }
           let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
           if let responseJSON = responseJSON as? [String: Any] {
               print(responseJSON)
           }
       }

       task.resume()
       
    }
    }
