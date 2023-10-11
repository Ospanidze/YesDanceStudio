//
//  TimeCounter.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 11.10.2023.
//

import Foundation

enum Status {
    case start, end
}

final class TimeCounter {
    
    var status: Status = .start {
        didSet {
            if status != .start {
               stopTimer()
            }
        }
    }
    
    private var timer: Timer?
    
    private var updateTime: Int
    private var time: Int {
        didSet {
            if time == 0 {
                status = .end
            }
            
            updateTimer(status, time)
        }
    }
    
    private var updateTimer: ((Status, Int) -> Void)
    
    init(time: Int, updateTimer: @escaping (Status, Int) -> Void) {
        updateTime = time
        self.time = time
        self.updateTimer = updateTimer
        setupTimer()
    }
    
    func refreshTimer() {
        status = .start
        time = updateTime
        setupTimer()
    }
    
    private func setupTimer() {
        updateTimer(status, time)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            self?.time -= 1
        })
    }
    
    private func stopTimer() {
        timer?.invalidate()

    }
    
}
