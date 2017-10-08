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
    
    let fileName = "hightemp"
    
    let q11AnswerFileName = "q11_answer"
    
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
                       getContents(inFileName: q11AnswerFileName))
    }
    
}

extension LanguageProcessing100knock2015Chapter2Tests {
    
    var inputContents : String {
        return getContents(inFileName: fileName)
    }
    
    func getContents(inFileName: String) -> String {
        let path = Bundle(for: type(of: self)).path(forResource: inFileName, ofType: "txt")
        let s = try! String(contentsOfFile: path!)
        return s
    }
}
