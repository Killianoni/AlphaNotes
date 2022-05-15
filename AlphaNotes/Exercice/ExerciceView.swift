//
//  ExerciceView.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 10/05/2022.
//

import SwiftUI

struct ExerciceView: View {
	@ObservedObject private var vm = ExerciceViewModel()
	@State var selectedExercice: SelectedExercice
	
	var body: some View {
		NavigationView {
			List {
				if vm.exercices.isEmpty {
					HStack {
						Spacer()
						Text("No Exercices")
						Spacer()
					}
				} else {
					ForEach(vm.exercices) { exercice in
						HStack {
							if let name = exercice.name {
								Text(name)
							}
						}
						//					List(vm.exercices, id: \.self, selection: $selectedExercice) { exercice in
						//						if let name = exercice.name {
						//							HStack {
						//								Text(name)
						//								Spacer()
						//								if exercice.objectID == selectedExercice.exerciceId {
						//									Image(systemName: "checkmark")
						//										.foregroundColor(.accentColor)
						//										.font(.headline)
						//								}
						//							}
						//							.contentShape(Rectangle())
						//							.onTapGesture {
						//								withAnimation {
						//									selectedExercice = SelectedExercice(
						//										exerciceId: exercice.objectID,
						//										exerciceName: name,
						//										exerciceMuscle1: exercice.muscle1!,
						//										exerciceMuscle2: exercice.muscle2!)
						//								}
						//							}
					}.onDelete { offsets in
						vm.deleteExercice(at: offsets)
					}
				}
			}
			
			
			.navigationTitle("Exercices")
			.navigationBarItems(
				leading:
					EditButton(),
				trailing:
					Button {
						vm.showAddExerciceView.toggle()
					} label: {
						Image(systemName: "plus")
					}
			).sheet(
				isPresented: $vm.showAddExerciceView,
				onDismiss: {
					vm.fetchExercices()
				}) { AddExerciceView() }
				.onAppear {
					vm.fetchExercices()
				}
		}
	}
}

