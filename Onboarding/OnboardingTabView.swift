//
//  OnboardingTabView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/08.
//

import SwiftUI

struct OnboardingTabView: View {
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        TabView {
            // 페이지 1: 앱 소개
            OnboardingPageView(
                imageName: "p1",
                title: "금연이",
                subtitle: "금연이는 여러분의 폐 속에 자리 잡고 있는 금연이를 물리쳐 줄 친구입니다"
            )
            // 페이지 2: 앱 특징 1
            OnboardingPageView(
                imageName: "p2",
                title: "흡연이",
                subtitle: "흡연이는 여러분의 폐 속에서 흡연을 유도하는 괴물입니다"
            )
            
            
            // 페이지 3: 앱 특징 1
            OnboardingPageView(
                imageName: "p3",
                title: "총 91장의 이미지를 모으세요",
                subtitle: "(설정 -> 갤러리)금연중일시 금연이와 흡연이의 다양한 이미지가 앱을 재시작 할 때마다 랜덤하게 나타납니다"
            )
            
            // 페이지 4: 앱 특징 2
            OnboardingPageView(
                imageName: "p4",
                title: "금연 중 나의 변화를 한 눈에",
                subtitle: "(설정 -> 흡연량)흡연량을 설정하여 금연하며 얻는 것을 지켜보세요"
            )
            
            // 마지막 페이지:
            OnboardingLastPageView(
                imageName: "eyes",
                title: "자 이제 시작이에요",
                subtitle: "금연이와 함께 흡연이를 무찔러봐요",
                isFirstLaunching: $isFirstLaunching
            )
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
