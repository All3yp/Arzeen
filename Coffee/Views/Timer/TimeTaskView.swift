//
//  TimeTaskView.swift
//  Coffee
//
//  Created by Alley Pereira on 30/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation
import UIKit

class TimeTaskView: UIView {

    let previousButton: UIButton = {
        let button = UIButton()
        button.setTitle("<<", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var playPauseButton: UIButton = {
        let button = UIButton()
        button.setTitle(self.statusButton.name, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        button.backgroundColor = self.statusButton.color
        button.layer.cornerRadius = 40
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(">>", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var title: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        return label
    }()

    var descriptionTask: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22, weight: .light)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description"
        return label
    }()

    var timerView: TimerView = {
        let view = TimerView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    let dataArray = [Array(0...23), Array(0...59)]
    let names = ["hour", "min", "sec"]
    var statusButton: StatusTimer = .start
    var timeSelected: [Int] = [0, 0, 10]
    weak var delegate: TimeDelegate?

    var seconds: Int = Int() {
        didSet {
            self.timerView.timeLabel.text = self.timeString(time: TimeInterval(self.seconds))

            if seconds == 0 {
                self.statusButton = .start
                self.configureManageButton()

                self.timerView.isHidden = true
                self.delegate?.cancel()
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureLayout()
        self.timerView.resume()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        self.addSubview(previousButton)
        self.addSubview(playPauseButton)
        self.addSubview(nextButton)
        self.addSubview(title)
        self.addSubview(descriptionTask)
        self.addSubview(timerView)
    }

    private func configureLayout() {

        self.backgroundColor = .systemBackground

        NSLayoutConstraint.activate([
            timerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 112),
            timerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            timerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            timerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            timerView.heightAnchor.constraint(equalToConstant: 300),

            previousButton.leftAnchor.constraint(equalTo: timerView.leftAnchor, constant: 20),
            previousButton.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 25),
            previousButton.heightAnchor.constraint(equalToConstant: 60),
            previousButton.widthAnchor.constraint(equalToConstant: 60),
            
            playPauseButton.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 5),
            playPauseButton.centerXAnchor.constraint(equalTo: timerView.centerXAnchor),
            playPauseButton.widthAnchor.constraint(equalToConstant: 80),
            playPauseButton.heightAnchor.constraint(equalToConstant: 80),
            
            nextButton.rightAnchor.constraint(equalTo: timerView.rightAnchor, constant: -20),
            nextButton.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 25),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            nextButton.widthAnchor.constraint(equalToConstant: 60),

            title.topAnchor.constraint(equalTo: playPauseButton.bottomAnchor, constant: 24),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            descriptionTask.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            descriptionTask.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        previousButton.addTarget(self, action: #selector(previousButtonDown), for: .touchDown)
        previousButton.addTarget(self, action: #selector(previousButtonUp), for: .touchUpInside)
        
        nextButton.addTarget(self, action: #selector(nextButtonDown), for: .touchDown)
        nextButton.addTarget(self, action: #selector(nextButtonUp), for: .touchUpInside)

        playPauseButton.addTarget(self, action: #selector(playPauseButtonDown), for: .touchDown)
        playPauseButton.addTarget(self, action: #selector(playPauseButtonUp), for: .touchUpInside)
    }

    private func configureManageButton() {
        self.playPauseButton.setTitle(self.statusButton.name, for: .normal)
        self.playPauseButton.backgroundColor = self.statusButton.color
    }

    private func nextStep() {
        switch self.statusButton {
        case .start:
            let timeInseconds = self.timeSelected[0] * 3600 + self.timeSelected[1] * 60 + self.timeSelected[2]
            if timeInseconds != 0 {
                self.delegate?.start(with: timeInseconds)
                self.statusButton = .pause

                self.timerView.isHidden = false
                self.setAnimation()
            }
        case .pause:
            self.timerView.pause()
            self.statusButton = .resume
            self.delegate?.pause()
        case .resume:
            self.delegate?.resume()
            self.statusButton = .pause
            self.timerView.resume()
        }
    }

    private func timeString(time: TimeInterval) -> String {
        let seconds = Int(time) % 60
        let minutes = Int(time)/60 % 60
        let hours = Int(time)/3600 % 3600

        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }

    func setAnimation() {
        timerView.setAnimation(with: animatingCircle(fromValue: 0, toValue: 1, duration: TimeInterval(self.seconds)))
    }

    func animatingCircle (fromValue: Float, toValue: Float, duration: CFTimeInterval) -> CABasicAnimation {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.fromValue = fromValue
        basicAnimation.toValue = toValue
        basicAnimation.duration = duration
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        return basicAnimation
    }

    func configureLabels(with text: String, with description: String) {
        self.title.text = text
        self.descriptionTask.text = description
    }

    @objc func previousButtonDown() {
        previousButton.backgroundColor = .gray
    }

    @objc func previousButtonUp() {
        previousButton.backgroundColor = .systemGray

        print("<< volta para passo anterior da receita")
    }
    
    @objc func nextButtonDown() {
        nextButton.backgroundColor = .gray
    }
    
    @objc func nextButtonUp() {
        nextButton.backgroundColor = .systemGray
        
        print(">> vai para o próximo passo da receita")
    }

    @objc func playPauseButtonDown() {
        let color = self.statusButton.tappedColor
        playPauseButton.backgroundColor = color
    }

    @objc func playPauseButtonUp() {
        nextStep()
        configureManageButton()
    }
}
