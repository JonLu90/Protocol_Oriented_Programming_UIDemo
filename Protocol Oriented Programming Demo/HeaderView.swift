
import UIKit

class HeaderView: UIView, DropShadow {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // set up view
        self.addSubview(UIImageView(image: UIImage(named: "Taco-POP")))
        backgroundColor = UIColor.orange
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
        addDropShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
