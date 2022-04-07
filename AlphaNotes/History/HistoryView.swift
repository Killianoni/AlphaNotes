//
//  HistoryView.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 29/03/2022.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
		NavigationView {
			List {
				
			}
			.navigationTitle("Historique")
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

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
