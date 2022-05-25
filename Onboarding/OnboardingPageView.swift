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
        GeometryReader{ geometry in
            
        
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: geometry.size.width - 100, height: geometry.size.height - 400)
                .padding()
                
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.vertical,5)
                .frame(maxWidth:.infinity,alignment: .leading)
            Text(subtitle)
                .font(.body)
                .padding(.horizontal)
                .frame(maxWidth:.infinity,alignment: .leading)
            
            
            HStack {
                Spacer()
                Image(systemName: "arrow.forward.circle")
                    .padding()
                    .font(.largeTitle)
            }
        }
        .position(x:geometry.size.width/2 , y: (geometry.size.height/2)-40)
        }
        
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(
            imageName: "mainPicture",
            title: "금연이",
            subtitle: "금연이는 여러분의 폐 속에 자리 잡고 있는 금연이를 물리쳐 줄 친구입니다"
        )
    }
}
