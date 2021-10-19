//
//  ThirdViewController.swift
//  GlobalVariableDemo
//
//  Created by Su T. Nguyen on 15/09/2021.
//

import UIKit

final class ThirdViewController: UIViewController, GlobalUpdating {

    @Global var userSettings: UserSettings
    @Global var appSettings: AppSettings

    private let firstLabel = UILabel()
    private let secondLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()

        registerForUpdates()
    }

    func update() {
        print("Updating for ThirdViewController")
        firstLabel.text = userSettings.desciption
        secondLabel.text = appSettings.language.rawValue
    }

    private func setUpUI() {
        view.backgroundColor = .white
        navigationItem.title = "Third"

        firstLabel.text = "Authenticate"
        firstLabel.textColor = .orange
        firstLabel.font = .systemFont(ofSize: 25)
        secondLabel.text = "Language"
        secondLabel.textColor = .blue.withAlphaComponent(0.7)
        secondLabel.font = .systemFont(ofSize: 25)

        view.addSubview(firstLabel)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20)
        ])
        view.addSubview(secondLabel)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        ])
    }
}
