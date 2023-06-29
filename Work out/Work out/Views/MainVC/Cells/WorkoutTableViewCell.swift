//
//  WorkoutTableViewCell.swift
//  Work out
//
//  Created by Демьян Горчаков on 13.05.2023.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {
    
    let images = ["1","2","3","4"]
    
    private let backGroundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .specialBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "10")
        imageView.backgroundColor = .specialBrown
        imageView.contentMode = .scaleAspectFit
        imageView.layer.opacity = 0.8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pull Ups"
        label.textColor = .specialBlack
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsLabel: UILabel = {
        let reps = UILabel()
        reps.text = "Reps: 1000000000"
        reps.textColor = .specialBlack
        reps.font = .systemFont(ofSize: 15)
        reps.translatesAutoresizingMaskIntoConstraints = false
        return reps
    }()
    
    private let setsLabel: UILabel = {
        let sets = UILabel()
        sets.text = "Sets: 5"
        sets.textColor = .specialBlack
        sets.font = .systemFont(ofSize: 15)
        sets.translatesAutoresizingMaskIntoConstraints = false
        return sets
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.setTitle("Старт", for: .normal)
        button.tintColor = .specialBlack
        button.addShadowView()
        button.addTarget(self, action: #selector(startButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var labelStatickView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(backGroundCell)
        addSubview(cellImageView)
        addSubview(titleLabel)
        addSubview(repsLabel)
        addSubview(setsLabel)
        labelStatickView = UIStackView(arrangesSubviews: [repsLabel, setsLabel],
                                                   axis: .horizontal,
                                                spasing: 10)
        addSubview(labelStatickView)
        contentView.addSubview(startButton)
    }
    
    @objc private func startButtonTap() {
//        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backGroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backGroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backGroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backGroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            cellImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellImageView.heightAnchor.constraint(equalToConstant: 90),
            cellImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 15),
        ])
        NSLayoutConstraint.activate([
            labelStatickView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            labelStatickView.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 15),
            labelStatickView.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: setsLabel.bottomAnchor, constant: 7),
            startButton.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant:30),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
