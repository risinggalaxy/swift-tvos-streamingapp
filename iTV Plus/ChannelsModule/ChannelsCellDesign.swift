//
//  ChannelsCellDesign.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 03/01/2022.
//

import SwiftUI
import AppResources

struct ChannelsCellDesign: View {
    
    @State var channel: Channel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(UIColor(named: "cellBGColor") ?? .white))
                .modifier(MyChannelBackgroundFrame())
                .overlay(content: {
                    VStack {
                    ZStack {
                    Circle()
                            .modifier(MyChannelCircleModifier(backgroundColor: channel.color))
                        Text("\(channel.id)")
                            .modifier(MyChannelIDTextModifier())
                    }
                        Text(channel.title)
                            .modifier(MyChannelNameTextModifier())
                        Spacer()
                    }
                })
        }
    }
    
    internal func channel(color: String) -> Color {
        guard let uiColor = UIColor(named: color) else {
            return .orange
        }
        return Color(uiColor)
    }
}

struct ChannelsCellDesign_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsCellDesign(channel: Channel(id: 1, title: "Test", color: "Yellow", url: "Test"))
    }
}
