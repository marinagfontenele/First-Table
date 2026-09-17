//
//  CameraService.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 01/09/26.
//

import AVFoundation
import Foundation
import UIKit

struct CapturedImage: @unchecked Sendable {
    let cgImage: CGImage
    let orientation: CGImagePropertyOrientation
}

enum CameraError: LocalizedError, Equatable {
    case permissionDenied
    case unavailable
    case captureFailed

    var errorDescription: String? {
        switch self {
        case .permissionDenied:
            "O acesso à câmera está desativado. Ative-o em Ajustes para reconhecer um ambiente."
        case .unavailable:
            "Nenhuma câmera está disponível neste dispositivo."
        case .captureFailed:
            "Não foi possível capturar a foto. Tente novamente."
        }
    }
}

@Observable
class CameraService: NSObject, @unchecked Sendable {
    enum Status: Equatable {
        case preparing
        case ready
        case failed(String)
    }
    
    let session = AVCaptureSession()
    private(set) var status: Status = .preparing
    
    private let photoOutput = AVCapturePhotoOutput()
    private var continuation: CheckedContinuation<CapturedImage, Error>?
    
    private var currentInput: AVCaptureDeviceInput?
    private(set) var cameraPosition: AVCaptureDevice.Position = .back
    
    
    func prepare() async {
        status = .preparing
        guard await requestPermission() else {
            status = .failed(CameraError.permissionDenied.localizedDescription)
            return
        }
        guard configureSession() else {
            status = .failed(CameraError.unavailable.localizedDescription)
            return
        }
        await session.startRunning()
        status = .ready
    }
    
    private func requestPermission() async -> Bool {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized: true
        case .notDetermined: await AVCaptureDevice.requestAccess(for: .video)
        default: false
        }
    }
    
    private func configureSession() -> Bool {
        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: cameraPosition),
              let input = try? AVCaptureDeviceInput(device: camera),
              session.canAddInput(input),
              session.canAddOutput(photoOutput) else {
            return false
        }
        session.beginConfiguration()
        session.sessionPreset = .photo
        session.addInput(input)
        session.addOutput(photoOutput)
        currentInput = input
        session.commitConfiguration()
        return true
    }
    
    func switchCamera() {
        let newPosition: AVCaptureDevice.Position =
        cameraPosition == .back ? .front : .back
        guard let newCamera = AVCaptureDevice.default(
            .builtInWideAngleCamera,
            for: .video,
            position: newPosition
        ),
              let newInput = try? AVCaptureDeviceInput(device: newCamera)
        else {
            return
        }
        
        session.beginConfiguration()
        
        if let currentInput {
            session.removeInput(currentInput)
        }
        if session.canAddInput(newInput) {
            session.addInput(newInput)
            currentInput = newInput
            cameraPosition = newPosition
        } else {
            if let currentInput,
               session.canAddInput(currentInput) { session.addInput(currentInput) }
        }
        session.commitConfiguration()
    }
    
    func capturePhoto() async throws -> CapturedImage {

        if let connection = photoOutput.connection(with: .video),
           connection.isVideoMirroringSupported {

            connection.automaticallyAdjustsVideoMirroring = false
            connection.isVideoMirrored = false
        }

        return try await withCheckedThrowingContinuation { continuation in
            self.continuation = continuation

            photoOutput.capturePhoto(
                with: AVCapturePhotoSettings(),
                delegate: self
            )
        }
    }
}

extension CameraService: AVCapturePhotoCaptureDelegate {

    func photoOutput(
        _ output: AVCapturePhotoOutput,
        didFinishProcessingPhoto photo: AVCapturePhoto,
        error: Error?
    ) {

        defer { continuation = nil }

        if let error {
            continuation?.resume(throwing: error)
            return
        }

        guard let data = photo.fileDataRepresentation(),
              let originalImage = UIImage(data: data) else {

            continuation?.resume(
                throwing: CameraError.captureFailed
            )

            return
        }

        let finalImage: UIImage

        if cameraPosition == .front {
            finalImage = originalImage.horizontallyFlipped()
        } else {
            finalImage = originalImage
        }

        guard let cgImage = finalImage.cgImage else {
            continuation?.resume(
                throwing: CameraError.captureFailed
            )

            return
        }

        continuation?.resume(
            returning: CapturedImage(
                cgImage: cgImage,
                orientation: finalImage.imageOrientation.cgImagePropertyOrientation
            )
        )
    }
}

extension CapturedImage {
    var uiImage: UIImage {
        UIImage(cgImage: cgImage, scale: 1, orientation: orientation.uiImageOrientation)
    }
}

private extension CGImagePropertyOrientation {
    var uiImageOrientation: UIImage.Orientation {
        switch self {
        case .up: .up
        case .down: .down
        case .left: .left
        case .right: .right
        case .upMirrored: .upMirrored
        case .downMirrored: .downMirrored
        case .leftMirrored: .leftMirrored
        case .rightMirrored: .rightMirrored
        }
    }
}

extension UIImage.Orientation {
    var cgImagePropertyOrientation: CGImagePropertyOrientation {
        switch self {
        case .up: .up
        case .down: .down
        case .left: .left
        case .upMirrored: .upMirrored
        case .downMirrored: .downMirrored
        case .leftMirrored: .leftMirrored
        case .rightMirrored: .rightMirrored
        case .right: .right
        }
    }
}

private extension UIImage.Orientation {
    var withoutMirroring: UIImage.Orientation {
        switch self {
        case .upMirrored:
            return .up

        case .downMirrored:
            return .down

        case .leftMirrored:
            return .left

        case .rightMirrored:
            return .right

        default:
            return self
        }
    }
}

extension UIImage {
    func horizontallyFlipped() -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = self.scale

        let renderer = UIGraphicsImageRenderer(
            size: self.size,
            format: format
        )

        return renderer.image { context in
            let cgContext = context.cgContext

            cgContext.translateBy(x: self.size.width, y: 0)
            cgContext.scaleBy(x: -1, y: 1)

            self.draw(
                in: CGRect(
                    origin: .zero,
                    size: self.size
                )
            )
        }
    }
}
