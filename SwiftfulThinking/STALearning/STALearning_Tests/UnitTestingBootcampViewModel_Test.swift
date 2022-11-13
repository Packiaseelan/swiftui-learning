//
//  UnitTestingBootcampViewModel_Test.swift
//  STALearning_Tests
//
//  Created by Packiaseelan S on 15/09/22.
//

// Naming Structure: test_[Struct or Class]_[variable or function]_[expected result]
// Naming Structure: test_[variable or function]_[expected result] // this file has only test cases for one struct or class
// Testing Structure: Given, When, Then

import XCTest
@testable import STALearning
import Combine

final class UnitTestingBootcampViewModel_Test: XCTestCase {
    
    var viewModel: UnitTestingBootcampViewModel?
    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = UnitTestingBootcampViewModel(isPremium: Bool.random())
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    func test_isPremium_shouldBeTrue() {
        // Given
        let isPremium: Bool = true
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: isPremium)
        
        // Then
        XCTAssertTrue(vm.isPremium)
    }
    
    func test_isPremium_shouldBeFalse() {
        // Given
        let isPremium: Bool = false
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: isPremium)
        
        // Then
        XCTAssertFalse(vm.isPremium)
    }
    
    func test_isPremium_shouldBeInjectedValue() {
        // Given
        let isPremium: Bool = Bool.random()
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: isPremium)
        
        // Then
        XCTAssertEqual(vm.isPremium, isPremium)
    }
    
    func test_isPremium_shouldBeInjectedValue_stress() {
        for _ in 0..<10 {
            // Given
            let isPremium: Bool = Bool.random()
            
            // When
            let vm = UnitTestingBootcampViewModel(isPremium: isPremium)
            
            // Then
            XCTAssertEqual(vm.isPremium, isPremium)
        }
    }
    
    func test_dataArray_shouldBeEmpty() {
        // Given
        let isPremium: Bool = Bool.random()
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: isPremium)
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    
    func test_dataArray_shouldAddItems() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        vm.addItem(item: "hello")
        
        // Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 1)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_dataArray_shouldAddItems2() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        vm.addItem(item: "hello")
        
        // Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 1)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_dataArray_shouldNotAddBlankString() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        vm.addItem(item: "")
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    
    func test_selectedItem_shouldBeNil() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)
        
        vm.selectItem(item: UUID().uuidString)
        
        // Then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_selectedItem_shouldBeSelected() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        
        vm.selectItem(item: newItem)
        
        // Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, newItem)
    }
    
    func test_selectedItem_shouldBeSelected_stress() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let loopCount: Int = Int.random(in: 0..<100)
        var itemsArray: [String] = []
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        
        let randomItem = itemsArray.randomElement() ?? ""
        vm.selectItem(item: randomItem)
        
        // Then
        XCTAssertEqual(vm.selectedItem, randomItem)
    }
    
    func test_selectedItem_shouldBeThrowError_dataNotFound() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let loopCount: Int = Int.random(in: 0..<100)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // Then
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
        
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "Should throw item not found error!") { error in
            let returnedError = error as? UnitTestingBootcampViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingBootcampViewModel.DataError.dataNotFound)
        }
    }
    
    func test_selectedItem_shouldBeThrowError_noData() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let loopCount: Int = Int.random(in: 0..<100)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // Then
        do {
            try vm.saveItem(item: "")
        } catch let error {
            let returnedError = error as? UnitTestingBootcampViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingBootcampViewModel.DataError.noData)
        }
    }
    
    func test_selectedItem_shouldSaveItem() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let loopCount: Int = Int.random(in: 0..<100)
        var itemsArray: [String] = []
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        
        let randomItem = itemsArray.randomElement() ?? ""
        vm.selectItem(item: randomItem)
        
        // Then
        XCTAssertNoThrow(try vm.saveItem(item: randomItem))
        
        do {
            try vm.saveItem(item: randomItem)
        } catch {
            XCTFail()
        }
    }
    
    func test_downloadWithEscaping_shouldReturnItems() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let expectation = XCTestExpectation(description: "Should return Items after 3 seconds")
        vm.$dataArray
            .dropFirst()
            .sink { _ in
            expectation.fulfill()
        }
        .store(in: &cancellables)
        vm.downloadWithEscaping()
        
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_downloadWithCombine_shouldReturnItems() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let expectation = XCTestExpectation(description: "Should return Items after a second")
        vm.$dataArray
            .dropFirst()
            .sink { _ in
            expectation.fulfill()
        }
        .store(in: &cancellables)
        vm.downloadWithCombine()
        
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_downloadWithCombine_shouldReturnItems2() {
        // Given
        let items: [String] = [UUID().uuidString, UUID().uuidString, UUID().uuidString, UUID().uuidString, UUID().uuidString]
        let dataService: NewDataServiceProtocol = NewMockDataSerice(items: items)
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random(), dataService: dataService)
        
        // When
        let expectation = XCTestExpectation(description: "Should return Items after a second")
        vm.$dataArray
            .dropFirst()
            .sink { _ in
            expectation.fulfill()
        }
        .store(in: &cancellables)
        vm.downloadWithCombine()
        
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
        XCTAssertEqual(vm.dataArray.count, items.count)
    }
}
