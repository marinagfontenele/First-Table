//
//  CameraView.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 01/09/26.
//

import SwiftUI

struct CameraView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showAlert: Bool = false
    
    @State private var cameraService = CameraService()
    @State private var capturedImage: UIImage?
    
    var body: some View {
        ZStack(alignment: .bottom){
            CameraPreview(session: cameraService.session)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            
            Button {
                captureImage()
            } label: {
                Circle()
                    .fill(.gray.exposureAdjust(5))
                    .frame(width: 90, height: 90)
                    .overlay(Circle().fill(.white).frame(width: 75, height: 75))
                    .padding(50)
            }
        }
        .navigationTitle("Desafio")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    showAlert.toggle()
                } label: {
                    Image(systemName: "xmark")
                }

            }
        }
        .alert("Tem certeza que deseja sair?", isPresented: $showAlert) {
            
            Button("Cancelar", role: .cancel) {}
            Button("Sair", role: .destructive) {
                dismiss()
            }
                  
        } message: {
        Text("As alterações feitas serão perdidas.")
        }
        .task {
            await cameraService.prepare()
        }
            
    }
    
    func captureImage() {
        Task {
            do {
                let capturedImage2 = try await cameraService.capturePhoto()
                
                capturedImage = capturedImage2.uiImage
            } catch {
                print("Erro ao tirar a foto: \(error)")
            }
        }
    }
    
}

#Preview {
    CameraView()
}
