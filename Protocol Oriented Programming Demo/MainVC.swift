
import UIKit

let cellIdentifier = "Taco Cell"

class MainVC: UIViewController,  DataSerciceDelegate{
    
    var headerView = HeaderView()
    var collectionView = CollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    var dataservice = DataService.instance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(TacoCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setMainVCUI()
        setViewConstraints()

        deliciousTacoDataLoaded()
    }
    
    func deliciousTacoDataLoaded() {
        dataservice.loadTacoData()
    }
    
    func setMainVCUI() {
        
        view.backgroundColor = UIColor.lightGray
        title = "Taco Pop"
        navigationController?.navigationBar.barTintColor = UIColor.red
        
        view.addSubview(headerView)
        view.addSubview(collectionView)
        
    }
    
    // set constraints
    func setViewConstraints() {
        let heightOffset:CGFloat = (navigationController?.navigationBar.bounds.height)!
        
        // constraints for headerView
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        headerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        headerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: heightOffset).isActive = true
        
        // constraints for collectionView
        collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        view.rightAnchor.constraint(equalTo: collectionView.rightAnchor, constant: 8).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 8).isActive = true
        
    }
    
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataservice.getTacoData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? TacoCell {
            
            // configure cell
            let tacoArray = dataservice.getTacoData()
            cell.thumbnailImageView.image = UIImage(named: "\(tacoArray[indexPath.row].proteinId)")
            cell.descriptionLabel.text = tacoArray[indexPath.row].productName
            
            return cell
        }
        else {
            return TacoCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TacoCell {
            cell.shake()
        }
    }
    
    // size for Taco Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/4, height: view.frame.width/4)
    }
    
    
    
    
    
    
}
