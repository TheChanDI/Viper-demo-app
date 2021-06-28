//
//  OfficeCell.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/24/21.
//

import UIKit

class OfficeCell: UITableViewCell {
    
    var webLabel = UILabel()
    var nameLabel = UILabel()
    
    lazy var bgView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9607843137, blue: 1, alpha: 0.9359274353)
        v.layer.cornerRadius = 4
        
        let linkIcon = returnIconImage(with: "link")
        let officeIcon = returnIconImage(with: "building.2")
        
        let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.axis = .vertical
        v.addSubview(sv)
        sv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().offset(10)
        }
        
        let nameView = UIView()
        nameView.addSubview(officeIcon)
        officeIcon.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        nameLabel.text = "Prakash Chandra Awal"
        nameLabel.textColor = Colors.textColor
        nameView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(officeIcon.snp.trailing).offset(10)
            make.centerY.equalTo(officeIcon)
        }
        sv.addArrangedSubview(nameView)
        
        let webView = UIView()
        webView.addSubview(linkIcon)
        linkIcon.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        webLabel.text = "Prakash@gmail.com"
        webLabel.textColor = Colors.primary
        webView.addSubview(webLabel)
        webLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(linkIcon.snp.trailing).offset(10)
            make.centerY.equalTo(linkIcon)
        }
        sv.addArrangedSubview(webView)
        
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
    
    func setData(officeLocation: String?, website: String?) {
        guard let location = officeLocation, let link = website else {return}
        nameLabel.text = location
        webLabel.text = link
    }
    
    
}
