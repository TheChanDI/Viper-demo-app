//
//  AddressCell.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/24/21.
//

import UIKit

class AddressCell: UITableViewCell {
    
    var cityLabel = UILabel()
    var zipLabel = UILabel()
    
    lazy var bgView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9607843137, blue: 1, alpha: 0.9359274353)
        v.layer.cornerRadius = 4
        
        let cityIcon = returnIconImage(with: "building.fill")
        let zipIcon = returnIconImage(with: "scribble.variable")
        
        let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.axis = .vertical
        v.addSubview(sv)
        sv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().offset(10)
        }
        
        let cityView = UIView()
        cityView.addSubview(cityIcon)
        cityIcon.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        cityLabel.text = "Prakash Chandra Awal"
        cityLabel.textColor = Colors.textColor
        cityView.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(cityIcon.snp.trailing).offset(10)
            make.centerY.equalTo(cityIcon)
        }
        sv.addArrangedSubview(cityView)
        
        let zipView = UIView()
        zipView.addSubview(zipIcon)
        zipIcon.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        zipLabel.text = "Prakash@gmail.com"
        zipLabel.textColor = Colors.textColor
        zipView.addSubview(zipLabel)
        zipLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(zipIcon.snp.trailing).offset(10)
            make.centerY.equalTo(zipIcon)
        }
        sv.addArrangedSubview(zipView)
        
        
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
    
    func setData(address: String?, zipCode: String?) {
        guard let zipCode = zipCode, let address = address else {return}
        cityLabel.text = address
        zipLabel.text = zipCode
    }
}
