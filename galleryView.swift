//
//  galleryView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/18.
//

import SwiftUI

struct galleryView: View {
    var pictures: [String] = ["mainPicture","p6","p1","p2","p3","p4","p5"]
    @Binding var collectedImages: [String]
    
    let rows: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())

    ]
    
    //    @Binding var pictureName: String
    var body: some View {
        ScrollView(){
            LazyVGrid(columns: rows, alignment: .center) {
                ForEach(pictures, id: \.self) { pictureName in
                if collectedImages.contains(pictureName) {
                    Image(pictureName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .overlay(Rectangle().foregroundColor(.gray).opacity(0.2))
                    
                } else {
                    Image(pictureName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .blur(radius: 8)
                        .overlay(Rectangle().foregroundColor(.gray).opacity(0.2))

                    
                }
            }
            
        }
        }.padding(.horizontal)
    }
    
}
