//
//  ViewExtensions.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 01/01/2022.
//

import SwiftUI
import AppResources

extension View {
    
    public func fullWidth(with height: CGFloat) -> some View {
        self.frame(height: height ,alignment: .center )
    }
    
}

struct MyChannelIDTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 30, weight: .bold, design: .default))
        .foregroundColor(returnPerfect(color: "idTextColor"))
    }
    internal func returnPerfect(color: String) -> Color {
        guard let uiColor = UIColor(named: color) else {
            return .white
        }
        return Color(uiColor)
    }
}

struct MyChannelNameTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 30, weight: .bold, design: .default))
        .foregroundColor(returnPerfect(color: "titleColor"))
    }
    internal func returnPerfect(color: String) -> Color {
        guard let uiColor = UIColor(named: color) else {
            return .gray
        }
        return Color(uiColor)
    }
}

struct MyChannelCircleModifier: ViewModifier {
    
    @State var backgroundColor: String
    
    func body(content: Content) -> some View {
        content.frame(width: 70)
        .foregroundColor(returnPerfect(color: backgroundColor))
    }
    internal func returnPerfect(color: String) -> Color {
        guard let uiColor = UIColor(named: color) else {
            return .green
        }
        return Color(uiColor)
    }
}

struct MyChannelBackgroundFrame: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(width: 350, height: 200, alignment: .center)
    }
}
