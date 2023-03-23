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
    
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()

    var body: some View {
        
        NavigationView{
            
            VStack(spacing: 0) {

                ImageSliderView(

                    viewModel.sliderList
                    
                ).frame(height: screenHeight / 4)
                    .onTapGesture {
                       
                        let image = viewModel.sliderList[currentSliderIndex]
                        
                        if image.clickable == true && image.targetUrl.isEmpty == false {
                            
                            UIApplication.shared.open(
                                URL(string: image.targetUrl)!
                            )
                            
                        }

                    }
                    .padding([.leading, .trailing], 7)
                    .padding(.top, 10)
                
                Text("Space")
                    .padding(.top, 15)
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black)
                
                ScrollView {
                    
                    Text("   We often refer to our expanding universe with one simple word: space. But where does space begin and, more importantly, what is it?")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing, .top], 10)
                    
                    Text("Space is an almost perfect vacuum, nearly void of matter and with extremely low pressure. In space, sound doesn't carry because there aren't molecules close enough together to transmit sound between them. Not quite empty, bits of gas, dust and other matter floats around 'emptier' areas of the universe, while more crowded regions can host planets, stars and galaxies.")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing, .top], 10)

                    Text("From our Earth-bound perspective, outer space is most often thought to begin about 62 miles (100 kilometers) above sea level at what is known as the Kármán line. This is an imaginary boundary at an altitude where there is no appreciable air to breathe or scatter light. Passing this altitude, blue starts to give way to black because oxygen molecules are not in enough abundance to make the sky blue.")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing, .top], 10)
                    
                }.ignoresSafeArea()

            }
            .background(.gray.opacity(0.1))
                .onReceive(NotificationCenter.default.publisher(for: NSNotification.SliderIndex))
            { obj in
                
                if let targetURL = obj.userInfo, let info = targetURL["info"] {
                    currentSliderIndex = info as! Int
                    
                }

            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
            ToolbarItem(placement: .principal) {

                HStack {
                    Text("Home")
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                        .foregroundColor(Color.white)
                }
            }
        }
            
        }
            .navigationViewStyle(StackNavigationViewStyle()) .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .onAppear {

            UINavigationBarAppearance()
                    .setColor(title: .white, background: .purple)
        }

    }
    
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
