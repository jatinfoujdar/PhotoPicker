//
//  MomentEntryView.swift
//  PhotoPicker
//
//  Created by jatin foujdar on 31/01/26.
//

import SwiftUI
import PhotosUI

struct MomentEntryView: View {
    @State private var text: String = ""
    @State private var note: String = ""
    @State private var imageData: Data?
    @State private var newImage: PhotosPickerItem?
    
    var body: some View {
        NavigationStack{
            ScrollView{
                contentStack
            }
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("Grateful Moment")
        }
    }
    
    var photoPicker: some View {
        PhotosPicker(selection: $newImage) {
            Group{
                Image(systemName: "photo.badge.plus.fill")
                    .font(.largeTitle)
                    .frame(height: 250)
                    .frame(maxWidth: .infinity)
                    .background(Color(white: 0.4, opacity: 0.32))
            }
                    .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .onChange(of: newImage){
            guard let newImage else { return }
            Task{
                imageData = try await newImage.loadTransferable(type: Data.self)
            }
        }
    }
    
    
    var contentStack: some View {
        VStack(alignment: .leading){
            TextField(text: $text){
                Text("Title (Required)")
            }
            .font(.title.bold())
            .padding(.top, 40)
            
            Divider()
            
            TextField("Log you small wins",text: $note, axis: .vertical)
                .multilineTextAlignment(.leading)
                .lineLimit(5...Int.max)
        }
        .padding()
    }
}

#Preview {
    MomentEntryView()
}
