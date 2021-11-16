//
//  ContentView.swift
//  Shared
//
//  Created by Hunter Bowman on 10/30/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
	@Environment(\.managedObjectContext) var viewContext
	
	@State private var selectedTab = 0
	
	
	
	var body: some View {
		
		TabView(selection: $selectedTab) {
			
			HomeView()
				.onTapGesture {
					self.selectedTab = 1
				}
				.tabItem {
					Text("Tab Label 1")
				}
				.tag(1)
			
			OtherView()
				.tabItem {
					Text("Tab Label 2")
				}
				.tag(2)
			
			SettingsView()
				.tabItem {
					Text("Settings")
				}
				.tag(3)
			
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			ContentView()
			//ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
		}
	}
}
