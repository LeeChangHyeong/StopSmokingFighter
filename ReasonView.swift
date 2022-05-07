//
//  ReasonView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/07.
//

import SwiftUI

struct ReasonView: View {
    @ObservedObject var timerManager = TimerManager()
    @State var percent: CGFloat = 0

    var body: some View {
        VStack{
        
            ProgressView("혈압이 정상으로 돌아옵니다.", value: percent, total: 100)
            Text("혈압이 정상으로 돌아옵니다.")
            Text("혈액 내 일산화탄소 수준이 정상화됩니다.")
            Text("심장 마비의 발병 위험이 감소합니다.")
            Text("더 선명한 맛을 느낄 수 있습니다.")
            Text("신체의 니코틴 수치가 감소하기 시작합니다.")
            Text("폐 기능이 향상 됩니다.")
            Text("심장마비로 인한 사망 위험이 절반으로 줄어듭니다.")
            Text("심혈관질환의 위험이 감소합니다.")
            Text("폐 질환과 암을 포함한 각종 질환의 위험성이 감소합니다.")
                 
        }
    }
}

