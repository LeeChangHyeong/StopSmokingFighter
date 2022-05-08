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
                imageName: "person.3.fill",
                title: "금연을 지루하지 않고 즐겁게",
                subtitle: "금연이가 흡연이를 이길때까지 응원하며 지켜봐주세요"
            )
            
            // 페이지 2: 앱 특징 1
            OnboardingPageView(
                imageName: "eyes",
                title: "총 91장의 이미지를 모으세요(설정 -> 갤러리)",
                subtitle: "금연중일시 금연이와 흡연이의 다양한 이미지가 앱을 재시작 할 때마다 랜덤하게 나타납니다"
            )
            
            // 페이지 3: 앱 특징 2
            OnboardingPageView(
                imageName: "eyes",
                title: "금연 중 나의 변화를 한 눈에",
                subtitle: "(설정 -> 흡연량)흡연량을 설정하여 금연하며 얻는 것을 지켜보세요"
            )
            
            // 페이지 4:
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
