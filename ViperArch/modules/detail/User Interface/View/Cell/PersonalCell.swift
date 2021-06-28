//
//  PersonalCell.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/24/21.
//

import UIKit
import SnapKit

class PersonalCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var username = UILabel()
    var emailLabel = UILabel()
    var phoneLabel = UILabel()
    
    lazy var bgView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9607843137, blue: 1, alpha: 0.9359274353)
        v.layer.cornerRadius = 4
        
        let nameIcon = returnIconImage(with: "person.fill")
        let mailIcon = returnIconImage(with: "mail")
        let phoneIcon =  returnIconImage(with: "phone")
        
        let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.axis = .vertical
        v.addSubview(sv)
        sv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().offset(10)
        }
        
        let nameView = UIView()
        nameView.addSubview(nameIcon)
        nameIcon.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        nameLabel.text = "Prakash Chandra Awal"
        nameLabel.textColor = Colors.textColor
        nameView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(nameIcon.snp.trailing).offset(10)
            make.centerY.equalTo(nameIcon)
        }
        sv.addArrangedSubview(nameView)
        
        let userNameView = UIView()
        userNameView.addSubview(mailIcon)
        mailIcon.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        emailLabel.text = "Prakash@gmail.com"
        emailLabel.textColor = Colors.textColor
        userNameView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(mailIcon.snp.trailing).offset(10)
            make.centerY.equalTo(mailIcon)
        }
        sv.addArrangedSubview(userNameView)
        
        let phoneImageView = UIView()
        phoneImageView.addSubview(phoneIcon)
        phoneIcon.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        
        phoneLabel.text = "9860200467"
        phoneLabel.textColor = Colors.textColor
        phoneImageView.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(phoneIcon.snp.trailing).offset(10)
            make.centerY.equalTo(phoneIcon)
        }
        sv.addArrangedSubview(phoneImageView)
        
        
 
        
        return v
    }()
    
    // Takes an sf symbol name and return image
    func returnIconImage(with name: String) -> UIImageView {
        return UIImageView(image: UIImage(systemName: name))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBgView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureBgView() {
        contentView.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview()
        }
    }
    
    func setData(name: String?, email: String?, phone: String?) {
        guard let name = name, let email = email , let phone = phone else {return}
        nameLabel.text = name
        emailLabel.text = email
        phoneLabel.text = phone
    }
}
