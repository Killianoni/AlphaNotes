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
		let context = container.viewContext

		do {
			let exercices = try context.fetch(fetchRequest)
			return .success(exercices)
		} catch {
			return .failure(error)
		}
	}
	
	func getWorkout() -> Result<[Workout], Error> {
		let fetchRequest = Workout.fetchRequest()
		let descriptor: NSSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
		fetchRequest.sortDescriptors = [descriptor]
		let context = container.viewContext

		do {
			let workouts = try context.fetch(fetchRequest)
			return .success(workouts)
		} catch {
			return .failure(error)
		}
	}
	
	func addWorkout(
		name: String,
		exercicesId: [Int],
		
		workoutId: NSManagedObjectID? = nil
	) -> Result<Workout, Error> {

		let context = container.viewContext
		let workout = Workout(entity: Workout.entity(),
						insertInto: DBManager.shared.container.viewContext)
		workout.name = name

		do {
			try context.save()
			return .success(workout)
		} catch {
			return .failure(error)
		}
	}
	
	@discardableResult
	func deleteExercice(by id: NSManagedObjectID) -> Result<Void, Error> {
		let context = container.viewContext
		do {
			let exercice = try context.existingObject(with: id) as! Exercice
			context.delete(exercice)
			try context.save()
			return .success(())
		} catch {
			return .failure(error)
		}
	}
	
	@discardableResult
	func deleteWorkout(by id: NSManagedObjectID) -> Result<Void, Error> {
		let context = container.viewContext
		do {
			let workout = try context.existingObject(with: id) as! Workout
			context.delete(workout)
			try context.save()
			return .success(())
		} catch {
			return .failure(error)
		}
	}
	
}
