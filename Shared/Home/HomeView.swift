//
//  HomeView.swift
//  VerboseWaffle
//
//  Created by Hunter Bowman on 11/14/21.
//

import SwiftUI

struct HomeView: View {
	
	@Environment(\.managedObjectContext) var viewContext
	
	@FetchRequest(
		entity: Song.entity(),
		sortDescriptors: [NSSortDescriptor(keyPath: \Song.name, ascending: true)],
		animation: .default)
	private var songs: FetchedResults<Song>
	
	@State private var showingAddScreen = false
	
	var body: some View {
		NavigationView {
			List {
				ForEach(songs) { song in
					Text("Name: \(song.name!)")
				}
				Text("Count: \(songs.count)")
			}
			.navigationTitle("Verbose Waffle.Songs ")
			.navigationBarItems(trailing: Button(action: {
				self.showingAddScreen.toggle()
			}) {
				Image(systemName: "plus")
			})
			.sheet(isPresented: $showingAddScreen) {
				AddSongView().environment(\.managedObjectContext, self.viewContext)
			}
		}

	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
		
		
	}
}
