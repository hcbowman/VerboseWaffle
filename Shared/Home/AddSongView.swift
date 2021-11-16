//
//  AddSongView.swift
//  VerboseWaffle
//
//  Created by Hunter Bowman on 11/14/21.
//

import SwiftUI

struct AddSongView: View {
	@Environment(\.managedObjectContext) var viewContext
	@Environment(\.presentationMode) var presentationMode
	
	@State private var name = ""
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Name of Song", text: $name)
				}
				
				Section {
					Button("Save") {
						// add the song
						let newSong = Song(context: self.viewContext)
						newSong.name = self.name
						
						// Attempt to save to the mananged object context
						try? self.viewContext.save()
						
						// Dismiss view
						self.presentationMode.wrappedValue.dismiss()
					}
				}
			}
			.navigationTitle("Add Song")
		}
    }
}

struct AddSongView_Previews: PreviewProvider {
    static var previews: some View {
        AddSongView()
    }
}
