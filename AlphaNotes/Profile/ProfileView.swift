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
			List {
				
			}
			.navigationTitle("Profil")
			.navigationBarItems(
				trailing:
					Button {
						//add workout
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
