//
//  helper.swift
//  hello-world
//
//  Created by user909680 on 3/9/18.
//  Copyright © 2018 user909680. All rights reserved.
//

import Foundation

public func hiThere() -> String {
    return "Hello you "
}

public func german_lookup(registrationNumber: String, username: String, password: String) throws -> ([String: Any])
{
    do
    {
        let url = URL(string: "http://www.regcheck.org.uk/api/json.aspx/CheckGermany/" + registrationNumber)
        if (url == nil)
        {
            throw NSError()
        }
        return try lookup(url: url!, username: username, password: password )
    }
    catch
    {
        throw NSError();
    }
    
}

public func austrian_lookup(registrationNumber: String, username: String, password: String) throws -> ([String: Any])
{
    do
    {
        let url = URL(string: "http://www.regcheck.org.uk/api/json.aspx/CheckAustria/" + registrationNumber)
        if (url == nil)
        {
            throw NSError()
        }
        return try lookup(url: url!, username: username, password: password )
    }
    catch
    {
        throw NSError();
    }
    
}

extension URLSession {
    func synchronousDataTask(urlrequest: URLRequest) -> (Data?, URLResponse?, Error?) {
        var data: Data?
        var response: URLResponse?
        var error: Error?
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let dataTask = self.dataTask(with: urlrequest) {
            data = $0
            response = $1
            error = $2
            
            semaphore.signal()
        }
        dataTask.resume()
        
        _ = semaphore.wait(timeout: .distantFuture)
        
        return (data, response, error)
    }
}

func lookup(url: URL, username: String, password: String) throws -> ([String: Any]) {
    let loginString = String(format: "%@:%@", username, password)
    let loginData = loginString.data(using: String.Encoding.utf8)!
    let base64LoginString = loginData.base64EncodedString()
    
    var request = URLRequest(url: url)
    request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
    
    request.httpMethod = "GET"
    let (data, _ , _) = URLSession.shared.synchronousDataTask(urlrequest: request)
    
    let json = try? JSONSerialization.jsonObject(with: data!, options: [])
    
    if (json == nil) {
        throw NSError()
    }
    
    let dictionary = json as? [String: Any]
    
  
    
    return dictionary!
    
}
