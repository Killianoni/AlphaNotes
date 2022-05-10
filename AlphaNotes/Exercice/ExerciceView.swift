//
//  ExerciceView.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 10/05/2022.
//

import SwiftUI

struct ExerciceView: View {
	@ObservedObject private var vm = ExerciceViewModel()
	
	var body: some View {
		NavigationView {
			List {
				if vm.exercices.isEmpty {
					HStack {
						Spacer()
						Text("No Exercices")
						Spacer()
					}
				} else {
					ForEach(vm.exercices) { exercice in
						HStack {
							if let name = exercice.name {
								Text(name)
							}
						}
					}
				}
			}
			
			.navigationTitle("Exercices")
			.navigationBarItems(
				trailing:
					Button {
						vm.showAddExerciceView.toggle()
					} label: {
						Image(systemName: "plus")
					}
			).sheet(
				isPresented: $vm.showAddExerciceView,
				onDismiss: {
					vm.fetchExercices()
				}) { AddExerciceView() }
				.onAppear {
					vm.fetchExercices()
				}
		}
	}
}

struct ExerciceView_Previews: PreviewProvider {
	static var previews: some View {
		ExerciceView()
	}
}
