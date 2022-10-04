//
//  TabBarView.swift
//  AlphaNotes
//
//  Created by Killian Adonaï on 29/03/2022.
//

import SwiftUI

struct TabBarView: View {
	@State private var selection: Int = 0
    var body: some View {
		TabView(selection: $selection) {
			HistoryView()
				.tabItem { Label("Journal", systemImage: "book")}
				.tag(0)
			WorkoutView()
				.tabItem { Label("Entrainements", systemImage: "figure.walk")}
				.tag(1)
			ProfileView()
				.tabItem { Label("Profil", systemImage: "person")}
				.tag(3)
		}
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
