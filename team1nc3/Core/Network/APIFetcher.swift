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
    @Published var stations: [Station] = []
    @Published var genders: [Gender] = []
    @Published var assistiveTools: [AssistiveTools] = []
    @Published var tickets: [Ticket] = []
    
    @Published var ticketsDD: [String] = []
    @Published var gendersDD: [String] = []
    @Published var assistiveToolsDD: [String] = []
    
    let service: APIService

    
    init(service: APIService = APIService(isLogActive: true)) {
        self.service = service
    }
    
    // MARK: - Reusable Fetch Function
    private func fetchData<T: Codable>(_ endpoint: String, responseType: T.Type, completion: @escaping (_ data: T? ,_ error: String) -> Void) {
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
                var d: T? = nil
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print("--- failure: \(error)")
                case .success(let data):
//                    print("--- data: \(data)")
                    // Handle the received data as needed
                    d = data
                }
                completion(d, self.errorMessage ?? "")
            }
        }
    }
    
    // MARK: - Fetch functions for specific endpoints
    
    func fetchSample() {
        //Warning, data could be nil
        fetchData("", responseType: [String].self, completion: {data, err  in
//            print("--- data: \(data)")
//            print("--- error: \(err)")
        })
    }
    
    func fetchStation(completionData: @escaping (_ data: BaseResponse<[Station]>? ,_ error: String) -> Void) {
        //Warning, data could be nil
        fetchData("stations", responseType: BaseResponse<[Station]>.self, completion: { [self]  data, err in
            completionData(data,err)
//            print("--- data: \(data)")
//            print("--- error: \(err)")
            
            stations = data?.message ?? []
        })
    }
    
    func fetchGender(completionData: @escaping (_ data: BaseResponse<[Gender]>? ,_ error: String) -> Void) {
        //Warning, data could be nil
        fetchData("gender", responseType: BaseResponse<[Gender]>.self, completion: { [self] data, err in
            completionData(data,err)

//            print("--- data: \(data)")
//            print("--- error: \(err)")
//            DispatchQueue.main.async {
//                self.genders = data?.message ?? []
//                self.gendersDD = []
//                for a in self.genders  {
//                    self.gendersDD.append(a.name ?? "")
//                }
//            }
        })
    }
    
    func fetchAssistiveTools(completionData: @escaping (_ data: BaseResponse<[AssistiveTools]>? ,_ error: String) -> Void) {
        //Warning, data could be nil
        fetchData("assistive-tools", responseType: BaseResponse<[AssistiveTools]>.self, completion: { [self]  data, err in
            completionData(data,err)

//            print("--- data: \(data)")
//            print("--- error: \(err)")
//            DispatchQueue.main.async {
//                self.assistiveTools = data?.message ?? []
//                self.assistiveToolsDD = []
//                for a in self.assistiveTools {
//                    self.assistiveToolsDD.append(a.tool_name ?? "")
//                }
//            }
        })
    }
    
    func fetchMRTSpecialUser(completionData: @escaping (_ data: BaseResponse<[MRTSpecialUser]>? ,_ error: String) -> Void) {
        //Warning, data could be nil
        fetchData("users/special", responseType: BaseResponse<[MRTSpecialUser]>.self, completion: { [self]  data, err in
            completionData(data,err)

//            print("--- data: \(data)")
//            print("--- error: \(err)")
//            DispatchQueue.main.async {
//                self.specialUsers = data?.message ?? []
//            }
        })
    }
    
    func fetchTicket(completionData: @escaping (_ data: BaseResponse<[Ticket]>? ,_ error: String) -> Void) {
        //Warning, data could be nil
        fetchData("/tickets", responseType: BaseResponse<[Ticket]>.self, completion: { [self] data, err in
            completionData(data,err)
//            print("--- data: \(data)")
//            print("--- error: \(err)")
//            DispatchQueue.main.async {
//                self.tickets = data?.message ?? []
//                self.ticketsDD = []
//
//                for t in self.tickets  {
//                    self.ticketsDD.append("\(t.ticket_id)")
//                }
//            }
            
        })
    }
    
    
}
