//
//  ImageSliderView.swift
//  ImageSliderView
//
//  Created by Cuma on 05/11/2022.
//

import SwiftUI

public struct ImageSliderView: View {

    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    @State private var tabSelection = 0
    @State private var currentSelection = 0

    let images: [SliderListModel]

    public init(_ images: [SliderListModel]) {

        self.images = images

    }

    public var body: some View {

        VStack(spacing: 0) {

            TabView(selection: $tabSelection) {

                ForEach(0..<images.count, id: \.self) { i in

                    AsyncImage(url: URL(string: images[i].imageUrl), scale: 2) { phase in
                        if let image = phase.image { // 2
                            /// if the image is valid
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        } else if phase.error != nil {
                            /// 3 some kind of error appears
                            
                            Text("404! \n No image available")
                                .bold()
                                .font(.title)
                                .multilineTextAlignment(.center)

                        } else {
                            /// 4 showing progress view as placeholder
                            
                            ProgressView()
                                .font(.largeTitle)
                        }
                    }
                        .scaledToFill()

                }


            }.tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .onChange(of: tabSelection, perform: { index in
                    
                    currentSelection = tabSelection

                    NotificationCenter.default.post(name: NSNotification.SliderIndex,
                        object: nil, userInfo: ["info": currentSelection])
                    
                })
                .onReceive(timer, perform: { _ in
                    
                withAnimation {
                    
                    tabSelection = tabSelection < images.count - 1 ? tabSelection + 1 : 0
                    currentSelection = tabSelection
                    
                    NotificationCenter.default.post(name: NSNotification.SliderIndex,
                        object: nil, userInfo: ["info": currentSelection])
                    
                }
            })
        }
        .modifier(CardModifier())
        
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
    }

}
