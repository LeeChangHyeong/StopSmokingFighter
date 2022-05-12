//
//  TipPage.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/08.
//

import SwiftUI

struct TipPage: View {
    var body: some View {
        
        VStack{
        Text("1. 금연 결심했다고 즉시 주위 사람들에게 알리기\n2. 흡연 습관을 대체 할 수 있는 재밌는 취미 찾기\n3. 담배는 일시에 끊기 !! 줄인다는 말 금지 !\n4. 물 자주 마시기(금단증상 완화, 니코틴 배설 촉진 효과)\n5. 흡연 욕구가 생길 때 마다 금연을 다짐 했던 날 돌이켜보기(금연이 생각하기^_^)\n6. 내가 흡연한 직후 만나는 상대방 입장에서 생각해보기\n7. 금연 성공 후 같이 기뻐해 줄 사람들 생각하기\n8. 담배가 있는 자리는 최대한 피하기")
        }.navigationBarTitle(Text("금연 꿀팁"), displayMode: .inline)
    }
}

struct TipPage_Previews: PreviewProvider {
    static var previews: some View {
        TipPage()
    }
}
