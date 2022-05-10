//
//  AddWorkoutViewModel.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 13/04/2022.
//

import Foundation

class AddWorkoutViewModel: ObservableObject {
	
	// MARK: - Exposed properties

	@Published var name: String = ""
	@Published var exercices: [Exercice] = []
	@Published var showExerciceView: Bool = false
	@Published var selectedExercice: SelectedExercice? = nil
	
	private let dbmanager = DBManager.shared
	
	init() {
		fetchExercices()
	}
	
	func fetchExercices() {
		let exerciceResult = dbmanager.getExercices()
		switch exerciceResult {
		case .failure:              return
		case .success(let exercices):   self.exercices = exercices
		}
	}
	
	func addWorkout() {
		let workoutResult = DBManager.shared.addWorkout(
			name: name,
			exercices: exercices
		)
		
		switch workoutResult {
		case .success(let workout):
			print("Successfully added \(workout)")
		case .failure(let error):
			print(error.localizedDescription)
		}
	}
}
