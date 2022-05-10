//
//  AddExerciceView.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 10/05/2022.
//

import SwiftUI

struct AddExerciceView: View {
	
	@ObservedObject var vm = AddExerciceViewModel()
//	@State private var selectedMuscle1 = "Pectoraux"
//	@State private var selectedMuscle2 = "Pectoraux"
	
	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Exercice Name", text: $vm.name)
					
					Picker("Primary Muscle", selection: $vm.muscle1) {
						ForEach(vm.muscles, id: \.self) {
							Text($0)
						}
					}
					Picker("Secondary Muscle", selection: $vm.muscle2) {
						ForEach(vm.muscles, id: \.self) {
							Text($0)
						}
					}
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
				.navigationTitle("Add Exercice")
				.navigationBarTitleDisplayMode(.inline)
				
			}
		}
	}
}

struct AddExerciceView_Previews: PreviewProvider {
	static var previews: some View {
		AddExerciceView()
	}
}
