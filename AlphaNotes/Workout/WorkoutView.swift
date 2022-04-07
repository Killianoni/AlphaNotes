//
//  WorkoutView.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 29/03/2022.
//

import SwiftUI

struct WorkoutView: View {
    var body: some View {
		NavigationView {
			List {
				
			}
			.navigationTitle("Entrainements")
			.navigationBarItems(
				leading:
					Button {
						//add workout
					} label: {
						Text("Modifier")
					}
			)
			.navigationBarItems(
				trailing:
					Button {
						//add workout
					} label: {
						Image(systemName: "plus")
					}
			)
		}
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
