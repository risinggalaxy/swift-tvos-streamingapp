//
//  AppDelegate.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupFirstView()
        return true
    }
    
    
    internal func setupFirstView() {
        let uiWindow = UIWindow(frame: UIScreen.main.coordinateSpace.bounds)
        window = uiWindow
        uiWindow.rootViewController = UIHostingController(rootView: ContentView())
        uiWindow.makeKeyAndVisible()
    }
    
}
