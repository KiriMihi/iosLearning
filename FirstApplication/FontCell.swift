import UIKit

class FontCell: CollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        self.textLabel.textColor = .black
        
    }
    
    override func reset() {
        super.reset()
        
        self.textLabel.text = nil
    
    }
}
