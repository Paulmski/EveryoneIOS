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
            let employee = try! decoder.decode(Employee.self, from: data)
            completionHandler(employee)
        }.resume()
    }
    
    
    static func createEmployee(employerUuid: UUID, employee: Employee, completionHandler: @escaping (Int) -> Void) {
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
                completionHandler(1)
                return
            }
            completionHandler(0)
        }
        
        
        
        task.resume()
        
    }
    
    // If registration was successful completion handler will return zero otherwise non-zero
    static func registerEmployer(email: String, password: String, completionHandler: @escaping (Int) -> Void){
        let employer = Employer(email: email, password: password)
        let jsonData = try! JSONEncoder().encode(employer)
        let url = URL(string: baseURL+"Employers/register")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")  // the request is JSON
        
        // insert json data to the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completionHandler(1)
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                completionHandler(1)
            } else {
                completionHandler(0)
            }
        }
        
        task.resume()
        
    }
    
    
    static func loginEmployee(email: String, password: String, completionHandler: @escaping (UUID?) -> Void) {
        
        let employer = Employer(email: email, password: password)
        let jsonData = try! JSONEncoder().encode(employer)
        let url = URL(string: baseURL+"Employers/login")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")  // the request is JSON
        
        // insert json data to the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completionHandler(nil)
                return
            }
            let responseString = String(decoding: data, as: UTF8.self)
                print(responseString)
                completionHandler(UUID(uuidString: responseString))
           
        }
        
        task.resume()
    }
}
