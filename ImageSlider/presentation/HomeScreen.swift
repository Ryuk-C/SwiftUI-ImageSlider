//
//  HomeScreen.swift
//  ImageSlider
//
//  Created by Cuma on 05/11/2022.
//

import SwiftUI

struct HomeScreen: View {

    @State private var currentSliderIndex = 0

    @State private var screenWidth: Double = UIScreen.main.bounds.width
    @State private var screenHeight: Double = UIScreen.main.bounds.height

    var body: some View {

        VStack(spacing: 0) {

            ImageSlider(

                [
                    "https://cdn.pixabay.com/photo/2015/10/30/20/13/sunrise-1014712_1280.jpg",
                    "https://cdn.pixabay.com/photo/2015/03/16/10/59/sunset-675847_1280.jpg",
                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                    "https://cdn.pixabay.com/photo/2021/01/09/19/59/mountains-5903352_1280.jpg",
                    "https://cdn.pixabay.com/photo/2017/11/03/18/26/man-2915187_1280.jpg",
                    "https://cdn.pixabay.com/photo/2020/04/19/08/06/old-town-5062333_640.jpg",
                    "https://cdn.pixabay.com/photo/2014/12/16/22/25/woman-570883_1280.jpg"
                ]

            ).frame(height: screenHeight / 4)

            VStack {

                Text("Current Slider Index: ")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 10)

                Text(String(currentSliderIndex)).foregroundColor(.blue)
                    .fontWeight(.bold)
                    .padding(.top, 1)

                Text("How to Build an Image Slider")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)

                Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.")
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)

            }.padding(.leading, 10)
                .padding(.trailing, 10)


            Spacer()

        }
            .edgesIgnoringSafeArea([])
            .onReceive(NotificationCenter.default.publisher(for: NSNotification.SliderIndex))
        { obj in
            // Change key as per your "userInfo"
            if let userInfo = obj.userInfo, let info = userInfo["info"] {
                currentSliderIndex = info as! Int
                print(currentSliderIndex)
            }

        }

    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
