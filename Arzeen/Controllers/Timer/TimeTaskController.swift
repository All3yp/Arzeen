//
//  TimeTaskController.swift
//  Arzeen
//
//  Created by Alley Pereira on 30/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation
import UIKit

class TimeTaskViewController: UIViewController {

    var titleTask: String = String()
    var descriptionTask: String = String()

    let inicialTime = 0
    var timer: Timer = Timer()
    var isTimerRunning = false
    lazy var timerTaskView:TimeTaskView = {
        let timerTask = TimeTaskView()
        timerTask.drink = drink
        return timerTask
    }()
    var drink: Drink?

    var seconds: Int = Int() {
        didSet {
            self.timerTaskView.seconds = self.seconds
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        seconds = self.inicialTime

        self.timerTaskView.delegate = self
        self.view = timerTaskView

    }

    func playTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    func pauseTimer() {
        timer.invalidate()
        isTimerRunning = false
    }

    func cancelTimer() {
        timer.invalidate()
        isTimerRunning = false
    }

    @objc func updateTimer() {
        seconds -= 1
    }

    private func configurateNavigation() {
        self.title = "Time Task"
        navigationItem.largeTitleDisplayMode = .never
    }
}

extension TimeTaskViewController: TimeDelegate {
    func start(with time: Int) {
        if !isTimerRunning {
            self.seconds = time
            self.playTimer()
            self.isTimerRunning = true
        }
    }

    func pause() {
        self.pauseTimer()
    }

    func resume() {
        if !isTimerRunning {
            self.playTimer()
            isTimerRunning = true
        }
    }

    func cancel() {
        self.cancelTimer()
    }
}
