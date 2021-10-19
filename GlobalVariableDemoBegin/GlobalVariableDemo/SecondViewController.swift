//
//  SecondViewController.swift
//  GlobalVariableDemo
//
//  Created by Su T. Nguyen on 15/09/2021.
//

import UIKit

final class SecondViewController: UIViewController {

    var appSettings = AppSettings()

    private let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI() {
        view.backgroundColor = .white
        navigationItem.title = "Language"

        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setTitle("Language", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)

        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func didTapButton() {
        appSettings.toggleLanguage()
    }
}
