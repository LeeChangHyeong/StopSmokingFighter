//
//  FontSemiBold.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/11.
//
import SwiftUI

struct Fail: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var timerManager: TimerManager
    @Binding var cigCount: Double?
    @Binding var cigPrice: Double?
    @Binding var showingAlert: Bool
    @Binding var touch: Bool
    @Binding var lose: Int
    @AppStorage("lastTime") var lastTime: Int?
    
    
    
    var body: some View {
        VStack{
           
            Text("최대 금연 시간")
                .scaledFontBold(size: 17)
                
            Text("\((lastTime ?? 0) / (3600 * 24))일 \((lastTime ?? 0) / 3600 % 24)시간 \((lastTime ?? 0) / 60 % 60)분 \((lastTime ?? 0) % 60)초")
                .scaledFont(size: 17)
                .padding(.top, 1)
            
                
            
            Text("금연 실패 횟수")
                .padding(.top, 22)
                .scaledFontBold(size: 17)
            
            Text("\(lose)")
                
                .scaledFont(size: 17)
                .padding(.top, 1)
            
            if touch {
            Button{
                self.showingAlert.toggle()
            } label: {
                Text("포기하기")
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 90)
                    .background(Color.buttonColor)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .scaledFontBold(size: 18)
            }
            .alert("다시 한 번 생각해보세요", isPresented: $showingAlert) {
                Button(role: .destructive) {
                    if (lastTime ?? 0) < timerManager.secondsElapsed{
                    lastTime = timerManager.secondsElapsed
                    }
                    self.timerManager.stop()
                    touch = false
                    lose += 1
                    
                    
                } label: {
                    Text("금연 포기하기")
                }
                
                Button(role: .cancel) {
                    
                } label: {
                    Text("취소")
                }
            }
            }
            
        }
        .padding(.bottom, 100)
        .onDisappear(perform: {
            dismiss()
        })
    }
}

