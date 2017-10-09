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
    static func wc(input: String) -> Int {
        let result = input.components(separatedBy: CharacterSet.newlines)
        return result.isEmpty ? result.count - 1 : result.count
    }
    
    // 11. タブをスペースに置換
    // タブ1文字につきスペース1文字に置換せよ．確認にはsedコマンド，trコマンド，もしくはexpandコマンドを用いよ．
    static func tr(input: String, replacement: String) -> String {
        return input.replacingOccurrences(of: "\t", with: replacement, options: .regularExpression, range: nil)
    }
    
    //12. 1列目をcol1.txtに，2列目をcol2.txtに保存
    //各行の1列目だけを抜き出したものをcol1.txtに，2列目だけを抜き出したものをcol2.txtとしてファイルに保存せよ．確認にはcutコマンドを用いよ．
    static func cut(input: String, n: Int) -> String {
        let rows = input.components(separatedBy: CharacterSet.newlines)
        
        let column = rows.map {
            return !$0.isEmpty ? $0.components(separatedBy: CharacterSet.whitespaces)[n - 1] : $0
        }
        return column.joined(separator: "\n")
    }
    
    // 13. col1.txtとcol2.txtをマージ
    // 12で作ったcol1.txtとcol2.txtを結合し，元のファイルの1列目と2列目をタブ区切りで並べたテキストファイルを作成せよ．確認にはpasteコマンドを用いよ．
    static func paste(column1: String, column2: String) -> String {
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
    
    //17. １列目の文字列の異なり
    //1列目の文字列の種類（異なる文字列の集合）を求めよ．確認にはsort, uniqコマンドを用いよ．
    static func sortedUniq(input: String) -> String {
        let column1 = Chapter2.cut(input: input, n: 1)
        let sorted = Array(Set(column1.components(separatedBy: CharacterSet.newlines)))
            .sorted(by: <).filter{ !$0.isEmpty }
        return sorted.joined(separator: "\n" ) + "\n"
    }

    //18. 各行を3コラム目の数値の降順にソート
    //各行を3コラム目の数値の逆順で整列せよ（注意: 各行の内容は変更せずに並び替えよ）．確認にはsortコマンドを用いよ（この問題はコマンドで実行した時の結果と合わなくてもよい）．
    static func sortedDesc(input: String) -> [String] {
        let rows = input.components(separatedBy: CharacterSet.newlines).dropLast()
        let sorted = rows.sorted { (row1, row2) -> Bool in
            let elements1 = row1.components(separatedBy: CharacterSet.whitespaces)
            let elements2 = row2.components(separatedBy: CharacterSet.whitespaces)
            return elements1[2] > elements2[2]
        }
        return sorted
    }
    
    //19. 各行の1コラム目の文字列の出現頻度を求め，出現頻度の高い順に並べる
    //各行の1列目の文字列の出現頻度を求め，その高い順に並べて表示せよ．確認にはcut, uniq, sortコマンドを用いよ．
    static func sortedFrequencyDesc(input: String) -> [(String, Int)] {
        let column1 = Chapter2.cut(input: input, n: 1).components(separatedBy: CharacterSet.newlines)
        let countedSet = NSCountedSet(array: column1)
        let sortedTupleArray = Dictionary(uniqueKeysWithValues:
            countedSet.map { (o) -> (String, Int) in
                let s = o as! String
                return (s, countedSet.count(for: s))
        }).sorted(by: {$0.1 > $1.1 })
        return sortedTupleArray.filter{ !$0.key.isEmpty }
    }
    
}
