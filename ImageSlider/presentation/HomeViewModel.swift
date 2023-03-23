//
//  HomeViewModel.swift
//  ImageSlider
//
//  Created by Cuma Haznedar on 22/03/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var sliderList = [SliderListModel]()
    
    init() {
        
        setImageList()
        
    }
    
    func setImageList() {
        
        let imageList : [SliderListModel] = [
            SliderListModel(imageUrl: "https://cdn.pixabay.com/photo/2011/12/14/12/21/orion-nebula-11107_960_720.jpg", clickable: true, targetUrl: "https://www.space.com/nasa-perseverance-rover-mars-predawn-cloud-photos"),
            SliderListModel(imageUrl: "https://cdn.pixabay.com/photo/2012/08/25/22/22/saturn-54999_960_720.jpg", clickable: false, targetUrl: ""),
            SliderListModel(imageUrl: "https://cdn.pixabay.com/photo/2016/05/01/21/20/earth-1365995_960_720.jpg", clickable: true, targetUrl: "https://www.space.com/relativity-space-terran-1-test-launch-failure"),
            SliderListModel(imageUrl: "https://cdn.pixabay.com/photo/2020/06/19/22/33/wormhole-5319067_960_720.jpg", clickable: false, targetUrl: ""),
            SliderListModel(imageUrl: "https://cdn.pixabay.com/photo/2023/03/17/09/25/space-7858232_960_720.jpg", clickable: true, targetUrl: "https://www.space.com/mysterious-radio-signal-intricate-core-galaxy-cluster"),
        ]
        
        for index in imageList {

            let newImage = SliderListModel(imageUrl: index.imageUrl, clickable: index.clickable, targetUrl: index.targetUrl)
            self.sliderList.append(newImage)
            
        }
        
    }
    
    
}
