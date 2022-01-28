//
//  MockCLLocationManager.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 28/01/2022.
//

import CoreLocation
@testable import iTV_Plus

//MARK: Implementation
class MockLocationManager: CLLocationManager {
    override var location: CLLocation? {
        return CLLocation(latitude: 52.486984, longitude: 4.657447)
    }
}
