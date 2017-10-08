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
        XCTAssertEqual(Chapter2.q10(input: inputContents), 25)
    }
    
    func testQ11() {
        XCTAssertEqual(Chapter2.q11(input: inputContents),
                       getContents(inFileName: "q11_a1"))
    }
    
    // cut -f 1 hightemp.txt > q12_a1.txt
    // cut -f 2 hightemp.txt > q12_a2.txt
    // 上記2ファイルと比較
    func testQ12() {
        let actual1 = Chapter2.q12(input: inputContents, column: 1)
        let actual2 = Chapter2.q12(input: inputContents, column: 2)
        XCTAssertEqual(actual1, getContents(inFileName: "q12_a1"))
        XCTAssertEqual(actual2, getContents(inFileName: "q12_a2"))
    }
    
    /// paste q12_a1.txt q12_a2.txt > q13_a1.txtと比較
    func testQ13() {
        let column1 = Chapter2.q12(input: inputContents, column: 1)
        let column2 = Chapter2.q12(input: inputContents, column: 2)
        XCTAssertEqual(Chapter2.q13(column1: column1, column2: column2),
                       getContents(inFileName: "q13_a1"))
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
