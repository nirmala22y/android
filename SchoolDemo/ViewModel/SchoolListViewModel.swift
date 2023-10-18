//
//  MovieListViewModel.swift

import UIKit
import CoreData


class SchoolListViewModel: NSObject {

    var schoolData = [SchoolData]()
    var schoolSATData = [SchoolSATData]()
    var satDataItem = SchoolSATData()
    var isDataFind : Bool = false
    

    var refreshData:(()->Void)?
    var refreshDetailData:(()->Void)?
    
    func getDataFromServer(){

        DispatchQueue.main.async {
            Service.sharedInstance.getSchoolList() { (isCuccess, error, data) in
                if isCuccess{
                    if let data = data{
                        self.schoolData = data
                        self.refreshData?()
                    }
                }else{
                    print(error.debugDescription)
                }
            }
        }
        
    }
    func getSchoolSATData(dbnId:String?){

        DispatchQueue.main.async {
            Service.sharedInstance.getSchoolSATData() { (isCuccess, error, data) in
                if isCuccess{
                    if let data = data{
                        if let item = data.first(where: {$0.dbn == dbnId}){
                            self.isDataFind = true
                            self.satDataItem = item
                        }else{
                            self.isDataFind = false
                        }
                        self.refreshDetailData?()
                    }
                }else{
                    print(error.debugDescription)
                }
            }
        }
        
    }
}
    
