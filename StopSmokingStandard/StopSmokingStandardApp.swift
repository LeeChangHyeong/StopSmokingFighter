//
//  StopSmokingStandardApp.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/05.
//

import SwiftUI
import GoogleMobileAds
import AppTrackingTransparency

@main
struct StopSmokingStandardApp: App {
    init () {
        if ATTrackingManager.trackingAuthorizationStatus == .notDetermined {
            //광고 실행 판별 문구
        } else {
            ATTrackingManager.requestTrackingAuthorization{
            status in
                GADMobileAds.sharedInstance().start(completionHandler: nil)
            }
        }
    }
    var body: some Scene {
        WindowGroup {
            LaunchPageView()
        }
    }
    
}
