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
					}.onDelete { offsets in
						vm.deleteExercice(at: offsets)
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
					Button {
						vm.showAddWorkoutView.toggle()
					} label: {
						Image(systemName: "plus")
					}
			).sheet(
				isPresented: $vm.showAddWorkoutView,
				onDismiss: {
					vm.fetchExercices()
				}) { AddWorkoutView() }
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
