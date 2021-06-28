//
//  MapViewController.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/24/21.
//
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    private let cvIdentifier = "cvCell"
    
    var mapView = MKMapView()
    var allUserData = [MapViewDM]()
    var userData: UserDetailDM?
    
    lazy var closeButton: UIButton = {
        let btn = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        btn.setImage(UIImage(systemName: "chevron.backward", withConfiguration: largeConfig)?.withTintColor(.black,renderingMode: .alwaysOriginal), for: .normal)
        return btn
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .none
        
        return cv
    }()
    
    // MARK: Properties
    
    var presenter: MapModuleInterface?
    
    // MARK: IBOutlets
    
    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        view.backgroundColor = .red
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
        configureMapView()
        configureCloseButton()
        configureCollectionView()
    }
    
    
    private func configureMapView() {
        
        view.addSubview(mapView)
        mapView.delegate = self
        mapView.frame = view.bounds
        
    }
    
    func configureCloseButton() {
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        closeButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(10)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            
        }
    }
    
    func configureCollectionView() {
        
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: cvIdentifier)
        collectionView.contentInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.decelerationRate = .fast
        collectionView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview().inset(0)
            make.height.equalTo(140)
        }
        
    }
    
    @objc func closeButtonTap() {
        closeMapView()
    }
}

// MARK: MapViewInterface
extension MapViewController: MapViewInterface {
    
    func closeMapView() {
        presenter?.closeMapView()
    }
    
    func getUserLocationData(data: UserDetailDM) {
        
        let locationData = Capital(coordinate: .init(latitude: Double(data.address.geo.lat)!, longitude: Double(data.address.geo.lng)!), title: data.name, info: data.address.city)
        mapView.addAnnotation(locationData)
        
        mapView.camera = .init(lookingAtCenter: .init(latitude: Double(data.address.geo.lat)!, longitude: Double(data.address.geo.lng)!), fromEyeCoordinate: CLLocationCoordinate2D(), eyeAltitude: 1000.0 )
        
        userData = data
        
        
    }
    
    
    func getAllData(data: [MapViewDM]) {
        allUserData = data
        
        for item in data {
            let pin = Capital(coordinate: .init(latitude: Double(item.address.geo.lat)!, longitude: Double(item.address.geo.lng)!), title: item.name, info: item.address.city)
            mapView.addAnnotation(pin)
        }
        
        let selectedIndex = data.firstIndex{$0.name == userData?.name}
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.collectionView.scrollToItem(at: IndexPath(item: selectedIndex ?? 2, section: 0), at: .centeredHorizontally, animated: true)
        }
        collectionView.reloadData()
        
    }
}

extension MapViewController:  MKMapViewDelegate, CVDelegates {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allUserData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvIdentifier, for: indexPath) as! UserCell
        cell.backgroundColor = Colors.primary
        cell.layer.cornerRadius = 4
        cell.setData(name: allUserData[indexPath.row].name, email: allUserData[indexPath.row].email, number: allUserData[indexPath.row].phone)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 287, height: 130)
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        changeItemView()
        collectionView.scrollToNearestVisibleCollectionViewCell()
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        let selectedIndex = allUserData.firstIndex{$0.name == view.annotation?.title}
        collectionView.scrollToItem(at: IndexPath(item: selectedIndex ?? 2, section: 0), at: .centeredHorizontally, animated: true)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annotationIdentifier = "AnnotationIdentifier"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView!.canShowCallout = true
        }
        else {
            annotationView!.annotation = annotation
        }
        
        let pinImage = UIImage(systemName: "shield.fill")?.withTintColor(Colors.primary, renderingMode: .alwaysOriginal)
        annotationView?.image = pinImage
        
        return annotationView
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        changeItemView()
        collectionView.scrollToNearestVisibleCollectionViewCell()
    }
    
    func changeItemView() {
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
            mapView.camera = .init(lookingAtCenter: .init(latitude: Double(allUserData[visibleIndexPath.row].address.geo.lat)!, longitude: Double(allUserData[visibleIndexPath.row].address.geo.lng)!), fromEyeCoordinate: CLLocationCoordinate2D(), eyeAltitude: 1000.0 )
        }
    }
    
    
    
    
}


