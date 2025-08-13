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

    var randomButton: some View {
        Button("隨機", systemImage: "shuffle") {
            selection = idioms.randomElement()?.id
        }
    }

    var body: some View {
        NavigationSplitView {
            List(searchResults, selection: $selection) { idiom in
                NavigationLink(idiom.word, value: idiom.id)
            }
            .navigationTitle("成語典")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "搜尋")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    randomButton
                }
            }
        } detail: {
            if let selection, let selected = idioms.first(where: { $0.id == selection }) {
                IdiomDetailView(idiom: selected)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        randomButton
                    }
                }
            } else {
                Text("選取成語")
            }
        }
    }
}

#Preview {
    IdiomsView()
}
