//
//  SecondVC.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/21/21.
//

import UIKit

class SecondVC: UIViewController {
    
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Full name:"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email:"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Detail"
        view.backgroundColor = .white
        configureNameLabel()
        configureEmailLabel()
    }
    
    func configureNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func configureEmailLabel() {
        view.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20)
        ])
    }
    

}
