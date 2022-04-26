//
//  WorkoutView.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 29/03/2022.
//

import SwiftUI

struct WorkoutView: View {
	@ObservedObject var vm = WorkoutViewModel()
	var body: some View {
		NavigationView {
			List {
				if vm.exercices.isEmpty {
					HStack {
						Spacer()
						Text("Please add a new exercice")
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
			.navigationTitle("Entrainements")
			.navigationBarItems(
				leading:
					Button {
						//add workout
					} label: {
						Text("Modifier")
					}
			)
			.navigationBarItems(
				trailing:
					NavigationLink {
						AddWorkoutView()
					} label: {
						Image(systemName: "plus")
					}
			)
		}.onAppear {
			vm.fetchExercices()
		}
	}
}

struct WorkoutView_Previews: PreviewProvider {
	static var previews: some View {
		WorkoutView()
	}
}
