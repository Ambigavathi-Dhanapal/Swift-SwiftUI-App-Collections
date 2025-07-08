//
//  OCRScannerView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import SwiftUI
import VisionKit
import Vision


struct OCRScannerView: UIViewControllerRepresentable {
    var onTextExtracted: (String) -> Void
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(onTextExtracted: onTextExtracted)
    }
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scanner = VNDocumentCameraViewController()
        scanner.delegate = context.coordinator
        return scanner
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {}
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        var onTextExtracted: (String) -> Void
        
        init(onTextExtracted: @escaping (String) -> Void) {
            self.onTextExtracted = onTextExtracted
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            controller.dismiss(animated: true)
            
            var recognizedText = ""
            let dispatchGroup = DispatchGroup()
            
            for pageIndex in 0..<scan.pageCount {
                let image = scan.imageOfPage(at: pageIndex)
                dispatchGroup.enter()
                
                let requestHandler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
                let request = VNRecognizeTextRequest { request, error in
                    if let results = request.results as? [VNRecognizedTextObservation] {
                        for result in results {
                            if let candidate = result.topCandidates(1).first {
                                recognizedText += candidate.string + "\n"
                            }
                        }
                    }
                    dispatchGroup.leave()
                }
                
                request.recognitionLevel = .accurate
                try? requestHandler.perform([request])
            }
            
            dispatchGroup.notify(queue: .main) {
                self.onTextExtracted(recognizedText)
            }
        }
    }
}

#Preview {
    
}
