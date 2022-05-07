//
//  TimerView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/05.
//

import SwiftUI

// 변경값을 관찰하기 위해 ObservaleObject 추가
class TimerManager: ObservableObject {

    enum TimerMode {
        case running
        case stopped
        case paused
    }
    @Published var mode: TimerMode = .stopped

    @Published var secondsElapsed = 0

    var timer = Timer()

    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
            self.secondsElapsed += 1
        }


    }


    func stop(){
        timer.invalidate()
        secondsElapsed = 0
        mode = .stopped
    }
}


