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
    
    func testQ12() {
        let expected1 = """
                        高知県
                        埼玉県
                        岐阜県
                        山形県
                        山梨県
                        和歌山県
                        静岡県
                        山梨県
                        埼玉県
                        群馬県
                        群馬県
                        愛知県
                        千葉県
                        静岡県
                        愛媛県
                        山形県
                        岐阜県
                        群馬県
                        千葉県
                        埼玉県
                        大阪府
                        山梨県
                        山形県
                        愛知県
                        """
        let expected2 = """
                        江川崎
                        熊谷
                        多治見
                        山形
                        甲府
                        かつらぎ
                        天竜
                        勝沼
                        越谷
                        館林
                        上里見
                        愛西
                        牛久
                        佐久間
                        宇和島
                        酒田
                        美濃
                        前橋
                        茂原
                        鳩山
                        豊中
                        大月
                        鶴岡
                        名古屋
                        """
        
        let actual = Chapter2.q12(input: inputContents)
        XCTAssertEqual(actual.0, expected1)
        XCTAssertEqual(actual.1, expected2)
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
