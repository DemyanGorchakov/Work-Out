//
//  CalendarCollectionViewCell.swift
//  Work out
//
//  Created by Демьян Горчаков on 11.05.2023.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    private let dayOfweeklabel: UILabel = {
        let label = UILabel()
        label.text = "We"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfDaylabel: UILabel = {
        let label = UILabel()
        label.text = "29"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialYellow
                layer.cornerRadius = 10
                dayOfweeklabel.textColor = .specialBlack
                numberOfDaylabel.textColor = .specialDarkGreen
            } else {
                backgroundColor = .specialGreen
                dayOfweeklabel.textColor = .white
                numberOfDaylabel.textColor = .white
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(dayOfweeklabel)
        addSubview(numberOfDaylabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dayOfweeklabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dayOfweeklabel.topAnchor.constraint(equalTo: topAnchor, constant: 7)
        ])
        NSLayoutConstraint.activate([
            numberOfDaylabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberOfDaylabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
