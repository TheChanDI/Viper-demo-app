//
//  DetailViewController.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: Properties
    
    enum CellType: String {
        case personalCell
        case addressCell
        case officeCell
    }
    
    var doneAnimation: Bool = false
    var leftIcon = UIImage(systemName: "suit.heart.fill")
    var userDetailData: UserDetailDM?
    var isFavourite: Bool = false {
        didSet {
            if !isFavourite  {
                leftIcon = UIImage(systemName: "suit.heart.fill")
            }
            
            else {
                leftIcon = UIImage(systemName: "suit.heart.fill")?.withTintColor(Colors.errorColor, renderingMode: .alwaysOriginal)
            }
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: leftIcon, style: .plain, target: self, action: #selector(saveIconTapp))
        }
    }
    
    var presenter: DetailModuleInterface?
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.separatorStyle = .none
        return tv
    }()
    

    
    // MARK: IBOutlets
    
    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.setup()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
        
        configureNavigationBar()
        configureTableView()
    }
    
    func configureNavigationBar() {
      
        if (presenter?.checkIsFavourite(for: userDetailData?.name ?? "-") ?? false) {
            
            let heartIcon = UIImage(systemName: "suit.heart.fill")?.withTintColor(Colors.errorColor, renderingMode: .alwaysOriginal)
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: heartIcon, style: .plain, target: self, action: #selector(saveIconTapp))
        }
        else {
         
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: leftIcon, style: .plain, target: self, action: #selector(saveIconTapp))
        }
        
       

    }
    
    @objc func saveIconTapp() {
        isFavourite = !(presenter?.checkIsFavourite(for: userDetailData?.name ?? "-") ?? false)
        presenter?.favouriteButtonTap(with: userDetailData?.name ?? "-")
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PersonalCell.self, forCellReuseIdentifier: CellType.personalCell.rawValue)
        tableView.register(AddressCell.self, forCellReuseIdentifier: CellType.addressCell.rawValue)
        tableView.register(OfficeCell.self, forCellReuseIdentifier: CellType.officeCell.rawValue)
        tableView.frame = view.bounds
    }
    
}

extension DetailViewController: TVDelegates {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellType.personalCell.rawValue, for: indexPath) as! PersonalCell
            cell.selectionStyle = .none
            cell.setData(name: userDetailData?.name, email: userDetailData?.email, phone: userDetailData?.phone)
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellType.addressCell.rawValue, for: indexPath) as! AddressCell
            cell.selectionStyle = .none
            cell.setData(address: userDetailData?.address.city, zipCode: userDetailData?.address.zipcode)
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellType.officeCell.rawValue, for: indexPath) as! OfficeCell
            cell.selectionStyle = .none
            cell.setData(officeLocation: userDetailData?.company.name, website: userDetailData?.website)
            return cell
        default:
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 2 {
            let btnView = UIView()
            let btn = UIButton()
            btn.setTitle(" View in map", for: .normal)
            btn.setImage(UIImage(systemName: "location.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
            btn.backgroundColor = Colors.secondary
            btn.addTarget(self, action: #selector(viewMapButtonTap), for: .touchUpInside)
            btn.layer.cornerRadius = 4
            btnView.addSubview(btn)
            btn.snp.makeConstraints { (make) in
                make.top.equalTo(20)
                make.leading.trailing.equalToSuperview().inset(20)
                make.height.equalTo(40)
            }
            return btnView
        }
        else {
            return nil
        }
    }
    
    @objc func viewMapButtonTap() {
        mapButtonTapped()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 2 ? 70 : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 140
            
        case 1, 2:
            return 100

        default:
            return 0
        }
    }
    
    
    
}


// MARK: DetailViewInterface
extension DetailViewController: DetailViewInterface {
    
    func updateView(with data: UserDetailDM) {
        userDetailData = data
        tableView.reloadData()

    }
    
    func mapButtonTapped() {
        presenter?.navigateToMap()
    }
}
