//
//  TipPage.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/08.
//

import SwiftUI

struct TipPage: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        
        VStack{
            Text("금연 꿀팁을 함께 실천해봐요!")
                .padding(.vertical, 17)
                .scaledFontBold(size: 23)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
            HStack{
                Image(systemName: "circle.fill")
                    .foregroundColor(Color.circleColor)
                    .padding(.leading,10)
                    .scaledFont(size: 10)
                Text("금연 결심했다고 즉시 주위 사람들에게 알려보아요")
                    .scaledFont(size: 15)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 7)
            
            HStack{
                Image(systemName: "circle.fill")
                    .foregroundColor(Color.circleColor)
                    .padding(.leading,10)
                    .scaledFont(size: 10)
                Text("흡연 습관을 대체 할 수 있는 재미있는 취미를 찾아봐요")
                    .scaledFont(size: 15)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 7)
            
            HStack{
                Image(systemName: "circle.fill")
                    .foregroundColor(Color.circleColor)
                    .padding(.leading,10)
                    .scaledFont(size: 10)
                Text("담배를 줄인다는 말 대신 지금부터 실천해요")
                    .scaledFont(size: 15)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 7)
            
            HStack{
                Image(systemName: "circle.fill")
                    .foregroundColor(Color.circleColor)
                    .padding(.leading,10)
                    .scaledFont(size: 10)
                Text("물을 자주 마셔요 (금단증상 완화, 니코틴 배설 촉진 효과)")
                    .scaledFont(size: 15)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 7)
            
            HStack{
                Image(systemName: "circle.fill")
                    .foregroundColor(Color.circleColor)
                    .padding(.leading,10)
                    .scaledFont(size: 10)
                Text("흡연 욕구가 생길 때 마다 금연을 다짐 했던 날을 생각해요")
                    .scaledFont(size: 15)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 7)
            
            HStack{
                Image(systemName: "circle.fill")
                    .foregroundColor(Color.circleColor)
                    .padding(.leading,10)
                    .scaledFont(size: 10)
                Text("내가 흡연한 직후 만나는 상대방 입장에서 생각해 보아요")
                    .scaledFont(size: 15)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 7)
            
            HStack{
                Image(systemName: "circle.fill")
                    .foregroundColor(Color.circleColor)
                    .padding(.leading,10)
                    .scaledFont(size: 10)
                Text("금연 성공 후 같이 기뻐해 줄 사람들을 생각해 보아요")
                    .scaledFont(size: 15)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 7)
            
            HStack{
                Image(systemName: "circle.fill")
                    .foregroundColor(Color.circleColor)
                    .padding(.leading,10)
                    .scaledFont(size: 10)
                Text("담배가 있는 자리는 최대한 피해요")
                    .scaledFont(size: 15)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 7)
            
        }
        .onDisappear(perform: {
            dismiss()
        })
        .frame(maxHeight:.infinity)
        .padding(.bottom, 200)

        .navigationBarTitle(Text("금연 꿀팁"), displayMode: .inline)
            
          
    }
}

struct TipPage_Previews: PreviewProvider {
    static var previews: some View {
        TipPage()
    }
}
