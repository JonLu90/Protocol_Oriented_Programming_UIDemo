import UIKit

class TacoCell: UICollectionViewCell, TacoShakable {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setCellUI()
        setCellContentConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("required init?(coder aDecoder: NSCoder) not implemented")
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.black
        label.textColor = UIColor.white
        label.numberOfLines = 2
        label.font = label.font.withSize(13)
        label.textAlignment = NSTextAlignment.center
        
        return label
    }()
    
    func setCellUI() {
        contentView.backgroundColor = UIColor.white
        
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(descriptionLabel)
        
    }
    func setCellContentConstraints() {
        thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        thumbnailImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        thumbnailImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 0).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true

        
    }
    
}
