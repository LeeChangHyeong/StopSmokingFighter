//
//  Timer.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/05.
//
import Foundation
import SwiftUI

struct TimerView: View {
    // 변경값을 관찰하기 위해 ObservaleObject 추가
   
    @ObservedObject var timerManager = TimerManager()
    var days: Int { Int(timerManager.secondsElapsed) / (3600 * 24)}
    var hours: Int { Int(timerManager.secondsElapsed) / 3600 % 24 }
    var minutes: Int { Int(timerManager.secondsElapsed) / 60 % 60 }
    var seconds: Int { Int(timerManager.secondsElapsed) % 60 }
    
    var body: some View {
        VStack{
            Text(String(format:"%02i일 %02i시간 %02i분 %02i초", days, hours, minutes, seconds))
                .padding(.vertical)
            
            
            if timerManager.mode == .stopped{
                Button(action: {self.timerManager.start()}){
                    Text("금연 시작 !!")
                        .foregroundColor(.black)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 90)
                        .background(.yellow)
                        .cornerRadius(20)
                }
            }
            
            if timerManager.mode == .running {
                Button(action: {self.timerManager.start()}){
                    Text("포기하기..")
                        .foregroundColor(.black)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 90)
                        .background(.yellow)
                        .cornerRadius(20)
                }
                
            }
            

        }
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
