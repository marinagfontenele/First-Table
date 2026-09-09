//
//  CameraView.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 01/09/26.
//

import SwiftUI

struct CameraView: View {
    @EnvironmentObject var navigation: NavigationManager
    
    @Environment(\.dismiss) var dismiss
    @State private var showAlert: Bool = false
    
    @State private var cameraService = CameraService()
    @State private var capturedImage: UIImage?
    
    var body: some View {
        
        let photoSession = navigation.photoSession
        let modelService = navigation.modelService
        
        VStack /*ZStack(alignment: .bottom)*/{
            CameraPreview(session: cameraService.session)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .aspectRatio(3.0 / 4.0, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
        
        Button {
            captureImage()
        } label: {
            ZStack {
                Circle()
                    .fill(.gray.opacity(0.5))
                    .frame(width: 90, height: 90)

                Circle()
                    .fill(.white)
                    .frame(width: 75, height: 75)
            }
            .padding(.top)
        }
        
        
        .navigationTitle("Desafio")
        .navigationBarTitleDisplayMode(.inline)
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
                let photo = try await cameraService.capturePhoto()
                
                capturedImage = photo.uiImage
                
                navigation.capturedImage = capturedImage
                navigation.navigate(to: .confirmation)
            } catch {
                print("Erro ao tirar a foto: \(error)")
            }
        }
    }
    
}

//#Preview {
//    CameraView()
//}
