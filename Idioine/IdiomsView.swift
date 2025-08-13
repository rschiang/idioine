//
//  ContentView.swift
//  Idioine
//
//

import SwiftUI

struct IdiomsView: View {
    
    let idioms: [Idiom] = Bundle.main.decode(fromJson: "idioms")

    @State private var searchText: String = ""

    var searchResults: [Idiom] {
        guard !searchText.isEmpty else { return idioms }
        return idioms.filter { $0.word.contains(searchText) }
    }

    var body: some View {
        NavigationView {
            List(searchResults) { idiom in
                NavigationLink(destination: IdiomDetailView(idiom: idiom)) {
                    Text(idiom.word)
                }
            }
            .navigationTitle("成語典")
            .searchable(text: $searchText, prompt: "搜尋")
        }
    }
}

#Preview {
    IdiomsView()
}
