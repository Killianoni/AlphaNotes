//
//  ProfileView.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 29/03/2022.
//

import SwiftUI

struct ProfileView: View {
	var body: some View {
		NavigationView {
			Form {
				Section {
					NavigationLink {
						AccountView()
					} label: {
						HStack {
							Label("<mail address>", systemImage: "envelope")
						}
					}
				} header: {
					Text("Account")
				}
			}
			.navigationTitle("Profil")
			.navigationBarItems(
				trailing:
					NavigationLink {
						SettingsView()
					} label: {
						Image(systemName: "gearshape.fill")
					}
			)
		}
	}
}

struct ProfileView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileView()
	}
}
