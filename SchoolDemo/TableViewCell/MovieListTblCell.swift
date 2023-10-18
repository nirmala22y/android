
import UIKit


class MovieListTblCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!

    var modelData : SchoolData?{
        didSet{
            self.setModelData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setModelData(){
        lblTitle.text = modelData?.school_name
    }
}
