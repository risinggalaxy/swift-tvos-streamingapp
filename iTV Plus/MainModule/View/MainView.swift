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
    
    var body: some View {
        ZStack {
            VStack {
                Image("appLogo", bundle: nil)
                    .padding(100)
                    .scaleEffect(0.8)
                    .opacity(0.5)
                if !mainViewModel.categories.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(mainViewModel.categories, id: \.self) { category in
                                Button {
                                    presenter?.presentCategory(with: category)
                                } label: {
                                    CategoryCellDesign(category: category)
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
                        }
                        .fullWidth(with: 500)
                    }
                } else {
                    if mainViewModel.errorMessage.isEmpty {
                        Spacer()
                        Text("Loading...")
                            .font(.system(size: 25, weight: .bold, design: .default))
                    } else {
                        Spacer()
                        Text(mainViewModel.errorMessage)
                            .font(.system(size: 25, weight: .bold, design: .default))
                    }
                }
                Spacer()
                CopyRightView()
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(mainViewModel: MainViewModel())
            .preferredColorScheme(.dark)
    }
}
