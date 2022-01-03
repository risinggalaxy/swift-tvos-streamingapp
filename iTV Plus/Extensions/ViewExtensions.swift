//
//  ViewExtensions.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 01/01/2022.
//

import SwiftUI

extension View {
    
    public func fullWidth(with height: CGFloat) -> some View {
        self.frame(height: height ,alignment: .center )
    }
    
}

