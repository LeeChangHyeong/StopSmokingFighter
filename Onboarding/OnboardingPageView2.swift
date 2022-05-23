//
//  OnboardingPageView2.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/23.
//

//
//  OnboardingPageView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/08.
//

import SwiftUI

struct OnboardingPageView2: View {
    let imageName: String
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .padding()
                
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text(subtitle)
                .font(.title2)
                .padding(.horizontal)
            

        }
        
    }
}

