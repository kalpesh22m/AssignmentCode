//
//  APIService.swift
//  Testapp123
//
//  Created by Kalpesh Mahajan on 25/06/25.
//

enum APIError: Error {
    case invalidURL
    case noData
    
    var description : String {
        switch self {
        case .invalidURL:
            return "URL is invalid"
        case .noData:
            return "No data found"
        }
    }
}
import Foundation
final class APIService {
    static let sharedInstance = APIService()
    
    private init () {}
    
    func getData () async throws -> BankHolidaysResponse {
        
        guard let url = URL(string: "https://www.gov.uk/bank-holidays.json") else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard !data.isEmpty else {
            throw APIError.noData
        }
        
        do {
            let model = try JSONDecoder().decode(BankHolidaysResponse.self, from: data)
            return model
        } catch {
            throw APIError.noData
        }
    }
}
