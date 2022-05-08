//
//  ReasonView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/07.
//

import SwiftUI

struct ReasonView: View {
    @ObservedObject var timerManager: TimerManager
    @State var percent: Double = 0
    //20분
    @State var total: Double = 1200
    //12시간
    @State var total2: Double = 43200
    //1일
    @State var total3: Double = 86400
    //2일
    @State var total4: Double = 172800
    //3일
    @State var total5: Double = 259200
    //1달
    @State var total6: Double = 2592000
    //1년
    @State var total7: Double = 31536000
    //5년
    @State var total8: Double = 157680000
    //20년
    @State var total9: Double = 630720000
    
    
    
    var body: some View {
        GeometryReader{ geometry in
            
            ScrollView{
                VStack{
                    
                    Group{
                        Group{
                            Text("혈압이 정상으로 돌아옵니다. (20분)")
                            if (percent/total)*100 > 100{
                                Text("성공 !!")
                                
                                
                            }
                            else if (percent/total)*100 < 100{
                                Text("\(String(format:"%.03lf",((percent/total)*100)))%")
                                
                                
                            }
                            
                            ProgressView( value: percent, total: 1200)
                                .padding(.horizontal)
                                .progressViewStyle(honeyBeeProgressViewStyle(value: $percent, total: $total))
                        }
                        Divider()
                        Group{
                            Text("혈액 내 일산화탄소 수준이 정상화됩니다. (12시간)")
                            if (percent/total2)*100 > 100{
                                Text("성공 !!")
                                
                                
                            }
                            else if (percent/total2)*100 < 100{
                                Text("\(String(format:"%.03lf",((percent/total2)*100)))%")
                                
                                
                            }
                            ProgressView(value: percent, total: 43200)
                                .padding(.horizontal)
                                .progressViewStyle(honeyBeeProgressViewStyle(value: $percent, total: $total2))
                        }
                        Divider()
                        Group{
                            Text("심장 마비의 발병 위험이 감소합니다. (1일)")
                            if (percent/total3)*100 > 100{
                                Text("성공 !!")
                                
                                
                            }
                            else if (percent/total3)*100 < 100{
                                Text("\(String(format:"%.03lf",((percent/total3)*100)))%")
                                
                                
                            }
                            
                            
                            ProgressView(value: percent, total: 86400)
                                .padding()
                                .progressViewStyle(honeyBeeProgressViewStyle(value: $percent, total: $total3))
                        }
                        Divider()
                        Group{
                            Text("더 선명한 맛을 느낄 수 있습니다. (2일)")
                            if (percent/total4)*100 > 100{
                                Text("성공 !!")
                                
                                
                            }
                            else if (percent/total4)*100 < 100{
                                Text("\(String(format:"%.03lf",((percent/total4)*100)))%")
                                
                                
                            }
                            ProgressView(value:  percent, total: 172800)
                                .padding()
                                .progressViewStyle(honeyBeeProgressViewStyle(value: $percent, total: $total4))
                            
                        }
                        Divider()
                        Group{
                            Text("신체의 니코틴 수치가 감소하기 시작합니다.(3일)")
                            if (percent/total5)*100 > 100{
                                Text("성공 !!")
                                
                                
                            }
                            else if (percent/total5)*100 < 100{
                                Text("\(String(format:"%.03lf",((percent/total5)*100)))%")
                                
                                
                            }
                            ProgressView( value: percent, total: 259200)
                                .padding()
                                .progressViewStyle(honeyBeeProgressViewStyle(value: $percent, total: $total5))
                        }
                    }
                    Divider()
                    Group{
                        Text("폐 기능이 향상 됩니다. (1달)")
                        if (percent/total6)*100 > 100{
                            Text("성공 !!")
                            
                            
                        }
                        else if (percent/total6)*100 < 100{
                            Text("\(String(format:"%.03lf",((percent/total6)*100)))%")
                            
                            
                        }
                        
                        ProgressView( value: percent, total: 2592000)
                            .padding()
                            .progressViewStyle(honeyBeeProgressViewStyle(value: $percent, total: $total6))
                        
                    }
                    Divider()
                    Group{
                        Text("심장마비로 인한 사망 위험이 절반으로 줄어듭니다. (1년)")
                        if (percent/total7)*100 > 100{
                            Text("성공 !!")
                            
                            
                        }
                        else if (percent/total7)*100 < 100{
                            Text("\(String(format:"%.03lf",((percent/total7)*100)))%")
                            
                            
                        }
                        ProgressView(value: percent, total: 31536000 )
                            .padding()
                            .progressViewStyle(honeyBeeProgressViewStyle(value: $percent, total: $total7))
                    }
                    Divider()
                    Group{
                        Text("심혈관질환의 위험이 감소합니다. (5년)")
                        if (percent/total8)*100 > 100{
                            Text("성공 !!")
                            
                            
                        }
                        else if (percent/total8)*100 < 100{
                            Text("\((percent/total8)*100)%")
                            
                            
                        }
                        
                        ProgressView( value: percent, total: 157680000)
                            .padding()
                            .progressViewStyle(honeyBeeProgressViewStyle(value: $percent, total: $total8))
                    }
                    Divider()
                    Group{
                        Text("암을 포함한 각종 질환의 위험성이 감소합니다.(20년)")
                        if (percent/total9)*100 > 100{
                            
                            
                            
                        }
                        else if (percent/total9)*100 < 100{
                            Text("\((percent/total9)*100)%")
                            
                            
                            
                            
                        }
                        ProgressView(value: percent, total: 630720000)
                            .padding()
                            .progressViewStyle(honeyBeeProgressViewStyle(value: $percent, total: $total9))
                        
                    }
                    
                    //                    if (percent/total9)*100 > 100{
                    //                        Text("성공 !!")
                    //                            .padding(.bottom,30)
                    //                            .opacity(0)
                    //                    }
                    //                    else if (percent/total9)*100 < 100{
                    //                        Text("\((percent/total9)*100)%")
                    //                            .padding(.top,10)
                    //                            .padding(.bottom,30)
                    //                            .opacity(0)
                    //                    }
                    
                    
                    
                }
                
                // of가 바뀌면 {}실행
                .onChange(of: timerManager.secondsElapsed) { _ in
                    percent += 1
                }
                .onAppear{
                    percent = 0
                    percent += Double(timerManager.secondsElapsed)
                    //            }.navigationBarTitleDisplayMode(.inline)
                }.navigationBarTitleDisplayMode(.inline)
                    .frame(minHeight: geometry.size.height + 400)
                    .frame(width: geometry.size.width)
                
            }
            
            
            
            
            
        }
    }
}

