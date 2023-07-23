//
//  APIFetcher.swift
//  team1nc3
//
//  Created by Juli Yanti on 23/07/23.
//

import Foundation

class APIFetcher: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    // Data Objects
    @Published var specialUsers: [MRTSpecialUser] = []
    
    let service: APIService
    
    init(service: APIService = APIService(isLogActive: true)) {
        self.service = service
    }
    
    // MARK: - Reusable Fetch Function
    private func fetchData<T: Codable>(_ endpoint: String, responseType: T.Type) {
        isLoading = true
        errorMessage = nil
        
        let fullUrlString = (ProcessInfo.processInfo.environment["BASE_URL"] ?? "") + endpoint
        guard let fullUrl = URL(string: fullUrlString) else {
            print(APIError.badURL)
            isLoading = false
            return
        }
        
        var request = URLRequest(url: fullUrl)
        request.httpMethod = APIMethod.GET.description
        
        service.fetch(responseType, request: request) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print("--- failure: \(error)")
                case .success(let data):
                    print("--- data: \(data)")
                    // Handle the received data as needed
                    
                }
            }
        }
    }
    
    // MARK: - Fetch functions for specific endpoints
    
    func fetchSample() {
        fetchData("", responseType: [String].self)
    }
    
    func fetchStation() {
        fetchData("stations", responseType: BaseResponse<[Station]>.self)
    }
    
    func fetchGender() {
        fetchData("gender", responseType: BaseResponse<[Gender]>.self)
    }
    
    func fetchAssistiveTools() {
        fetchData("assistive-tools", responseType: BaseResponse<[AssistiveTools]>.self)
    }
    
    func fetchMRTSpecialUser() {
        fetchData("users/special", responseType: BaseResponse<[MRTSpecialUser]>.self)
    }
    
    func fetchTicket() {
        fetchData("/tickets", responseType: BaseResponse<[Ticket]>.self)
    }
    
}
