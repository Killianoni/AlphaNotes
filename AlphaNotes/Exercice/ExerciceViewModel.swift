//
//  ExerciceViewModel.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 10/05/2022.
//

import Foundation

class ExerciceViewModel: ObservableObject {
	
	@Published var exercices = [Exercice]()
	@Published var showAddExerciceView: Bool = false
	
	
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
	
	func deleteExercice(at offsets: IndexSet) {
		offsets.forEach { index in
			let exercice = exercices[index]
			dbmanager.deleteExercice(by: exercice.objectID)
		}
		exercices.remove(atOffsets: offsets)
	}
}
