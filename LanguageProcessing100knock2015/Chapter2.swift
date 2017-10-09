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
    
    //14. 先頭からN行を出力
    //自然数Nをコマンドライン引数などの手段で受け取り，入力のうち先頭のN行だけを表示せよ．確認にはheadコマンドを用いよ．
    static func head(input: String, rowNumber: Int) -> String {
        let rows = input.components(separatedBy: CharacterSet.newlines)
        guard rows.indices.contains(rowNumber - 1) else { return "" }
        return rows.prefix(rowNumber).joined(separator: "\n") + "\n"
    }
    
    //15. 末尾のN行を出力
    //自然数Nをコマンドライン引数などの手段で受け取り，入力のうち末尾のN行だけを表示せよ．確認にはtailコマンドを用いよ．
    static func tail(input: String, rowNumber: Int) -> String {
        let rows = input.components(separatedBy: CharacterSet.newlines).dropLast()
        guard rows.count >= rowNumber else { return "" }
        return rows.suffix(rowNumber).joined(separator: "\n") + "\n"
    }
    
    //16. ファイルをN分割する
    //自然数Nをコマンドライン引数などの手段で受け取り，入力のファイルを行単位でN分割せよ．同様の処理をsplitコマンドで実現せよ．
    static func split(input: String, chunkSize: Int) -> [String] {
        let rows = input.components(separatedBy: CharacterSet.newlines).dropLast()
        let splited = stride(from: 0, to: rows.count, by: chunkSize).map { (v) in
            return rows[v..<min(v + chunkSize, rows.count)].joined(separator: "\n") + "\n"
        }
        return splited
    }
    



    
}
