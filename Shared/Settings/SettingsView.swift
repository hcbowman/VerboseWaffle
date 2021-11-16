//
//  SettingsView.swift
//  VerboseWaffle
//
//  Created by Hunter Bowman on 11/10/21.
//

import Foundation
import SwiftUI
import AuthenticationServices


struct SettingsView: View {
	
	enum NotifyMeAboutType {
		case directMessages
		case mentions
		case anything
	}
	
	enum ProfileImageSize {
		case small
		case medium
		case large
	}
	
	@State private var showingImagePicker = false
	@State private var profilePic: Image?
	@State private var inputImage: UIImage?
	
	@State private var userLoggedIn = false
	
	@State private var notifyMeAbout = NotifyMeAboutType.anything
	@State private var playNotificationSounds = false
	@State private var sendReadReceipts = true
	@State private var profileImageSize = ProfileImageSize.medium
	
	var body: some View {
		
		VStack {
			
			
			ZStack {
				Circle()
					.fill(Color.gray)
					.frame(width: 125, height: 125, alignment: .center)
					.overlay {
						Circle().stroke(.white, lineWidth: 2)
					}
				.shadow(radius: 7)
				// Display Image
				if profilePic != nil {
					profilePic?
						.resizable()
						.scaledToFit()
				} else {
					Text("Tap to select a picture")
						.foregroundColor(.black)
						.font(.headline)
						.multilineTextAlignment(.center)
						.frame(width: 120, height: 120, alignment: .center)
				}
			}
			.onTapGesture {
				// Image Picker
				self.showingImagePicker = true
			}
			
			Form {
				
				Section(header: Text("Account")) {
					
					SignInWithAppleButton(
						onRequest: { request in
							print("request sign in")
						},
						onCompletion: { result in
							print("sign in")
						}
					)
				}
				Section(header: Text("Notifications")) {
					Picker("Notify Me About", selection: $notifyMeAbout) {
						Text("Direct Messages").tag(NotifyMeAboutType.directMessages)
						Text("Mentions").tag(NotifyMeAboutType.mentions)
						Text("Anything").tag(NotifyMeAboutType.anything)
					}
					Toggle("Play notification sounds", isOn: $playNotificationSounds)
					Toggle("Send read receipts", isOn: $sendReadReceipts)
				}
				Section(header: Text("User Profiles")) {
					Picker("Profile Image Size", selection: $profileImageSize) {
						Text("Large").tag(ProfileImageSize.large)
						Text("Medium").tag(ProfileImageSize.medium)
						Text("Small").tag(ProfileImageSize.small)
					}
					Button("Clear Image Cache") {}
				}
				
			}
			
			
		}
		.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
			ImagePicker(image: self.$inputImage)
		}
		
	}
	
	
	func loadImage() {
		guard let inputImage = inputImage else { return }
		profilePic = Image(uiImage: inputImage)
	}
}

struct MapView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}

