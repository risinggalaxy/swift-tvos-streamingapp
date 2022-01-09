//
//  MainViewModelTest.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import XCTest
import Combine
@testable import iTV_Plus

class MainViewModelTest: XCTestCase {
    
    var sut: MainViewModel!
    var mockView: MockView!
    
    override func setUp() {
        super.setUp()
        sut = MainViewModel()
        mockView = MockView(viewModel: MainViewModel())
    }
    
    override func tearDown() {
        sut = nil
        mockView = nil
        super.tearDown()
    }
    
    
    func testMainViewModel_WhenReceivingCategories_ShouldSendUpdateToView() {
    }
   
    
}
