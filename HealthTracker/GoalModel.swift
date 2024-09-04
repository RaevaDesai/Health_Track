//
//  GoalModel.swift
//  HealthTracker
//
//  Created by Raeva Desai on 8/17/24.
//

import Foundation



struct Goal: Identifiable {

    let id: UUID

    let name: String



    static let allGoals: [Goal] = [

        Goal(id: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!, name: "Lose Weight"),

        Goal(id: UUID(uuidString: "22222222-2222-2222-2222-222222222222")!, name: "Clear Skin"),

        Goal(id: UUID(uuidString: "33333333-3333-3333-3333-333333333333")!, name: "Lose Fat"),

        Goal(id: UUID(uuidString: "44444444-4444-4444-4444-444444444444")!, name: "Build Muscle")

    ]

}
