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
	@Published var muscle1: String = ""
	@Published var muscle2: String = ""

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
