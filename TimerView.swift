//
//  Timer.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/05.
//
import Foundation
import SwiftUI
import UIKit

extension Color {
    static let buttonColor = Color("buttonColor")
    static let infoBackColor = Color("infoBackColor")
    static let intColor = Color("intColor")
    static let tillColor = Color("tillColor")
}

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
    
    @AppStorage("savedDate") var date: Date = Date()
    
    
    @Binding var touch: Bool
    
    @State var showingAlert2 = false
    
    
    static var imageName = ImagePick()
    
    var body: some View {
        VStack {
            Text("Til now...")
                .scaledFont(size: 18)
                .padding(.bottom, 4)
                .foregroundColor(Color.tillColor)
            
            Text(String(format:"%02i시간 %02i분 %02i초", hours, minutes, seconds))
                .padding(.bottom, 20)
                .scaledFontBold(size: 26)
                .foregroundColor(Color.buttonColor)
            
            Image(TimerView.imageName.getImage())
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .background(.gray)
            
            
            
            
            if touch == false {
                Button {
                    self.showingAlert2.toggle()
                } label: {
                    Text("흡연이 무찌르기 !")
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
                        .lineLimit(1)
                    
                    //                        .foregroundColor(.black)
                    //                        .padding(.vertical, 20)
                    //                        .padding(.horizontal, 90)
                    //                        .background(.yellow)
                    //                        .cornerRadius(20)
                }
                .alert("금연 할 수 있습니다 !", isPresented: $showingAlert2){
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
                
                Text(String(format:"D - %02i", days))
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
            //                        Button{
            //                            self.showingAlert.toggle()
            //                        } label: {
            //                            Text("포기하기..")
            //                                .foregroundColor(.white)
            //                                .frame(maxWidth:.infinity)
            //                                .padding(.vertical, 20)
            //                                .padding(.horizontal, 90)
            //                                .background(Color.buttonColor)
            //                                .cornerRadius(10)
            //                                .padding(.horizontal, 30)
            //                                .padding(.top, 20)
            //                                .padding(.bottom, 10)
            //                                .scaledFontBold(size: 18)
            //                        }
            //                        .alert("다시 한 번 생각해보세요..", isPresented: $showingAlert) {
            //                            Button(role: .destructive) {
            //                                self.timerManager.stop()
            //                                touch = false
            //                                lose += 1
            //
            //                            } label: {
            //                                Text("금연이 죽이기")
            //                            }
            //
            //                            Button(role: .cancel) {
            //
            //                            } label: {
            //                                Text("금연이 살리기")
            //                            }
            //                        }
            //
            
            
            
            VStack(alignment: .leading){
                HStack{
                    VStack{
                        Image(systemName: "dollarsign.circle.fill")
                            .padding(.bottom, 8)
                            .font(.system(size: 20))
                        
                        Text("\(String(format:"%.02lf",((totalPrice/10000))))만원")
                            .foregroundColor(Color.intColor)
                            .padding(.bottom, 5)
                            .scaledFont(size: 16)
                        
                        Text("절약한 돈")
                            .foregroundColor(.white)
                            .padding(.horizontal, 27)
                        //                            .background(.black)
                            .scaledFontBold(size: 15)
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .background(Color.infoBackColor)
                    .cornerRadius(20)
                    
                    
                    VStack{
                        Image(systemName: "lungs.fill")
                            .padding(.bottom, 8)
                            .font(.title3)
                        
                        Text("\(String(format:"%.01lf",((numCig))))개")
                            .foregroundColor(Color.intColor)
                            .padding(.bottom, 5)
                            .scaledFont(size: 16)
                        
                        
                        Text("아낀 담배")
                            .foregroundColor(.white)
                            .padding(.horizontal, 27)
                        //                            .background(.black)
                            .scaledFontBold(size: 15)
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .background(Color.infoBackColor)
                    .cornerRadius(20)
                    
                    
                    VStack{
                        Image(systemName: "heart.fill")
                        
                            .padding(.bottom, 8)
                            .font(.title2)
                        
                        Text("\(String(format:"%.01lf",((numCig*720/60/60))))시간")
                            .foregroundColor(Color.intColor)
                            .padding(.bottom, 5)
                            .scaledFont(size: 16)
                        
                        
                        Text("수명 연장")
                            .foregroundColor(.white)
                            .padding(.horizontal, 27)
                        //                            .background(.black)
                            .scaledFontBold(size: 15)
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .background(Color.infoBackColor)
                    .cornerRadius(20)
                    
                    
                    
                }
                .padding(.horizontal, 15)
                // 1개에 12분
                //720초
            }
            
            //            Text("금연이 사망 횟수: \(lose)회")
            //                .foregroundColor(.white)
            //                .padding()
            //                .background(.red)
            //                .cornerRadius(20)
            
            
            
            
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
    var imageNames: [String] = ["hi","young","soccer","soccer2","hey"]
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


