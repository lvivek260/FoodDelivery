//
//  ImagePickerButton.swift
//  FoodDelivery
//
//  Created by Neosoft on 11/11/24.
//

import SwiftUI

struct ImagePickerButton <Label: View> : View {
    @Binding var selectedImage: UIImage?
    @State private var showImagePickerActionSheet = false
    @State private var isImagePickerPresented = false
    @State private var showCameraUnavailableAlert = false
    @State private var imageSourceType: UIImagePickerController.SourceType? = nil
    
    var label: (() -> Label)
    var afterImageSelection: ((_ image: UIImage)->Void)?
    
    var body: some View {
        Button(action: {
            showImagePickerActionSheet.toggle()
        }, label: label)
        .actionSheet(isPresented: $showImagePickerActionSheet) {
            ActionSheet(
                title: Text("Select Image"),
                message: Text("Choose an option"),
                buttons: [
                    .default(Text("Camera")) {
                        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                            imageSourceType = .camera
                            isImagePickerPresented = true
                        } else {
                            showCameraUnavailableAlert = true
                        }
                    },
                    .default(Text("Photos from Gallery")) {
                        imageSourceType = .photoLibrary
                        isImagePickerPresented = true
                    },
                    .cancel()
                ]
            )
        }
        .sheet(isPresented: $isImagePickerPresented) {
            if let sourceType = imageSourceType {
                ImagePickerView(
                    selectedImage: $selectedImage,
                    showImagePicker: $showImagePickerActionSheet,
                    sourceType: sourceType
                )
            }
        }
        .alert(isPresented: $showCameraUnavailableAlert) {
            Alert(
                title: Text("Camera Unavailable"),
                message: Text("The camera is not available on this device."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
