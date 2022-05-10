//
//  Timer.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/05.
//
import Foundation
import SwiftUI
import UIKit

struct TimerView: View {
    // 변경값을 관찰하기 위해 ObservaleObject 추가
    
    
    
    @ObservedObject var timerManager: TimerManager
    var days: Int { timerManager.secondsElapsed / (3600 * 24)}
    var hours: Int { timerManager.secondsElapsed / 3600 % 24 }
    var minutes: Int { timerManager.secondsElapsed / 60 % 60 }
    var seconds: Int { timerManager.secondsElapsed % 60 }
    var totalPrice: Double { (((cigPrice ?? 0) / 20) * (cigCount ?? 0))/86400 * Double((timerManager.secondsElapsed))}
    var numCig: Double {(cigCount ?? 0)/86400 * Double((timerManager.secondsElapsed))}
    @Binding var cigCount: Double?
    @Binding var cigPrice: Double?
    @Binding var lose: Int
    
    
    //    var imageNames: [String] = ["hi","young","soccer","soccer2"]
    /// x 개  1개에 225원 (x X 225) / 86400
    ///  ((cigPrice / 20) * cigCount) / 86400 = 1s 돈
    
    //    var imageName: String { if (timerManager.secondsElapsed) % 2 == 1 { return "bandage.fill" } else { return "bed.double.circle" } }
    
    @AppStorage("savedDate") var date: Date = Date()
    
    
    @Binding var touch: Bool
    @State var showingAlert = false
    @State var showingAlert2 = false
    
    static var imageName = ImagePick()
    
    var body: some View {
        VStack {
            Text("Til now...")
            
            Text(String(format:"%02i일 %02i시간 %02i분 %02i초", days, hours, minutes, seconds))
                .padding(.vertical)
            
            Image(TimerView.imageName.getImage())
                .resizable()
                .scaledToFit()
            
            
            if touch == false {
                Button {
                    self.showingAlert2.toggle()
                } label: {
                    Text("흡연이 무찌르기 시작!!")
                        .foregroundColor(.black)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 90)
                        .background(.yellow)
                        .cornerRadius(20)
                }
                .alert("금연 할 수 있습니다 !!", isPresented: $showingAlert2){
                    // 주요행동
                    Button(role: .destructive) {
                        
                    } label: {
                        Text("금연이 버리기")
                        
                    }
                    
                    Button(role: .cancel){
                        self.timerManager.start()
                        touch = true
                        date = Date()
                        
                    } label: {
                        Text("금연이 돕기")
                    }
                }
                
            } else {
                Button{
                    self.showingAlert.toggle()
                } label: {
                    Text("포기하기..")
                        .foregroundColor(.black)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 90)
                        .background(.yellow)
                        .cornerRadius(20)
                }
                .alert("다시 한 번 생각해보세요..", isPresented: $showingAlert) {
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
            
            
            
            
            VStack(alignment: .leading){
                Text("금연해서 아낀 돈: \(String(format:"%.03lf",((totalPrice))))원")
                Text("지금까지 안핀 담배갯수: \(String(format:"%.03lf",((numCig))))개")
                Text("금연해서 얻은 수명: \(String(format:"%.03lf",((numCig*720/60/60))))시간")
                // 1개에 12분
                //720초
            }
            .foregroundColor(.white)
            .padding()
            .background(.black)
            .cornerRadius(20)
            Text("금연이 사망 횟수: \(lose)회")
                .foregroundColor(.white)
                .padding()
                .background(.red)
                .cornerRadius(20)
            
            
            
            
        }.onAppear{
            // current를 쓰면 calander를 아무곳에서 씀
            if touch {
                if timerManager.secondsElapsed == 0 {
                    self.timerManager.start()
                }
                
                let calender = Calendar.current
                let pastDate = date
                let nowDate = Date()
                // 옵셔널이 되는 경우때문에 0을 기본값으로 둔다.
                let duration = calender.dateComponents([.second], from: pastDate, to: nowDate).second ?? 0
                
                timerManager.secondsElapsed = duration
                
            }
        }
    }
    
}


extension Date: RawRepresentable {
    private static let formatter = ISO8601DateFormatter()
    
    public var rawValue: String {
        Date.formatter.string(from: self)
    }
    
    public init?(rawValue: String) {
        self = Date.formatter.date(from: rawValue) ?? Date()
    }
}


class ImagePick{
    var imageNames: [String] = ["hi","young","soccer","soccer2"]
    var isEntered : Bool = false
    static var imageName : String = ""
    
    func getImage() -> String{
        if !isEntered{
            ImagePick.imageName = imageNames.randomElement() ?? ""
            isEntered.toggle()
        }
        return ImagePick.imageName
    }
}
