//
//  AppDelegate.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupFirstView()
        return true
    }
    
    internal func setupFirstView() {
        let uiWindow = UIWindow(frame: UIScreen.main.coordinateSpace.bounds)
        window = uiWindow
        let view = MainWireFrame.presentViewController(window: uiWindow)
        uiWindow.rootViewController = view
        uiWindow.makeKeyAndVisible()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        NotificationCenter.default.post(name: kRefreshWeatherDataNotificationName,
                                        object: nil)
        NotificationCenter.default.post(name: kRefreshChannelsNotificationName,
                                            object: nil)
    }
    
}
