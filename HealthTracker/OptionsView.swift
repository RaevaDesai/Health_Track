import SwiftUI

struct OptionsView: View {
    let currentWeight: String
    let goalWeight: String
    let wantsClearSkin: String
    let dailyWaterIntake: String
    let exerciseHours: String
    let sleepHours: String
    let onIngredientCheck: () -> Void
    let onDietWaterPlan: () -> Void
    @State private var showFitnessTracker = false
    @State private var showMealScan = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Button(action: onIngredientCheck) {
                    buttonLabel(text: "Ingredient Check", color: .blue)
                }

                Button(action: { showMealScan = true }) {
                    buttonLabel(text: "Meal Plan", color: .green)
                }

                Button(action: onDietWaterPlan) {
                    buttonLabel(text: "Diet/Water Plan", color: .orange)
                }

                Button(action: { showFitnessTracker = true }) {
                    buttonLabel(text: "Fitness Tracker", color: .purple)
                }
            }
            .padding()
        }
        .sheet(isPresented: $showFitnessTracker) {
            FitnessTrackerView()
        }
        .sheet(isPresented: $showMealScan) {
            MealScanView()
        }
    }
    
    private func infoRow(label: String, value: String) -> some View {
        HStack {
            Text(label + ":")
                .font(.custom("AvenirNext-Medium", size: 16))
            Spacer()
            Text(value)
                .font(.custom("AvenirNext-Regular", size: 16))
        }
    }
    
    private func buttonLabel(text: String, color: Color) -> some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(color)
            .cornerRadius(10)
            .font(.custom("AvenirNext-Bold", size: 18))
    }
}
