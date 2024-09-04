//
//  PlanView.swift
//  HealthTracker
//
//  Created by Raeva Desai on 8/17/24.
//

import SwiftUI



struct PlanView: View {

    let firstName: String

    let lastName: String

    let selectedGoals: Set<UUID>

    let currentWeight: Double?

    let idealWeight: Double?

    let workoutFrequency: Int?



    @State private var showImagePicker = false

    @State private var image: UIImage?

    @State private var recognizedText: String = ""



    var body: some View {

        VStack(alignment: .leading, spacing: 20) {

            Text("Your Personalized Plan")

                .font(.custom("Avenir Next", size: 34))

                .padding(.top, 40)



            if let waterPlan = generateWaterIntakePlan() {

                Text("Water Intake Plan:")

                    .font(.custom("Avenir Next", size: 24))

                    .padding(.top, 20)

                Text(waterPlan)

            }



            if let dietPlan = generateDietPlan() {

                Text("Diet Plan:")

                    .font(.custom("Avenir Next", size: 24))

                    .padding(.top, 20)

                Text(dietPlan)

            }



            if let exercisePlan = generateExercisePlan() {

                Text("Exercise Plan:")

                    .font(.custom("Avenir Next", size: 24))

                    .padding(.top, 20)

                Text(exercisePlan)

            }



            Button(action: {

                showImagePicker = true

            }) {

                Text("Capture Image")

                    .font(.custom("Avenir Next", size: 18))

                    .padding()

                    .background(Color.blue)

                    .foregroundColor(.white)

                    .cornerRadius(10)

            }



            if !recognizedText.isEmpty {

                Text("Recognized Text:")

                    .font(.custom("Avenir Next", size: 24))

                    .padding(.top, 20)

                Text(recognizedText)

                    .padding()

                    .background(Color.gray.opacity(0.2))

                    .cornerRadius(8)

            }



            Spacer()

        }

        .padding()

        .sheet(isPresented: $showImagePicker) {

            ImagePicker(image: $image, recognizedText: $recognizedText)

        }

    }



    // Generate a Water Intake Plan

    func generateWaterIntakePlan() -> String? {

        guard let weight = currentWeight else { return nil }

        let waterIntake = weight * 0.033

        return "Based on your weight of \(Int(weight)) kg, you should drink approximately \(String(format: "%.1f", waterIntake)) liters of water daily."

    }



    // Generate a Diet Plan

    func generateDietPlan() -> String? {

        guard let currentWeight = currentWeight, let idealWeight = idealWeight else { return nil }

        let calorieDeficit = currentWeight > idealWeight ? "reduce" : "increase"

        return """

        Your goal is to \(calorieDeficit) your calorie intake to achieve your ideal weight of \(Int(idealWeight)) kg.

        - Focus on a balanced diet rich in vegetables, lean proteins, and whole grains.

        - Avoid processed foods and sugary drinks.

        """

    }



    // Generate an Exercise Plan

    func generateExercisePlan() -> String? {

        guard let frequency = workoutFrequency else { return nil }

        return """

        You aim to work out \(frequency) times a week.

        - Focus on a mix of cardiovascular exercises like running or cycling.

        - Include strength training exercises such as weight lifting, bodyweight exercises, and resistance training.

        - Ensure at least one rest day between workouts for muscle recovery.

        """

    }

}



#Preview {

    PlanView(

        firstName: "John",

        lastName: "Doe",

        selectedGoals: [UUID(uuidString: "11111111-1111-1111-1111-111111111111")!],

        currentWeight: 70.0,

        idealWeight: 65.0,

        workoutFrequency: 4

    )

}
