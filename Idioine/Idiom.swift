//
//  Idiom.swift
//  Idioine
//
//

struct Idiom: Codable, Identifiable {
    let id: Int
    let word: String
    let pronunciation: String
    let definition: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case word = "word"
        case pronunciation = "ruby"
        case definition = "def"
    }
}
