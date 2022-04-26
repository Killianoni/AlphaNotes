//
//  DBManager.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 13/04/2022.
//

import CoreData
import Foundation

struct DBManager {
	static let shared = DBManager()

	let container: NSPersistentContainer

	init(inMemory: Bool = false) {
		container = NSPersistentContainer(name: "AlphaNotes")
		if inMemory {
			container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
		}
		container.viewContext.automaticallyMergesChangesFromParent = true
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
	}
	
	
	func addExercice(
		name: String,
		muscle1: String,
		muscle2: String,
		exerciceId: NSManagedObjectID? = nil
	) -> Result<Exercice, Error> {

		let context = container.viewContext
		let exercice = Exercice(entity: Exercice.entity(),
						insertInto: DBManager.shared.container.viewContext)
		exercice.name = name
		exercice.muscle1 = muscle1
		exercice.muscle2 = muscle2

		do {
			try context.save()
			return .success(exercice)
		} catch {
			return .failure(error)
		}
	}
	
	func getExercices() -> Result<[Exercice], Error> {
		let fetchRequest = Exercice.fetchRequest()
		let descriptor: NSSortDescriptor = NSSortDescriptor(key: "muscle1", ascending: true)
		fetchRequest.sortDescriptors = [descriptor]
//		let predicate = NSPredicate(format: "isFavorite == true")
//
//		if shouldFetchOnlyFavs { fetchRequest.predicate = predicate }
		let context = container.viewContext

		do {
			let exercices = try context.fetch(fetchRequest)
			return .success(exercices)
		} catch {
			return .failure(error)
		}
	}
	
}
