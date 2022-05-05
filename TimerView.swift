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
    var days: Int { timerManager.secondsElapsed / (3600 * 24)}
    var hours: Int { timerManager.secondsElapsed / 3600 % 24 }
    var minutes: Int { timerManager.secondsElapsed / 60 % 60 }
    var seconds: Int { timerManager.secondsElapsed % 60 }
    
    var imageName: String { if (timerManager.secondsElapsed) % 2 == 1 { return "bandage.fill" } else { return "bed.double.circle" } }
    
    @AppStorage("Touch") var touch: Bool = false
    @State var showingAlert = false
    
    var body: some View {
//        if Int(timerManager.secondsElapsed) % 2 == 1 {
//            self.imageName =
//        } else {
//            self.imageName =
//        }
        
        return VStack {
            Image(systemName: imageName)
                .font(.largeTitle)
            
            Text(String(format:"%02i일 %02i시간 %02i분 %02i초", days, hours, minutes, seconds))
                .padding(.vertical)
            
            if touch == false {
                Button {
                    self.timerManager.start()
                    touch = true
                } label: {
                    Text("흡연이 무찌르기 시작 !!")
                        .foregroundColor(.black)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 90)
                        .background(.yellow)
                        .cornerRadius(20)
                }
            } else {
                Button("포기하기..") {
                    self.showingAlert.toggle()
                }
                .foregroundColor(.black)
                .padding(.vertical, 20)
                .padding(.horizontal, 90)
                .background(.yellow)
                .cornerRadius(20)
                .alert(["다시 한 번 생각해보세요..", "금연이 칼로 찌르기", "금연이 딱대", "금연이 태우기"].randomElement()!, isPresented: $showingAlert) {
                    Button(role: .destructive) {
                        self.timerManager.stop()
                        touch = false
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
}




struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
