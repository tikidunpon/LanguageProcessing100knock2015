//
//  Chapter2.swift
//  LanguageProcessing100knock2015
//
//  Created by koichi tanaka on 2017/10/08.
//  Copyright © 2017年 koichi tanaka. All rights reserved.
//

import Foundation

struct Chapter2 {
    // 10. 行数のカウント
    // 行数をカウントせよ．確認にはwcコマンドを用いよ．
    static func q10(input: String) -> Int {
        let result = input.components(separatedBy: CharacterSet.newlines)
        return result.isEmpty ? result.count - 1 : result.count
    }
    
    // 11. タブをスペースに置換
    // タブ1文字につきスペース1文字に置換せよ．確認にはsedコマンド，trコマンド，もしくはexpandコマンドを用いよ．
    static func q11(input: String) -> String {
        return input.replacingOccurrences(of: "\t", with: " ", options: .regularExpression, range: nil)
    }
    
    //12. 1列目をcol1.txtに，2列目をcol2.txtに保存
    //各行の1列目だけを抜き出したものをcol1.txtに，2列目だけを抜き出したものをcol2.txtとしてファイルに保存せよ．確認にはcutコマンドを用いよ．
    static func q12(input: String) -> (String, String) {
        let rows = input.components(separatedBy: CharacterSet.newlines).filter{ !$0.isEmpty }
        let firstColumn = rows.map{ $0.components(separatedBy: CharacterSet.whitespaces).first! }
        let secondColumn = rows.map{ $0.components(separatedBy: CharacterSet.whitespaces)[1] }
        let tuple = (firstColumn.joined(separator: "\n"), secondColumn.joined(separator: "\n"))
        return tuple
    }
    

    
}
