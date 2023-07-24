//
//  APIService.swift
//  APIService
//
//  Created by Samudra on 22.07.23.
//

import Foundation

struct APIService {
    
    var isLogActive = false

    init(isLogActive: Bool){
        self.isLogActive = isLogActive
    }
    
    func fetch<T: Decodable>(_ type: T.Type, request: URLRequest, completion: @escaping(Result<T,APIError>) -> Void) {
        
        if(isLogActive){
            print("REQUEST URL: \(request.httpMethod ?? "") \(String(describing: request.url?.absoluteURL)) ")
            print("REQUEST BODY: \(NSString(data: (request.httpBody) ?? Data(), encoding: String.Encoding.ascii.rawValue)!)")
            print("REQUEST HEADER: \(String(describing: request.allHTTPHeaderFields))")
        }
        
        let task = URLSession.shared.dataTask(with: request) {(data , response, error) in
            if(isLogActive){
                print("REQUEST URL: \((response as? HTTPURLResponse)?.statusCode)  \(error?.localizedDescription ?? "") \(String(describing: response?.url))")
                print("REQUEST RESPONSE: \(String(decoding: data ?? Data(), as: UTF8.self))")
            }
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    
                    let result = try decoder.decode(type.self, from: data)
                    completion(Result.success(result))
                    
                } catch {
                    do {
                        let result = try decoder.decode(ErrorMessageResponse.self, from: data)
                        completion(Result.failure(APIError.errorMessage(message: )(result.message) ))
                        
                    } catch {
                        completion(Result.failure(APIError.parsing(error as? DecodingError)))

                    }
                }

            }
        }

        task.resume()
    }

    
    
    // HOW TO USE API
    
    // Init this Service
    // var service: APIService = APIService(isLogActive: true) //isLogActive, to show the log of the api service
    
    
    // Example of use function
    //    service.fetch([Breed].self, urlEndPoint: "breeds") { [unowned self] result in
    //
    //        DispatchQueue.main.async {
    //            self.isLoading = false
    //            switch result {
    //            case .failure(let error):
    //                self.errorMessage = error.localizedDescription
    //                // print(error.description)
    //                print(error)
    //            case .success(let breeds):
    //                print("--- sucess with \(breeds.count)")
    //                self.breeds = breeds
    //            }
    //        }
    //    }
    
    //T for Generic Model, Endpoint as endpoint path of the api
    // after Request Success/Finish
    // set inside DispatchQueue.main.async to update code inside Main Thread
    
}


