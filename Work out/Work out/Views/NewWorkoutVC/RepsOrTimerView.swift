//
//  RepsOrTimerView.swift
//  Work out
//
//  Created by Демьян Горчаков on 01.06.2023.
//

import UIKit

class RepsOrTimerView: UIView {
    private let setLabel: UILabel = {
       let label = UILabel()
        label.text = "Sets"
        label.tintColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfSetLabel: UILabel = {
       let label = UILabel()
        label.text = "1"
        label.tintColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setSlider: UISlider = {
       let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.minimumTrackTintColor = .specialGreen
        slider.maximumTrackTintColor = .specialLightBrown
        slider.addTarget(self, action: #selector(setSliderChange), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()

    private let chooseRepeatLabel = UILabel(text: "Choose repeat of timer")
    
    private let repsLabel: UILabel = {
       let label = UILabel()
        label.text = "Reps"
        label.tintColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfRepsLabel: UILabel = {
       let label = UILabel()
        label.text = "1"
        label.tintColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsSlider: UISlider = {
       let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.minimumTrackTintColor = .specialGreen
        slider.maximumTrackTintColor = .specialLightBrown
        slider.addTarget(self, action: #selector(repsSliderChange), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let timerLabel: UILabel = {
       let label = UILabel()
        label.text = "Timer"
        label.tintColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfTimerLabel: UILabel = {
       let label = UILabel()
        label.text = "0 min"
        label.tintColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timerSlider: UISlider = {
       let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 600
        slider.minimumTrackTintColor = .specialGreen
        slider.maximumTrackTintColor = .specialLightBrown
        slider.addTarget(self, action: #selector(timerSliderChange), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    var setsStackView = UIStackView()
    var repsStackView = UIStackView()
    var timerStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func setSliderChange() {
        numberOfSetLabel.text = "\(Int(setSlider.value))"
        timerLabel.alpha = 1
        numberOfTimerLabel.alpha = 1
        timerSlider.alpha = 1
        
        repsLabel.alpha = 1
        numberOfRepsLabel.alpha = 1
        repsSlider.alpha = 1
    }
    
    @objc func repsSliderChange() {
        numberOfRepsLabel.text = "\(Int(repsSlider.value))"
        setNegative(label: timerLabel, numberLabel: numberOfTimerLabel, slider: timerSlider)
        setActive(label: repsLabel, numberLabel: numberOfRepsLabel, slider: repsSlider)
        
    }
    
    @objc func timerSliderChange() {
        var (min, sec) = {(secs: Int) -> (Int, Int) in
            return ((secs % 3600) / 60, (secs % 3600) % 60)}(Int(timerSlider.value))
        numberOfTimerLabel.text = (sec != 0 ? "\(min) min \(sec) sec" : "\(min) min" )
        setNegative(label: repsLabel, numberLabel: numberOfRepsLabel, slider: repsSlider)
        setActive(label: timerLabel, numberLabel: numberOfTimerLabel, slider: timerSlider)
    }
    
    private func setActive(label: UILabel, numberLabel: UILabel, slider: UISlider) {
        label.alpha = 1
        numberLabel.alpha = 1
        slider.alpha = 1
    }
    
    private func setNegative(label: UILabel, numberLabel: UILabel, slider: UISlider) {
        label.alpha = 0.5
        numberLabel.alpha = 0.5
        numberLabel.text = "0"
        slider.alpha = 0.5
        slider.value = 0
    }
    
    private func setupView() {
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(timerStackView)
        addSubview(timerLabel)
        addSubview(numberOfTimerLabel)
        addSubview(setLabel)
        addSubview(numberOfSetLabel)
        addSubview(setSlider)
        addSubview(chooseRepeatLabel)
        addSubview(repsLabel)
        addSubview(numberOfRepsLabel)
        addSubview(repsSlider)
        addSubview(timerLabel)
        addSubview(numberOfTimerLabel)
        addSubview(timerSlider)
        
        setsStackView = UIStackView(arrangesSubviews: [setLabel, numberOfSetLabel],
                                       axis: .horizontal,
                                       spasing: 10)
        addSubview(setsStackView)
        
        repsStackView = UIStackView(arrangesSubviews: [repsLabel, numberOfRepsLabel],
                                    axis: .horizontal,
                                    spasing: 10)
        addSubview(repsStackView)
        
        timerStackView = UIStackView(arrangesSubviews: [timerLabel, numberOfTimerLabel],
                                     axis: .horizontal,
                                     spasing: 10)
        addSubview(timerStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            setSlider.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 10),
            setSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            chooseRepeatLabel.topAnchor.constraint(equalTo: setSlider.bottomAnchor, constant: 15),
            chooseRepeatLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            repsStackView.topAnchor.constraint(equalTo: chooseRepeatLabel.bottomAnchor, constant: 20),
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            repsSlider.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 10),
            repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            timerStackView.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 20),
            timerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            timerSlider.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 10),
            timerSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}
