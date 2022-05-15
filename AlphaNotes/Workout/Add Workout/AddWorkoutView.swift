//
//  AddWorkoutView.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 13/04/2022.
//

import SwiftUI

struct AddWorkoutView: View {
	@ObservedObject var vm = AddWorkoutViewModel()
	
	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Workout Name", text: $vm.name)
				}
				
//				Section {
//					if let selectedExercice = vm.selectedExercice {
//						Text(selectedExercice.exerciceName)
//							.font(.callout)
//							.foregroundColor(.secondary)
//					}
//				}
				
				Section {
					Button {
						vm.showExerciceView.toggle()
					} label: {
						Text("Add Exercice")
					}.sheet(
						isPresented: $vm.showExerciceView
					) { ExerciceView(selectedExercice: vm.selectedExercice) }
				}
				
				Section {
					Button {
						vm.addWorkout()
					} label: {
						HStack {
							Spacer()
							Text("Add")
								.font(.headline)
							Spacer()
						}
					}
					.disabled(vm.name.isEmpty ||
							  vm.name.trimmingCharacters(in: .whitespacesAndNewlines) == "")
				}
			}
			.navigationTitle("Add Workout")
			.navigationBarTitleDisplayMode(.inline)
		}
		.onAppear {
			vm.fetchExercices()
		}
	}
}

struct AddWorkoutView_Previews: PreviewProvider {
	static var previews: some View {
		AddWorkoutView()
	}
}
