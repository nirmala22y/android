//
//  MovieListViewController.swift

import UIKit



class SChoolListViewController: UIViewController {

    @IBOutlet weak var tblMovieList: UITableView!
    let listViewModel = SchoolListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tblMovieList.register(UINib.init(nibName: MovieListTblCell.className, bundle: Bundle.main), forCellReuseIdentifier: MovieListTblCell.className)
        
        
       
            listViewModel.getDataFromServer()
      
        listViewModel.refreshData = { [weak self] in
            DispatchQueue.main.async {
                self?.tblMovieList.reloadData()
            }
        }
    }
}
extension SChoolListViewController: UITableViewDelegate,UITableViewDataSource{


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.schoolData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: MovieListTblCell.className, for: indexPath) as! MovieListTblCell
        cell.modelData = listViewModel.schoolData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let detail = storyboard.instantiateViewController(withIdentifier: SchoolDetailViewController.className) as! SchoolDetailViewController
                detail.dbnId = listViewModel.schoolData[indexPath.row].dbn
            self.navigationController?.pushViewController(detail, animated: true)
    }
}
