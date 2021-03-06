//
//  MainViewModelInterface.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import SwiftUI
import AppResources

protocol MainViewModelInterface {
    
    var categories: [ITVCategory] { get set }
    var viewTitle: String? { get set }
    
}
