//
//  CatchViewModelTests.swift
//  
//  Created on 7/31/20.
//  Copyright © 2020 WildAid. All rights reserved.
//

import XCTest
@testable import O_FISH

class CatchViewModelTests: XCTestCase {
    
    var sut: CatchViewModel?
    
    override func setUpWithError() throws {
        sut = CatchViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testIsEmptyTrue() {
        let isEmpty = sut?.isEmpty ?? false
        XCTAssertTrue(isEmpty)
    }
    
    func testIsEmptyFalse() {
        //given
        let fish = "fish"
        let number = 10
        let weight = 25.0
        let unit: CatchViewModel.UnitSpecification = .kilograms
        let quantityType: [CatchViewModel.QuantityType] = [.count]
        
        //when
        sut?.fish = fish
        sut?.number = number
        sut?.weight = weight
        sut?.unit = unit
        sut?.quantityType = quantityType
        let isEmpty = sut?.isEmpty ?? true
        
        //then
        XCTAssertFalse(isEmpty)
    }
    
    func testQuantityTypeString() {
        //given
        let quantityType: [CatchViewModel.QuantityType] = [.count, .weight]
        sut?.quantityType = quantityType
        
        //when
        let string = sut?.quantityTypeString
        
        //then
        XCTAssertEqual(string, "\(CatchViewModel.QuantityType.count.rawValue) & \(CatchViewModel.QuantityType.weight.rawValue)")
    }
    
    func testWeightStringNotEmpty() {
        let weight = 25.0
        sut?.weight = weight
        
        let weightString = sut?.weightString
        
        XCTAssertEqual(weightString, "\(weight)")
    }
    
    func testWeightStringIsEmpty() {
        let weight = 0.0
        sut?.weight = weight
        
        let weightString = sut?.weightString
        
        XCTAssertEqual(weightString, "")
    }
    
    
    func testSaveCatchNotNill() {
        //given
        let fish = "fish"
        let number = 10
        let weight = 25.0
        let unit: CatchViewModel.UnitSpecification = .pound
        let quantityType: [CatchViewModel.QuantityType] = [.count, .weight]
        
        //when
        sut?.fish = fish
        sut?.number = number
        sut?.weight = weight
        sut?.unit = unit
        sut?.quantityType = quantityType
        let catchFish = sut?.save()

        //then
        XCTAssertEqual(catchFish?.fish, fish)
        XCTAssertEqual(catchFish?.number, number)
        XCTAssertEqual(catchFish?.weight, weight)
        XCTAssertEqual(catchFish?.unit, unit.rawValue)
    }

    func testSaveVesselNil() {
        //given
        let catchFish: Catch? = nil
        sut = CatchViewModel(catchFish)

        //when
        let fish = sut?.save()

        //then
        XCTAssertNotNil(fish)
    }
    
    func testInitWithCatch() {
        //given
        let fish = "fish"
        let number = 10
        let weight = 25.0
        let unit: CatchViewModel.UnitSpecification = .pound
        let catchFish = Catch()
        catchFish.fish = fish
        catchFish.number = number
        catchFish.weight = weight
        catchFish.unit = unit.rawValue
        
        //when
        sut = CatchViewModel(catchFish)
        
        //then
        XCTAssertNotNil(sut)
    }
}
