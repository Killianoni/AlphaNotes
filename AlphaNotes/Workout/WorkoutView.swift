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
				if vm.workouts.isEmpty {
					HStack {
						Spacer()
						Text("No workouts")
						Spacer()
					}
				} else {
					ForEach(vm.workouts) { workout in
						HStack {
							if let name = workout.name {
								Text(name)
							}
						}
					}.onDelete { offsets in
						vm.deleteWorkout(at: offsets)
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
					vm.fetchWorkouts()
				}) { AddWorkoutView() }
		}.onAppear {
			vm.fetchWorkouts()
		}
	}
}

struct WorkoutView_Previews: PreviewProvider {
	static var previews: some View {
		WorkoutView()
	}
}
