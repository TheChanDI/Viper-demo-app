//
//  UserCell.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/25/21.
//

import UIKit

class UserCell: UICollectionViewCell {
    
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Prakash Chandra Awal"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var emailLabel: UILabel = {
       let label = UILabel()
        label.text = "chandi@gmail.com"
        label.textColor = .white
        return label
    }()
    
    lazy var phoneLabel: UILabel = {
       let label = UILabel()
        label.text = "9860200467"
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureNameLabel()
        configureEmailLabel()
        configurePhoneLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview().inset(15)
            
        }
    }
    
    func configureEmailLabel() {
        contentView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
        }
    }
    
    func configurePhoneLabel() {
        contentView.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { (make) in
            make.top.equalTo(emailLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
        }
    }
    
    
    func setData(name: String, email: String, number: String) {
        nameLabel.text = name
        emailLabel.text = email
        phoneLabel.text = number
    }
    
}
