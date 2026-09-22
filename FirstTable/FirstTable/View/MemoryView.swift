//
//  MemoryView.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 03/09/26.
//

import SwiftUI

struct MemoryView: View {
    @EnvironmentObject var navigation: NavigationManager
    @State private var shareImage: ShareImage?
    @State private var showAlert: Bool = false
    var body: some View {
        if let photoSession = navigation.photoSession{
            VStack{
                if photoSession.totalQuestions == 5 {
                    ThreePicturesTemplate(photoSession: photoSession)
                } else {
                    FivePictureTemplate(photoSession: photoSession)
                }
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel(Text("Colagem de fotos com as fotografias tiradas durante a partida"))
            .background(Color.bgBlack.ignoresSafeArea())
            .navigationTitle("Memória")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        showAlert.toggle()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .accessibilityLabel(Text("Voltar para a tela inicial"))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let image: UIImage?
                        if photoSession.totalQuestions == 5 {
                            image = renderView {
                                ThreePicturesTemplate(photoSession: photoSession)
                                    .environment(\.dynamicTypeSize, .medium)
                            }
                        } else {
                            image = renderView {
                                FivePictureTemplate(photoSession: photoSession)
                                    .environment(\.dynamicTypeSize, .medium)
                            }
                        }
                        if let image {
                            shareImage = ShareImage(image: image)
                        }

                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .alert("Tem certeza que deseja sair?", isPresented: $showAlert) {
                
                Button("Cancelar", role: .cancel) {}
                Button("Sair", role: .destructive) {
                    navigation.goHome()
                }
                      
            } message: {
            Text("As alterações feitas serão perdidas.")
            }
            .sheet(item: $shareImage) { item in
                ShareSheet(items: [item.image])
            }
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) { }
}



//#Preview {
//    MemoryThreePicturesView()
//}
