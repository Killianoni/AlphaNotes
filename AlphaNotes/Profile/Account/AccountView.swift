//
//  AccountView.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 13/04/2022.
//

import SwiftUI

struct AccountView: View {
	@State var selection: Set<String>
	
	let names = [
		"Cyril",
		"Lana",
		"Mallory",
		"Sterling"
	]
	var body: some View {
		NavigationView {
			List(names, id: \.self, selection: $selection) { name in
				Text(name)
			}
			.navigationTitle("List Selection")
			.toolbar {
				EditButton()
			}
		}
	}
}

struct AccountView_Previews: PreviewProvider {
	static var previews: some View {
		AccountView(selection: Set())
	}
}
