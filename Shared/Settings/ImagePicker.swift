//
//  ImagePicker.swift
//  VerboseWaffle
//
//  Created by Hunter Bowman on 11/14/21.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
	@Environment(\.presentationMode) var presentationMode
	@Binding var image: UIImage?
	
	func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
		let picker = UIImagePickerController()
		//picker.sourceType = .camera
		//picker.allowsEditing = true
		picker.delegate = context.coordinator
		return picker
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
		
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
	let parent: ImagePicker
	
	init(_ parent: ImagePicker) {
		self.parent = parent
	}
	
	
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let myImage = info[.originalImage] as? UIImage {
			parent.image = myImage
		}
		parent.presentationMode.wrappedValue.dismiss()
	}
	
	
}
