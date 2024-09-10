//
//  GoalSelectionView.swift
//  HealthTracker
//
//  Created by Raeva Desai on 8/17/24.
//

import SwiftUI



struct GoalSelectionView: View {

    @State private var selectedGoals = Set<UUID>()

    @State private var firstName = ""

    @State private var lastName = ""



    var body: some View {

        NavigationView {

            VStack {

                Image("logo")

                    .resizable()

                    .scaledToFit()

                    .frame(width: 200, height: 200)

                    .padding(.top, 10)



                VStack(spacing: 20) {

                    Text("Enter Your Name")

                        .font(.custom("Avenir Next", size: 24))

                        .fontWeight(.bold)



                    TextField("First Name", text: $firstName)

                        .textFieldStyle(RoundedBorderTextFieldStyle())

                        .padding(.horizontal)



                    TextField("Last Name", text: $lastName)

                        .textFieldStyle(RoundedBorderTextFieldStyle())

                        .padding(.horizontal)

                }

                .padding(.top, 20)



                Text("Select Your Goals")

                    .font(.custom("Avenir Next", size: 34))

                    .fontWeight(.bold)

                    .padding(.top, 20)



                List(Goal.allGoals) { goal in

                    GoalRow(goal: goal, isSelected: selectedGoals.contains(goal.id)) {

                        if selectedGoals.contains(goal.id) {

                            selectedGoals.remove(goal.id)

                        } else {

                            selectedGoals.insert(goal.id)

                        }

                    }

                }

                .listStyle(InsetGroupedListStyle())



                Spacer()



                NavigationLink(destination: WelcomeView(firstName: firstName, lastName: lastName, selectedGoals: selectedGoals)) {

                    Text("Continue")

                        .font(.custom("Avenir Next", size: 20))

                        .padding()

                        .background(selectedGoals.isEmpty ? Color.gray : Color.blue)

                        .foregroundColor(.white)

                        .cornerRadius(10)

                }

                .disabled(selectedGoals.isEmpty)

                .padding(.bottom, 20)

            }

            .padding()

        }

    }

}



struct GoalRow: View {

    let goal: Goal

    let isSelected: Bool

    let toggleSelection: () -> Void



    var body: some View {

        HStack {

            Text(goal.name)

                .font(.custom("Avenir Next", size: 18))



            Spacer()



            if isSelected {

                Image(systemName: "checkmark")

                    .foregroundColor(.blue)

            }

        }

        .contentShape(Rectangle())

        .onTapGesture {

            toggleSelection()

        }

    }

}
