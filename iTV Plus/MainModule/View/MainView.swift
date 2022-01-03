//
//  MainView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import SwiftUI
import AppResources
import AVKit

struct MainView: View, MainViewInterface {
    
    var presenter: MainPresenterInterface?
    @StateObject var mainViewModel: MainViewModel
    @State var cellIsFocused: Bool = false
    
    var body: some View {
        ZStack {
            AngularGradient(colors: [.blue, .orange, .purple, .green], center: .bottomTrailing, startAngle: .zero, endAngle: .degrees(360))
                .ignoresSafeArea()
            if !mainViewModel.categories.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(mainViewModel.categories, id: \.self) { category in
                            Button {
                                presenter?.presentCategory(with: category)
                            } label: {
                                CategoryCellDesign(category: category)
                                    .background(.thickMaterial)
                            }
                            .buttonStyle(CardButtonStyle())
                            .contextMenu {
                                ForEach(category.channels) { channel in
                                    Button(action: {
                                        presenter?.presentPlayerView(with:channel)
                                    }, label: {
                                        Text(channel.title)
                                    })
                                }
                            }
                        }
                    }.fullWidth(with: 500)
                }
            } else {
                Text(mainViewModel.errorMessage)
                    .font(.system(size: 25, weight: .bold, design: .default))
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(mainViewModel: MainViewModel())
            .preferredColorScheme(.light)
    }
}
