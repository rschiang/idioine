//
//  Font+Extension.swift
//  Idioine
//
//

import SwiftUI

let iansuiFontName = "Iansui"

extension Font {
    static func iansui(withStyle style: UIFont.TextStyle) -> Font {
        let systemFontSize = UIFont.preferredFont(forTextStyle: style).pointSize
        return .custom(iansuiFontName, size: systemFontSize)
    }
}
