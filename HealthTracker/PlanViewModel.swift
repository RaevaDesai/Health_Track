//
//  PlanViewModel.swift
//  HealthTracker
//
//  Created by Raeva Desai on 8/17/24.
//

import SwiftUI

class PlanViewModel: ObservableObject {
    @Published var responseText: String = ""
    private let openAIService: OpenAIService

    init(apiKey: String) {
        self.openAIService = OpenAIService(apiKey: apiKey)
    }

    func generatePlan(prompt: String) {
        openAIService.generateResponse(prompt: prompt) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.responseText = response
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
