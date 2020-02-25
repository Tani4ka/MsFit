//
//  Constants.swift
//  Ms Fit
//
//  Created by Yura Granchenko on 18.02.2020.
//  Copyright © 2020 Selecto. All rights reserved.
//

import UIKit
import Foundation

//height controls
let keyWindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive})
    .map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
let navigationBarHeight = 44 + (keyWindow?.safeAreaInsets.bottom ?? 0)
let tabBarHeight = 44 + (keyWindow?.safeAreaInsets.bottom ?? 0)

struct Constants {
    static let baseURL = Environment.isProduction ? "http://nps-api-proxy.onespace.prod/api/v1/mobile/news" :
        Environment.isDevelop ? "https://nps.simcord.info/api/v1/mobile/news" :
    "http://nps-api-proxy.onespace.stg/api/v1/mobile/news"
    static let splashTimeAnimation = 3000
    static let groupId = ""
    static let sWidth = UIScreen.main.bounds.width
    static let sHeight = UIScreen.main.bounds.height
    static let sHeightMore812 = UIScreen.main.bounds.height >= 812
    static let sHeightMore667 = UIScreen.main.bounds.height >= 667
}
