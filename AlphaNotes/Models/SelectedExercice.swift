//
//  SelectedExercice.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 10/05/2022.
//

import Foundation
import CoreData.NSManagedObjectID

struct SelectedExercice: Hashable {
	var exerciceId: NSManagedObjectID
	var exerciceName: String
	var exerciceMuscle1: String?
	var exerciceMuscle2: String?
}
