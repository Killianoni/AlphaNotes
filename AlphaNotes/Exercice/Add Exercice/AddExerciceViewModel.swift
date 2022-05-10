//
//  AddExerciceViewModel.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 10/05/2022.
//

import Foundation

class AddExerciceViewModel: ObservableObject {
	
	// MARK: - Exposed properties

	@Published var name: String = ""
	@Published var muscle1: String = ""
	@Published var muscle2: String = ""
	@Published var muscles =
	["Pectoraux", "Dos", "Triceps", "Biceps", "Epaules", "Ischios", "Quadriceps", "Mollets", "A-B"]

	// MARK: - Public
	
//	init() {
//		addExercice()
//	}
	
	func addExercice() {
		let exerciceResult = DBManager.shared.addExercice(
			name: name,
			muscle1: muscle1,
			muscle2: muscle2
		)
		
		switch exerciceResult {
		case .success(let exercice):
			print("Successfully added \(exercice)")
		case .failure(let error):
			print(error.localizedDescription)
		}
	}
}
