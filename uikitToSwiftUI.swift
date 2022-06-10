//
//  uikitToSwiftUI.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/06/10.
//
//
//  BannerAd.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/05/16.
//

import Foundation
import SwiftUI

final class BannerAd: UIViewControllerRepresentable {
    let adUnitId: String
    
    init(adUnitId: String) {
        self.adUnitId = adUnitId
    }
    
    
    func makeUIViewController(context: Context) -> BannerAdVC {
        return BannerAdVC(adUnitId: adUnitId)
    }

    func updateUIViewController(_ uiViewController: BannerAdVC, context: Context) {
        
    }
}
