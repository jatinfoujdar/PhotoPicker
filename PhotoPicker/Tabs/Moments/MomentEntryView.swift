//
//  MomentEntryView.swift
//  PhotoPicker
//
//  Created by jatin foujdar on 31/01/26.
//

import SwiftUI

struct MomentEntryView: View {
    var body: some View {
        contentStack
    }
    
    var contentStack: some View {
        VStack(alignment: .leading){
            Text("Title")
            
            
            Text("Note")
        }
        .padding()
    }
}

#Preview {
    MomentEntryView()
}
