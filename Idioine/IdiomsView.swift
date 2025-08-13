//
//  ContentView.swift
//  Idioine
//
//

import SwiftUI

struct IdiomsView: View {
    
    let idioms: [Idiom] = Bundle.main.decode(fromJson: "idioms")

    @State private var searchText: String = ""
    @State private var selection: Idiom.ID? = nil

    var searchResults: [Idiom] {
        guard !searchText.isEmpty else { return idioms }
        return idioms.filter { $0.word.contains(searchText) }
    }

    var body: some View {
        NavigationSplitView {
            List(searchResults, selection: $selection) { idiom in
                Text(idiom.word)
            }
            .navigationTitle("成語典")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "搜尋")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("隨機", systemImage: "shuffle") {

                    }
                }
            }
        } detail: {
            if let selection {
                IdiomDetailView(idiom: idioms[selection])
            } else {
                Text("選取成語")
            }
        }
    }
}

#Preview {
    IdiomsView()
}
