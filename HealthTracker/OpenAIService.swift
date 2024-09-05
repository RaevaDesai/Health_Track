//
//  OpenAIService.swift
//  HealthTracker
//
//  Created by Raeva Desai on 8/17/24.
//

import Alamofire
import Foundation

class OpenAIService {
    private let apiKey: String
    private let endpoint = "https://api.openai.com/v1/completions"

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    func generateResponse(prompt: String, completion: @escaping (Result<String, Error>) -> Void) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(apiKey)",
            "Content-Type": "application/json"
        ]

        let parameters: [String: Any] = [
            "model": "text-davinci-003", // or "gpt-4"
            "prompt": prompt,
            "max_tokens": 150
        ]

        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let json = value as? [String: Any],
                       let choices = json["choices"] as? [[String: Any]],
                       let text = choices.first?["text"] as? String {
                        completion(.success(text))
                    } else {
                        completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response format"])))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
