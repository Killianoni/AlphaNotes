//
//  WorkoutViewModel.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 13/04/2022.
//

import Foundation
import CoreData

class WorkoutViewModel: ObservableObject {
	@Published var exercices = [Exercice]()
	@Published var showAddWorkoutView: Bool = false
	
	
	private let dbmanager = DBManager.shared
	
	init() {
		fetchExercices()
	}
	
	func fetchExercices() {
		let exercicesResult = dbmanager.getExercices()
		switch exercicesResult {
		case .failure:              return
		case .success(let exercices):   self.exercices = exercices
		}
	}
	
	func deleteExercice(at offsets: IndexSet) {
		offsets.forEach { index in
			let exercice = exercices[index]
			dbmanager.deleteExercice(by: exercice.objectID)
		}
		exercices.remove(atOffsets: offsets)
	}
	
}
