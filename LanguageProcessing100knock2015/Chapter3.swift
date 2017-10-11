//
//  Chapter3.swift
//  LanguageProcessing100knock2015
//
//  Created by koichi tanaka on 2017/10/10.
//  Copyright © 2017年 koichi tanaka. All rights reserved.
//

import Foundation

struct WikiItem: Codable {
    let title: String
    let text: String
}

struct Chapter3 {
    //20. JSONデータの読み込み
    //Wikipedia記事のJSONファイルを読み込み，「イギリス」に関する記事本文を表示せよ．問題21-29では，ここで抽出した記事本文に対して実行せよ．
    static func q20(input: String) -> WikiItem {
        let lines = input.components(separatedBy: CharacterSet.newlines).filter{ !$0.isEmpty }
        let decoder = JSONDecoder()
        let ukWiki = lines.map{
            return try! decoder.decode(WikiItem.self, from: $0.data(using: .utf8)!)
            }.filter{ $0.title == "イギリス" }
            .first!
        return ukWiki
    }
    
    //21. カテゴリ名を含む行を抽出
    //記事中でカテゴリ名を宣言している行を抽出せよ．
    static func q21(input: String) -> [String] {
        let ukWiki = q20(input: input)
        let linesHasCategory = ukWiki.text.components(separatedBy: CharacterSet.newlines).filter{ $0.contains("Category") }
        return linesHasCategory
    }
    
    //22. カテゴリ名の抽出
    //記事のカテゴリ名を（行単位ではなく名前で）抽出せよ．
    static func q22(input: String) -> Set<String> {
        let linesHasCategory = q21(input: input)
        let categoryNameMatches = linesHasCategory.map { (line) -> String in
            let regex =
            """
            \\[Category:\
            (\
            .+[^\\]]\
            )\
            \\]
            """
            return line.matches(regex: regex)[1]
        }
        var categoryNames = [String]()
        categoryNameMatches.forEach { (s) in
            if s.contains("|") {
                categoryNames.append(contentsOf: s.components(separatedBy: "|"))
            } else {
                categoryNames.append(s)
            }
        }
        return Set(categoryNames)
    }

}

extension String {
    
    func matches(regex: String!) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let results = regex.matches(in: self,
                                        options: [],
                                        range: NSRange(location: 0, length: self.count))
            var matches = [String]()
            
            for result in results {
                for i in 0..<result.numberOfRanges {
                    let range = Range.init(result.range(at: i), in: self)
                    matches.append(String(self[range!]))
                }
            }
            
            return matches
        } catch let error as NSError {
            assertionFailure("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
