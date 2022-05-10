//
//  WorkoutViewModel.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 13/04/2022.
//

import Foundation
import CoreData


class WorkoutViewModel: ObservableObject {
	@Published var workouts = [Workout]()
	@Published var showAddWorkoutView: Bool = false
	
	
	private let dbmanager = DBManager.shared
	
	init() {
		fetchWorkouts()
	}
	
	func fetchWorkouts() {
		let workoutResult = dbmanager.getWorkout()
		switch workoutResult {
		case .failure:              return
		case .success(let workouts):   self.workouts = workouts
		}
	}
	
	func deleteWorkout(at offsets: IndexSet) {
		offsets.forEach { index in
			let workout = workouts[index]
			dbmanager.deleteExercice(by: workout.objectID)
		}
		workouts.remove(atOffsets: offsets)
	}
	
}
