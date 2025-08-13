//
//  IdiomDetailView.swift
//  Idioine
//
//

import SwiftUI

struct IdiomDetailView: View {

    let idiom: Idiom

    var body: some View {
        VStack(alignment: .leading, spacing: UIFont.systemFontSize * 1.5) {
            Text(idiom.word)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(idiom.pronunciation)
                .font(.headline)
                .foregroundColor(.secondary)

            Text(idiom.definition)
                .font(.body)
                .lineSpacing(UIFont.systemFontSize / 3.0)

            Spacer()

            Text("© 中華民國教育部")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .containerRelativeFrame(.horizontal, alignment: .leading)
        .navigationTitle(idiom.word)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    IdiomDetailView(idiom: Idiom(id: 0, word: "千金一諾", pronunciation: "ㄑㄧㄢ　ㄐㄧㄣ　ㄧˊ　ㄋㄨㄛˋ", definition: "形容信守承諾，說話算數。"))
}
