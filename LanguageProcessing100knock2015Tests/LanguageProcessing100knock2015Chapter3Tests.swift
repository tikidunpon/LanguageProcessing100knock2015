//
//  LanguageProcessing100knock2015Chapter3Tests.swift
//  LanguageProcessing100knock2015Tests
//
//  Created by koichi tanaka on 2017/10/10.
//  Copyright © 2017年 koichi tanaka. All rights reserved.
//

import XCTest
@testable import LanguageProcessing100knock2015

class LanguageProcessing100knock2015Chapter3Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testQ20() {
        let wiki = Chapter3.q20(input: inputContents)
        XCTAssertTrue(wiki.title == "イギリス")
        XCTAssertTrue(!wiki.text.isEmpty)
    }
    
    func testQ21() {
        let actual = Chapter3.q21(input: inputContents)
        XCTAssertTrue(actual.first!.contains("Category"))
        XCTAssertTrue(actual.last!.contains("Category"))
    }
    
    func testQ22() {
        let actual = Chapter3.q22(input: inputContents)
        let expected = Set(["イギリス", "*", "英連邦王国",
                        "G8加盟国", "欧州連合加盟国", "海洋国家",
                        "君主国", "島国", "くれいとふりてん",
                        "1801年に設立された州・地域"])
        XCTAssertEqual(actual, expected)
    }
    
    func testQ23() {
        let actual = Chapter3.q23(input: inputContents)
        let expected =
        """
        国名, 5
        歴史, 5
        地理, 5
        気候, 7
        政治, 5
        外交と軍事, 8
        地方行政区分, 9
        主要都市, 9
        科学技術, 7
        経済, 5
        鉱業, 7
        農業, 7
        貿易, 7
        通貨, 7
        企業, 7
        交通, 5
        道路, 7
        鉄道, 7
        海運, 7
        航空, 7
        通信, 5
        国民, 5
        言語, 7
        宗教, 7
        婚姻, 9
        教育, 7
        文化, 5
        食文化, 8
        文学, 7
        哲学, 9
        音楽, 7
        イギリスのポピュラー音楽, 19
        映画, 7
        コメディ, 9
        国花, 7
        世界遺産, 9
        祝祭日, 8
        スポーツ, 7
        サッカー, 9
        競馬, 7
        モータースポーツ, 13
        脚注, 5
        関連項目, 7
        外部リンク, 8
        """
        XCTAssertEqual(actual, expected)
    }
    
    func testQ24() {
        let actual = Chapter3.q24(input: inputContents)
        XCTAssertEqual(actual, getContents(inFileName: "q24_a1", ofType: "txt"))
    }
}

extension LanguageProcessing100knock2015Chapter3Tests {
    
    var inputContents : String {
        return getContents(inFileName: "jawiki-country", ofType: "json")
    }
    
    func getContents(inFileName: String, ofType: String) -> String {
        let path = Bundle(for: type(of: self)).path(forResource: inFileName, ofType: ofType)
        let s = try! String(contentsOfFile: path!)
        return s
    }
}
