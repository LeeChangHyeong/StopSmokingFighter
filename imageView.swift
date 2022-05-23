//
//  imageView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/23.
//

import SwiftUI

struct imageView: View {
    var image:String
    var body: some View {
        VStack(alignment: .center){
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth:.infinity ,maxHeight: .infinity)
            .padding(.bottom,  100)
        }
    }
}

//struct imageView_Previews: PreviewProvider {
//    static var previews: some View {
//        imageView()
//    }
//}
