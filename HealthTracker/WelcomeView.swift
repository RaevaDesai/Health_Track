//
//  WelcomeView.swift
//  HealthTracker
//
//  Created by Raeva Desai on 8/17/24.
//

import SwiftUI



struct WelcomeView: View {

    let firstName: String

    let lastName: String

    let selectedGoals: Set<UUID>



    @State private var currentWeight: String = ""

    @State private var idealWeight: String = ""

    @State private var currentBodyFat: String = ""

    @State private var idealBodyFat: String = ""

    @State private var weeklyProtein: String = ""

    @State private var workoutFrequency: String = ""

    @State private var showImagePicker = false

    @State private var skinImage: UIImage? = nil

    @State private var recognizedText: String = "" // State for recognized text



    var body: some View {

        VStack(spacing: 20) {

            Text("Hello, \(firstName) \(lastName)")

                .font(.custom("Avenir Next", size: 34))

                .padding(.top, 40)



            if selectedGoals.contains(UUID(uuidString: "11111111-1111-1111-1111-111111111111")!) {

                VStack {

                    Text("Enter Your Current Weight:")

                        .font(.custom("Avenir Next", size: 18))

                    TextField("Current Weight", text: $currentWeight)

                        .textFieldStyle(RoundedBorderTextFieldStyle())



                    Text("Enter Your Ideal Weight:")

                        .font(.custom("Avenir Next", size: 18))

                    TextField("Ideal Weight", text: $idealWeight)

                        .textFieldStyle(RoundedBorderTextFieldStyle())

                }

            }



            if selectedGoals.contains(UUID(uuidString: "22222222-2222-2222-2222-222222222222")!) {

                VStack {

                    Text("Take a Picture of Your Skin")

                        .font(.custom("Avenir Next", size: 18))



                    if let skinImage = skinImage {

                        Image(uiImage: skinImage)

                            .resizable()

                            .scaledToFit()

                            .frame(width: 200, height: 200)

                            .cornerRadius(10)

                    }



                    Button("Capture Image") {

                        showImagePicker = true

                    }

                    .sheet(isPresented: $showImagePicker) {

                        ImagePicker(image: $skinImage, recognizedText: $recognizedText)

                    }



                    // Display recognized text in a scrollable view

                    ScrollView {

                        Text(recognizedText)

                            .padding()

                            .font(.custom("Avenir Next", size: 16))

                    }

                    .frame(maxHeight: 300) // Adjust height as needed

                }

            }



            if selectedGoals.contains(UUID(uuidString: "33333333-3333-3333-3333-333333333333")!) {

                VStack {

                    Text("Enter Your Current Body Fat Percentage:")

                        .font(.custom("Avenir Next", size: 18))

                    TextField("Current Body Fat", text: $currentBodyFat)

                        .textFieldStyle(RoundedBorderTextFieldStyle())



                    Text("Enter Your Ideal Body Fat Percentage:")

                        .font(.custom("Avenir Next", size: 18))

                    TextField("Ideal Body Fat", text: $idealBodyFat)

                        .textFieldStyle(RoundedBorderTextFieldStyle())

                }

            }



            if selectedGoals.contains(UUID(uuidString: "44444444-4444-4444-4444-444444444444")!) {

                VStack {

                    Text("Enter How Much Protein You Eat Weekly:")

                        .font(.custom("Avenir Next", size: 18))

                    TextField("Weekly Protein Intake", text: $weeklyProtein)

                        .textFieldStyle(RoundedBorderTextFieldStyle())



                    Text("How Many Times Do You Work Out Weekly?")

                        .font(.custom("Avenir Next", size: 18))

                    TextField("Workout Frequency", text: $workoutFrequency)

                        .textFieldStyle(RoundedBorderTextFieldStyle())

                }

            }



            Spacer()



            NavigationLink(destination: PlanView(

                firstName: firstName,

                lastName: lastName,

                selectedGoals: selectedGoals,

                currentWeight: Double(currentWeight) ?? nil,

                idealWeight: Double(idealWeight) ?? nil,

                workoutFrequency: Int(workoutFrequency) ?? nil

            )) {

                Text("Generate Plan")

                    .font(.custom("Avenir Next", size: 20))

                    .padding()

                    .background(Color.blue)

                    .foregroundColor(.white)

                    .cornerRadius(10)

            }

            .padding(.bottom, 20)

        }

        .padding()

    }

}
