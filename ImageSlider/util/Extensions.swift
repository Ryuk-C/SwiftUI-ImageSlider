//
//  Constants.swift
//  ImageSlider
//
//  Created by Cuma on 05/11/2022.
//

import Foundation
import UIKit
import SwiftUI

extension NSNotification {
    static let SliderIndex = Notification.Name.init("SliderIndex")
}

extension UINavigationBarAppearance {

    func setColor(title: UIColor? = nil, background: UIColor? = nil) {
        configureWithTransparentBackground()

        if let titleColor = title {
            largeTitleTextAttributes = [.foregroundColor: titleColor]
            titleTextAttributes = [.foregroundColor: titleColor]
        }
        backgroundColor = background
        UINavigationBar.appearance().scrollEdgeAppearance = self
        UINavigationBar.appearance().standardAppearance = self

    }

}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
