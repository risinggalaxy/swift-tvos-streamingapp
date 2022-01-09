//
//  MainWireFrameInterface.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import UIKit
import AppResources

typealias VIEW = UIViewController

protocol MainWireFrameInterface {
    static var rootView: VIEW? { get set }
    static func presentViewController(window: UIWindow) -> VIEW
    @discardableResult func presentChannelView(with channel: Channel) -> Bool
    @discardableResult func presentCategory(with category: Categories) -> Bool
}
