//
//  MockMainWireFrame.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
@testable import iTV_Plus

class MockMainWireFrame: MainWireFrameInterface {
    
    
    static func presentViewController() -> VIEW {
        let view = VIEW()
        return view
    }
    
}
