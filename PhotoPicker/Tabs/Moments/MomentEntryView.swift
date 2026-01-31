//
//  MomentEntryView.swift
//  PhotoPicker
//
//  Created by jatin foujdar on 31/01/26.
//

import SwiftUI

struct MomentEntryView: View {
    @State private var text: String = ""
    @State private var note: String = ""
    
    var body: some View {
        NavigationStack{
            ScrollView{
                contentStack
            }
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("Grateful Moment")
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
