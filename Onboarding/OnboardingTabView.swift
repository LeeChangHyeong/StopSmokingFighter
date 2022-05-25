//
//  OnboardingTabView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/08.
//

import SwiftUI

struct OnboardingTabView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var isFirstLaunching: Bool
    var isLaunchingPage: Bool
    
    
    var body: some View {
        TabView {
            // 페이지 1: 앱 소개
            OnboardingPageView(
                imageName: "mainPicture",
                title: "매일매일 건강하게",
                subtitle: "금연이와 함께 흡연이를 무찌르세요!"
            )
            // 페이지 2: 앱 특징 1
            OnboardingPageView(
                imageName: "onBoarding2",
                title: "실시간으로 확인하세요",
                subtitle: "평소 본인의 흡연량을 입력하여\n절약한 돈, 아낀 담배, 얻은 수명을 확인하세요!\n(설정 -> 흡연량)"
            )
            
            
            // 페이지 4: 앱 특징 2
            OnboardingPageView(
                imageName: "onBoarding3",
                title: "이미지를 모아보세요",
                subtitle: "금연 시간을 늘려 코인을 획득하고 갤러리를 완성하세요!\n(설정 -> 갤러리)"
            )
            
            // 마지막 페이지:
            if isLaunchingPage {
                OnboardingLastPageView(
                    imageName: "p9",
                    title: "자 이제 시작이에요",
                    subtitle: "당신의 금연을 응원합니다!",
                    isFirstLaunching: $isFirstLaunching
                )
            } else {
                OnboardingPageView2(
                    imageName: "p9",
                    title: "자 이제 시작이에요",
                    subtitle: "당신의 금연을 응원합니다!"
                )
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
        .onDisappear(perform: {
            dismiss()
        })
    }
}
