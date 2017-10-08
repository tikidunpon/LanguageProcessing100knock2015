//
//  LanguageProcessing100knock2015Tests.swift
//  LanguageProcessing100knock2015Tests
//
//  Created by koichi tanaka on 2017/10/02.
//  Copyright © 2017年 koichi tanaka. All rights reserved.
//

import XCTest
@testable import LanguageProcessing100knock2015

class LanguageProcessing100knock2015Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testQ0() {
        XCTAssertEqual(Chapter1.q0(input: "stressed"), "desserts")
        XCTAssertEqual(Chapter1.q0(input: "abc"), "cba")
    }
    
    func testQ1() {
        XCTAssertEqual(Chapter1.q1(input: "パタトクカシーー"), "タクシー")
        XCTAssertEqual(Chapter1.q1(input: "タパクトシカーー"), "パトカー")
    }
    
    func testQ2() {
        XCTAssertEqual(Chapter1.q2(input1: "パトカー", input2: "タクシー"), "パタトクカシーー")
        XCTAssertEqual(Chapter1.q2(input1: "タクシー", input2: "パトカー"), "タパクトシカーー")
    }
    
    func testQ3() {
        let actual = Chapter1.q3(input: "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics.")
        let expected = [3,1,4,1,5,9,2,6,5,3,5,8,9,7,9]
        XCTAssertEqual(actual, expected)
    }
    
    func testQ4() {
        let actual = Chapter1.q4(input: "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can.", condition: [1, 5, 6, 7, 8, 9, 15, 16, 19])
        
        let expected = ["H": 1, "Ne": 10, "Be": 4, "Al": 13, "B": 5, "O": 8, "Li": 3, "F": 9, "He": 2, "S": 16, "Cl": 17, "K": 19, "Ar": 18, "C": 6, "N": 7, "Mi": 12, "Si": 14, "Ca": 20, "P": 15, "Na": 11]
        XCTAssertEqual(actual, expected)
    }
    
    func testQ5_1() {
        let actual1 = Chapter1.q5_1(input: "I am an NLPer", n: 2)
        let expected1 = ["Iam", "aman", "anNLPer"]
        XCTAssertEqual(actual1, expected1)

        let actual2 = Chapter1.q5_1(input: "I am a Swifter", n: 2)
        let expected2 = ["Iam", "ama", "aSwifter"]
        XCTAssertEqual(actual2, expected2)
        
        let actual3 = Chapter1.q5_1(input: "This is a pen, Thease are erasers.", n: 2)
        let expected3 = ["Thisis", "isa", "apen", "penThease", "Theaseare", "areerasers"]
        XCTAssertEqual(actual3, expected3)
        
        let actual4 = Chapter1.q5_1(input: "I am a Swifter", n: 3)
        let expected4 = ["Iama", "amaSwifter"]
        XCTAssertEqual(actual4, expected4)
        
        let actual5 = Chapter1.q5_1(input: "This is a pen, Thease are erasers.", n: 4)
        let expected5 = ["Thisisapen", "isapenThease", "apenTheaseare", "penTheaseareerasers"]
        XCTAssertEqual(actual5, expected5)
    }
    
    func testQ5_2() {
        let actual1 = Chapter1.q5_2(input: "I am an NLPer", n: 2)
        let expected1 = ["Ia", "am", "ma", "an", "nN", "NL", "LP", "Pe", "er"]
        XCTAssertEqual(actual1, expected1)
    }
    
    func testQ6_1_union() {
        let actual1 = Chapter1.q6_1_union(input1: "paraparaparadise", input2: "paragraph")
        let expected1: Set = ["pa", "se", "ad", "ap", "ra", "gr", "ag", "ph", "ar", "di", "is"]
        XCTAssertEqual(actual1, expected1)
    }
    
    func testQ7() {
        XCTAssertEqual(Chapter1.q7(x: 12, y: "気温", z: 22.4), "12時の気温は22.4")
    }
    
    func testQ8() {
        XCTAssertEqual(Chapter1.q8(input: "Koichi Tanaka"), "Klrxsr Tzmzpz")
        XCTAssertEqual(Chapter1.q8(input: "abあ"), "zyあ")
    }
    
    func testQ9() {
        let inputLong = "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."
        let resultLong = Chapter1.q9(inputLong)
        print("Q9. resultLong: \(resultLong)")
        XCTAssertNotEqual(resultLong, inputLong)
        XCTAssertTrue(resultLong.hasPrefix("I "))
        XCTAssertTrue(resultLong.hasSuffix(" ."))
    }
    
}
