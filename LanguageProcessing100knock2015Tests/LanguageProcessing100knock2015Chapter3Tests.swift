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
}

extension LanguageProcessing100knock2015Chapter3Tests {
  
  var inputContents : String {
    return getContents(inFileName: "jawiki-country")
  }
  
  func getContents(inFileName: String) -> String {
    let path = Bundle(for: type(of: self)).path(forResource: inFileName, ofType: "json")
    let s = try! String(contentsOfFile: path!)
    return s
  }
}
