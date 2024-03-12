//
//  StopWatch.swift
//  Progress-Bar-Timer-SwiftUI
//
//  Created by sparkout on 12/03/24.
//

import SwiftUI

class StopWatch: ObservableObject {
    
    @Published private(set) var counter: Int
    var progress: CGFloat { CGFloat(self.counter) / CGFloat(self.countMax) }
    private(set) var countMax: Int
    private var timer = Timer()
    private let isIncrement: Bool
    
    init(countMax: Int, isIncrement: Bool = true) {
        self.countMax = countMax
        self.isIncrement = isIncrement
        self.counter = isIncrement ? 0 : countMax
    }
    
    func start() {
        self.stop()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.isIncrement {
                self.counter += 1
                if self.counter == self.countMax {
                    self.stop()
                }
            } else {
                self.counter -= 1
                if self.counter == 0 {
                    self.stop()
                }
            }
        }
    }
    
    func stop() {
        self.timer.invalidate()
    }
    
    func reset() {
        self.counter = 0
        self.stop()
    }
}

extension Int {
    var minutes: String { String(format: "%02d", self / 60) }
    var seconds : String { String(format: "%02d", self % 60) }
    var formatedMinutes : String { minutes + " : " + seconds }
}
