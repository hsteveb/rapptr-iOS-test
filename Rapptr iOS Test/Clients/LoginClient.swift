//
//  LoginClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'email' and 'password'
 *
 * 4) email - info@rapptrlabs.com
 *   password - Test123
 *
*/

class LoginClient {
    
    var session: URLSession?
    
    init() {
        self.session = URLSession.shared
    }
    
    func login(email: String, password: String, completion: @escaping (String) -> Void, error errorHandler: @escaping (String?) -> Void) {
        let data = "email=\(email)&password=\(password)".data(using: .utf8)
        let url = URL(string: "http://dev.rapptrlabs.com/Tests/scripts/login.php")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let startDate = Date()
        session?.uploadTask(with: request, from: data, completionHandler: { data, response, error in
            let endTime = (abs(startDate.timeIntervalSinceNow * 1000).rounded())
            if error != nil {
                DispatchQueue.main.async {
                    errorHandler(error.debugDescription)
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    errorHandler("Data nil")
                }
                return
            }
            let decoder = JSONDecoder()
            let login = try? decoder.decode(Login.self, from: data)
            
            DispatchQueue.main.async {
                if login?.code == "Success" {
                    completion("Time: \(endTime)ms")
                } else {
                    errorHandler(login?.message)
                }
            }
        }).resume()
    }
}
