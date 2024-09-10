//
//  ImagePicker.swift
//  HealthTracker
//
//  Created by Raeva Desai on 8/17/24.
//

import SwiftUI

import UIKit

import Vision



struct ImagePicker: UIViewControllerRepresentable {

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        let parent: ImagePicker



        init(parent: ImagePicker) {

            self.parent = parent

        }



        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let uiImage = info[.originalImage] as? UIImage {

                parent.image = uiImage

                parent.recognizeText(in: uiImage)

            }



            parent.presentationMode.wrappedValue.dismiss()

        }



        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {

            parent.presentationMode.wrappedValue.dismiss()

        }

    }



    @Environment(\.presentationMode) var presentationMode

    @Binding var image: UIImage?

    @Binding var recognizedText: String



    func makeCoordinator() -> Coordinator {

        Coordinator(parent: self)

    }



    func makeUIViewController(context: Context) -> UIImagePickerController {

        let picker = UIImagePickerController()

        picker.delegate = context.coordinator

        picker.sourceType = .camera

        return picker

    }



    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}



    func recognizeText(in image: UIImage) {

        guard let cgImage = image.cgImage else { return }



        let request = VNRecognizeTextRequest { (request, error) in

            if let error = error {

                print("Error recognizing text: \(error.localizedDescription)")

                return

            }

            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }

            

            var detectedText = ""

            for observation in observations {

                if let topCandidate = observation.topCandidates(1).first {

                    detectedText += topCandidate.string + "\n"

                }

            }

            

            DispatchQueue.main.async {

                self.recognizedText = detectedText

                print("Recognized text: \(detectedText)") // Debug log

            }

        }



        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])

        

        do {

            try requestHandler.perform([request])

        } catch {

            print("Error performing OCR: \(error.localizedDescription)")

        }

    }

}
