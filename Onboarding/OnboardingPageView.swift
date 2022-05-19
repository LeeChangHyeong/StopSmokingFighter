//
//  OnboardingPageView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/08.
//

import SwiftUI

struct OnboardingPageView: View {
    let imageName: String
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .font(.system(size: 100))
                .padding()
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text(subtitle)
                .font(.title2)
        }
        
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(
            imageName: "p1",
            title: "금연이",
            subtitle: "금연이는 여러분의 폐 속에 자리 잡고 있는 금연이를 물리쳐 줄 친구입니다"
        )
    }
}
