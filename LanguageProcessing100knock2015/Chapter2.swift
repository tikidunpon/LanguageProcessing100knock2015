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
    static func q12(input: String, column: Int) -> String {
        let rows = input.components(separatedBy: CharacterSet.newlines)
        
        let column = rows.map {
            return !$0.isEmpty ? $0.components(separatedBy: CharacterSet.whitespaces)[column - 1] : $0
        }
        return column.joined(separator: "\n")
    }
    
    // 13. col1.txtとcol2.txtをマージ
    // 12で作ったcol1.txtとcol2.txtを結合し，元のファイルの1列目と2列目をタブ区切りで並べたテキストファイルを作成せよ．確認にはpasteコマンドを用いよ．
    static func q13(column1: String, column2: String) -> String {
        return zip(column1.components(separatedBy: "\n"),
                   column2.components(separatedBy: "\n"))
            .map{ !$0.isEmpty ? "\($0)\t\($1)" : $0 }.joined(separator: "\n")
    }
    
}
