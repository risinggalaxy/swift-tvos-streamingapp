//
//  MockPlayerModulePresenter.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 03/01/2022.
//

import Foundation
@testable import iTV_Plus

class MockPlayerModulePresenter: PlayerPresenterInterface {
    
    var viewModel: PlayerViewModel?
    var interactor: PlayerInteractor?
    var wireFrame: PlayerWireFrame?
    
}
