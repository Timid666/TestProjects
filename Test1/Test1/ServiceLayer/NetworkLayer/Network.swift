//
//  Network.swift
//  Test1
//
//  Created by Саид on 03.04.2021.
//  Copyright © 2021 Саид. All rights reserved.
//

import Foundation

class Network {
    
    func requestAndGetData(completion: @escaping (Result<BugTruckers?, Error>) -> Void) {
        let stringUrl = "https://lk.ellco.ru:8000/bug_tracker/"
        guard let url = URL(string: stringUrl) else { return }
        
        DispatchQueue.main.async {
            let task = URLSession.shared.dataTask(with: self.createRequest(url)) { (data, response, error) in
                
                if let error = error {
                    print(error)
                }

                do {
                    let data = try? JSONDecoder().decode(BugTruckers.self, from: data!)
                    completion(.success(data))
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    func requestAndGetDataById(byId id: Int, completion: @escaping (Result<TruckerDetail?, Error>) -> Void) {
        let stringUrl = "https://lk.ellco.ru:8000/bug_tracker/\(id)"
        guard let url = URL(string: stringUrl) else { return }
        
        
        let task = URLSession.shared.dataTask(with: createRequest(url)) { (data, response, error) in
            
            if let error = error {
                print(error)
            }
            
            do {
                let data = try? JSONDecoder().decode(TruckerDetail.self, from: data!)
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    func createRequest(_ url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue("38fa0880d113c79d8e0196481d4f4562576b5348de1ab9619696d3449de5", forHTTPHeaderField: "X-AUTH-TOKEN")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Application")
        request.httpMethod = "GET"
        
        return request
    }
}
