//
//  ChatClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
 *
 */

class ChatClient {
    
    var session: URLSession?
    
    init() {
        self.session = URLSession.shared
    }
    
    func fetchChatData(completion: @escaping ([Message]) -> Void, error errorHandler: @escaping (String?) -> Void) {
        let url = URL(string: "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php")!
        
        self.session?.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil {
                DispatchQueue.main.async {
                    errorHandler(error.debugDescription)
                }
                
                return
            }
            let decoder = JSONDecoder()
            guard let data = data ,
                  let chat = try? decoder.decode(Chat.self, from: data)
            else {
                DispatchQueue.main.async {
                    errorHandler("Could not decode data.")
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(chat.data)
            }
            
        }).resume()
    }
}
