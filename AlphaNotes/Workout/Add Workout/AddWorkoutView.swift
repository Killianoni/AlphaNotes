//
//  AddWorkoutView.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 13/04/2022.
//

import SwiftUI

struct AddWorkoutView: View {
	@ObservedObject var vm = AddWorkoutViewModel()
	var body: some View {
		NavigationView {
			Form {
				Section {
					//TextField("Exercice Name")
					//TextField("Primary Muscle")
					//TextField("Secondary Muscle")
				}
				Section {
					Button {
						//add exercice
					} label: {
						HStack {
							Spacer()
							Text("Add")
								.font(.headline)
							Spacer()
						}
					}
				}
			}
			.navigationTitle("Add Exercice")
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}

struct AddWorkoutView_Previews: PreviewProvider {
	static var previews: some View {
		AddWorkoutView()
	}
}
