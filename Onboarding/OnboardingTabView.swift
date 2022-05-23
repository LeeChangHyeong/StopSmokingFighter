//
//  OnboardingTabView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/08.
//

import SwiftUI

struct OnboardingTabView: View {
    @Binding var isFirstLaunching: Bool
    var isLaunchingPage: Bool
    
    var body: some View {
        TabView {
            // 페이지 1: 앱 소개
            OnboardingPageView(
                imageName: "mainPicture",
                title: "매일매일 건강하게",
                subtitle: "흡연이를 무찌르게 금연이를 도와주고 건강을 회복하세요"
            )
            // 페이지 2: 앱 특징 1
            OnboardingPageView(
                imageName: "test2",
                title: "절약한 돈, 아낀 담배, 얻은 수명을 실시간으로",
                subtitle: "(설정 -> 흡연량)흡연량을 설정하여 금연하며 얻는 것을 지켜보세요"
            )
            
            
            // 페이지 4: 앱 특징 2
            OnboardingPageView(
                imageName: "p3",
                title: "총 46장의 이미지를 모으세요",
                subtitle: "(설정 -> 갤러리)금연중일시 금연이와 흡연이의 다양한 이미지가 앱을 재시작 할 때마다 랜덤하게 나타납니다"
            )
            
            // 마지막 페이지:
            if isLaunchingPage {
                OnboardingLastPageView(
                    imageName: "p10",
                    title: "자 이제 시작이에요",
                    subtitle: "금연이와 함께 흡연이를 무찔러봐요",
                    isFirstLaunching: $isFirstLaunching
                )
            } else {
                OnboardingPageView2(
                    imageName: "p1",
                    title: "자 이제 시작이에요",
                    subtitle: "금연이와 함께 흡연이를 무찔러봐요"
                )
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
