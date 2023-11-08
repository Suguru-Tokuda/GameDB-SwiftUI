//
//  SimpeViewController.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import UIKit

class SimpleViewController: UIViewController {
    var toSwiftUIBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("To UIKit", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension SimpleViewController {
    private func setupUI() {
        view.addSubview(toSwiftUIBtn)
        applyConstraints()
    }
}

extension SimpleViewController {
    private func applyConstraints() {
        let btnConstraints = [
            toSwiftUIBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toSwiftUIBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            toSwiftUIBtn.widthAnchor.constraint(equalToConstant: view.frame.width / 2)
        ]
        
        NSLayoutConstraint.activate(btnConstraints)
    }
}
