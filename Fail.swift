//
//  FontSemiBold.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/11.
//
import SwiftUI

struct Fail: View {
    @ObservedObject var timerManager: TimerManager
   

    @Binding var lose: Int
    @Binding var touch: Bool
    @Binding var showingAlert: Bool
    
    
    var body: some View {
        VStack{
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
                self.timerManager.stop()
                touch = false
                lose += 1
                
            } label: {
                Text("금연이 죽이기")
            }
            
            Button(role: .cancel) {
                
            } label: {
                Text("금연이 살리기")
            }
        }
        }
    }
}
