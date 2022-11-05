//
//  ImageSlider.swift
//  ImageSlider
//
//  Created by Cuma on 05/11/2022.
//

import SwiftUI

public struct ImageSlider: View {

    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var selection = 0

    let images: [String]

    public init(_ images: [String]) {

        self.images = images

    }

    public var body: some View {

        VStack(spacing: 0) {

            TabView(selection: $selection) {

                ForEach(0..<images.count) { i in

                    AsyncImage(url: URL(string: images[i]), scale: 2) { phase in
                        if let image = phase.image { // 2
                            /// if the image is valid
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        } else if phase.error != nil {
                            /// 3 some kind of error appears
                            
                            Text("404! \n No image available 😢")
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
                .onReceive(timer, perform: { _ in

                withAnimation {
                    selection = selection < images.count - 1 ? selection + 1 : 0

                    NotificationCenter.default.post(name: NSNotification.SliderIndex,
                        object: nil, userInfo: ["info": selection])
                }
            })
        }
    }
}
