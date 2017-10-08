//
//  Questions.swift
//  LanguageProcessing100knock2015
//
//  Created by koichi tanaka on 2017/10/02.
//  Copyright © 2017年 koichi tanaka. All rights reserved.
//

import Foundation

struct Chapter1 {
    
    // 00. 文字列の逆順
    // 文字列"stressed"の文字を逆に（末尾から先頭に向かって）並べた文字列を得よ．
    static func q0(input: String) -> String {
        return String(input.reversed())
    }
    
    
    // 01. 「パタトクカシーー」
    // 「パタトクカシーー」という文字列の1,3,5,7文字目を取り出して連結した文字列を得よ．
    static func q1(input: String) -> String {
        return String(input.enumerated().filter{ $0.offset % 2 == 1 }.map{ $0.element })
    }
    
    // 02. 「パトカー」＋「タクシー」＝「パタトクカシーー」
    // 「パトカー」＋「タクシー」の文字を先頭から交互に連結して文字列「パタトクカシーー」を得よ．
    static func q2(input1: String, input2: String) -> String {
        return zip(input1, input2).map{ String([$0, $1]) }.reduce("", +)
    }
    
    // 03. 円周率
    // "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."という文を単語に分解し，
    // 各単語の（アルファベットの）文字数を先頭から出現順に並べたリストを作成せよ．
    static func q3(input: String) -> [Int] {
        return input.components(separatedBy: " ").map{ $0.trimmingCharacters(in: CharacterSet(charactersIn: ",.")).count }
    }
    
    // 04. 元素記号
    // "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."
    // という文を単語に分解し，1, 5, 6, 7, 8, 9, 15, 16, 19番目の単語は先頭の1文字，それ以外の単語は先頭に2文字を取り出し，
    // 取り出した文字列から単語の位置（先頭から何番目の単語か）への連想配列（辞書型もしくはマップ型）を作成せよ．
    static func q4(input: String, condition: [Int]) -> [String : Int] {
        return Dictionary(uniqueKeysWithValues:
            input.trimmingCharacters(in: CharacterSet(charactersIn: ",."))
                .components(separatedBy: " ")
                .enumerated()
                .map{ (i, v) in
                    if condition.contains(i + 1) {
                        return (String(v.first!), i + 1)
                    } else {
                        return (String(v.prefix(2)), i + 1)
                    }
        })
    }
    
    // 05. n-gram
    // 与えられたシーケンス（文字列やリストなど）からn-gramを作る関数を作成せよ．この関数を用い，"I am an NLPer"という文から単語bi-gram，文字bi-gramを得よ．
    // 単語bi-gram
    static func q5_1(input: String, n: Int) -> [String] {
        return wordNgram(input: input, n: n)
    }
    
    // 文字bi-gram
    static func q5_2(input: String, n: Int) -> [String] {
        return charNgram(input: input, n: n)
    }
    
    //06. 集合
    //"paraparaparadise"と"paragraph"に含まれる文字bi-gramの集合を，それぞれ, XとYとして求め，XとYの和集合，積集合，差集合を求めよ．
    //さらに，'se'というbi-gramがXおよびYに含まれるかどうかを調べよ．
    static func q6_1_union(input1: String, input2: String) -> Set<String> {
        let x = Set(charNgram(input: input1, n: 2))
        let y = Set(charNgram(input: input2, n: 2))
        print("x.union(y) = \(x.union(y))")
        print("x.intersection(y) = \(x.intersection(y))")
        print("x.subtract(y) = \(x.subtracting(y))")
        x.contains("se") ? print("x contains se") : print("x does not contains x")
        y.contains("se") ? print("y contains se") : print("y does not contains x")
        
        return x.union(y)
    }
    
    //07. テンプレートによる文生成
    //引数x, y, zを受け取り「x時のyはz」という文字列を返す関数を実装せよ．さらに，x=12, y="気温", z=22.4として，実行結果を確認せよ．
    static func q7(x: Int, y: String, z: Float) -> String {
        return "\(x)時の\(y)は\(z)"
    }
    
    //    08. 暗号文
    //    与えられた文字列の各文字を，以下の仕様で変換する関数cipherを実装せよ．
    //
    //    英小文字ならば(219 - 文字コード)の文字に置換
    //    その他の文字はそのまま出力
    //    この関数を用い，英語のメッセージを暗号化・復号化せよ．
    static func q8(input: String) -> String {
        return chiper(input: input)
    }


    //    09. Typoglycemia
    //    スペースで区切られた単語列に対して，各単語の先頭と末尾の文字は残し，それ以外の文字の順序をランダムに並び替えるプログラムを作成せよ．ただし，長さが４以下の単語は並び替えないこととする．適当な英語の文（例えば"I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."）を与え，その実行結果を確認せよ．
    static func q9(_ input: String) -> String {
        let words = input.components(separatedBy: " ")
        let mapped = words.map { (word) -> String in
            guard word.count > 4 else { return word }
            var dropped = Array(String(word.dropFirst().dropLast()))
            dropped.forEach({_ in
                let ran = arc4random_uniform(UInt32(dropped.count - 1))
                dropped.swapAt(dropped.count - 1, Int(ran))
            })
            dropped.insert(contentsOf: String(word.first!), at: 0)
            dropped.append(contentsOf: String(word.last!))
            return String(dropped)
        }
        
        return mapped.joined(separator: " ")
    }
}

extension Chapter1 {
    static func wordNgram(input: String, n: Int) -> [String] {
        let words = input.components(separatedBy: " ").map{ $0.trimmingCharacters(in: CharacterSet(charactersIn: ",.")) }
        return words.enumerated().flatMap{ (i, v) in
            if words.indices.contains(i + n - 1) {
                return words[i..<i+n].reduce("", +)
            } else {
                return nil
            }
        }
    }
    
    static func charNgram(input: String, n: Int) -> [String] {
        let words = input.components(separatedBy: " ")
            .map{ $0.trimmingCharacters(in: CharacterSet(charactersIn: ",.")) }
            .joined().characters.map{ String($0) }
        return words.enumerated().flatMap{ (i, v) in
            if words.indices.contains(i + n - 1) {
                return words[i..<i+n].reduce("", +)
            } else {
                return nil
            }
        }
    }
    
    static func chiper(input: String) -> String {
        let asciiLowercaseSet = Set("abcdefghijklmnopqrstuvwxyz".map{ String($0) })
        return input.map{ (c) in
            if asciiLowercaseSet.contains(String(c)) {
                return String(Character(Unicode.Scalar(219 - c.unicodeScalars.first!.value)!))
            } else {
                return String(c)
            }
            }.joined(separator: "")
    }
}














