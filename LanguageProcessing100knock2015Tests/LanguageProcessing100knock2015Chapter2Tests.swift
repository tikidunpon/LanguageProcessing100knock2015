//
//  LanguageProcessing100knock2015Chapter2Tests.swift
//  LanguageProcessing100knock2015Tests
//
//  Created by koichi tanaka on 2017/10/08.
//  Copyright © 2017年 koichi tanaka. All rights reserved.
//

import XCTest
@testable import LanguageProcessing100knock2015

class LanguageProcessing100knock2015Chapter2Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testQ10() {
        XCTAssertEqual(Chapter2.wc(input: inputContents), 25)
    }
    
    func testQ11() {
        XCTAssertEqual(Chapter2.tr(input: inputContents, replacement: " "),
                       getContents(inFileName: "q11_a1"))
    }
    
    // cut -f 1 hightemp.txt > q12_a1.txt
    // cut -f 2 hightemp.txt > q12_a2.txt
    // 上記2ファイルと比較
    func testQ12() {
        let actual1 = Chapter2.cut(input: inputContents, n: 1)
        let actual2 = Chapter2.cut(input: inputContents, n: 2)
        XCTAssertEqual(actual1, getContents(inFileName: "q12_a1"))
        XCTAssertEqual(actual2, getContents(inFileName: "q12_a2"))
    }
    
    /// paste q12_a1.txt q12_a2.txt > q13_a1.txtと比較
    func testQ13() {
        let column1 = Chapter2.cut(input: inputContents, n: 1)
        let column2 = Chapter2.cut(input: inputContents, n: 2)
        XCTAssertEqual(Chapter2.paste(column1: column1, column2: column2),
                       getContents(inFileName: "q13_a1"))
    }
    
    // head -n 1 hightemp.txt > q14_a1.txt
    // head -n 2 hightemp.txt > q14_a2.txt
    // headは末尾に改行を含む為headの戻り値の末尾にも改行を入れて返している
    func testQ14() {
        let actual1 = Chapter2.head(input: inputContents, rowNumber: 1)
        let actual2 = Chapter2.head(input: inputContents, rowNumber: 2)
        
        XCTAssertEqual(actual1, getContents(inFileName: "q14_a1"))
        XCTAssertEqual(actual2, getContents(inFileName: "q14_a2"))
    }
    
    // tail -n 1 hightemp.txt > q15_a1.txt
    // tail -n 2 hightemp.txt > q15_a2.txt
    func testQ15() {
        let actual1 = Chapter2.tail(input: inputContents, rowNumber: 1)
        let actual2 = Chapter2.tail(input: inputContents, rowNumber: 2)
        
        XCTAssertEqual(actual1, getContents(inFileName: "q15_a1"))
        XCTAssertEqual(actual2, getContents(inFileName: "q15_a2"))
    }
    
    // split -l 10 hightemp.txt
    func testQ16() {
        let actual1 = Chapter2.split(input: inputContents, chunkSize: 10)
        XCTAssertEqual(actual1.count, 3)
        XCTAssertEqual(actual1.first!, getContents(inFileName: "q16_a1"))
        XCTAssertEqual(actual1[1], getContents(inFileName: "q16_a2"))
        XCTAssertEqual(actual1[2], getContents(inFileName: "q16_a3"))
    }
    
}

extension LanguageProcessing100knock2015Chapter2Tests {
    
    var inputContents : String {
        return getContents(inFileName: "hightemp")
    }
    
    func getContents(inFileName: String) -> String {
        let path = Bundle(for: type(of: self)).path(forResource: inFileName, ofType: "txt")
        let s = try! String(contentsOfFile: path!)
        return s
    }
}
