//
//  MovieDetailViewController.swift


import UIKit

class SchoolDetailViewController: UIViewController {

    let listViewModel = SchoolListViewModel()
    
    @IBOutlet weak var imgBack: UIImageView!
  
@IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblGenres: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var desc: UILabel!
    var detailId :String?
    var dbnId :String?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "SAT Result Details"
        listViewModel.getSchoolSATData(dbnId: dbnId)
       
        listViewModel.refreshDetailData = { [weak self] in
            DispatchQueue.main.async {
                
                if self!.listViewModel.isDataFind{
                    let detail = self!.listViewModel.satDataItem
                    self!.lblOverview.text = "School Name: \(String(describing: detail.school_name ?? ""))"
                    self!.lblGenres.text = "No of set test: \(String(describing: detail.num_of_sat_test_takers ?? ""))"
                    self!.lblDuration.text = "Match Avg. Score: \(String(describing: detail.sat_math_avg_score ?? ""))"
                    self!.lblLanguage.text = "Writing Avg. Score: \(String(describing: detail.sat_writing_avg_score ?? ""))"
                }else{
                    self!.lblOverview.text = "Data not found."
                    self!.lblGenres.text = ""
                    self!.lblDuration.text = ""
                    self!.lblLanguage.text = ""
                }
                
            }
        }
    }
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
