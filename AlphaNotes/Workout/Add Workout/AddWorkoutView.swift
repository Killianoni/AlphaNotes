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
					TextField("Exercice Name", text: $vm.name)
					TextField("Primary Muscle", text: $vm.muscle1)
					TextField("Secondary Muscle", text: $vm.muscle2)
				}
				Section {
					Button {
						vm.addExercice()
					} label: {
						HStack {
							Spacer()
							Text("Add")
								.font(.headline)
							Spacer()
						}
					}
				}
			}
			.navigationTitle("Add Exercice")
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}

struct AddWorkoutView_Previews: PreviewProvider {
	static var previews: some View {
		AddWorkoutView()
	}
}
