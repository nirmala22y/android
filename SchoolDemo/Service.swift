//
//  Service.swift


import UIKit
import CoreData

class Service{
    
    static let sharedInstance = Service()
    
    func getSchoolList(complition:@escaping ((_ isSuccess :Bool, _ errorMessage:String?,_ data: [SchoolData]?) -> Void)){
        
        guard let url = URL.init(string: BASE_URL) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
                guard let data = data else{
                    print(error.debugDescription)
                    return
                }
                do{
                    var movieData = [SchoolData]()
                    let result = try JSONDecoder().decode([SchoolData].self, from: data)
                    movieData = result
                    complition(true, nil, movieData)
                }catch let jsonError{#imageLiteral(resourceName: "simulator_screenshot_4F2F117E-6788-4CA3-AF8E-EBBCC345688D.png")
                    print(jsonError.localizedDescription)
                }
            
        }.resume()
    }
    func getSchoolSATData(complition:@escaping ((_ isSuccess :Bool, _ errorMessage:String?,_ data: [SchoolSATData]?) -> Void)){
        
        guard let url = URL.init(string: BASE2_URL) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
                guard let data = data else{
                    print(error.debugDescription)
                    return
                }
                do{
                    var movieData = [SchoolSATData]()
                    let result = try JSONDecoder().decode([SchoolSATData].self, from: data)
                    movieData = result
                    complition(true, nil, movieData)
                }catch let jsonError{
                    print(jsonError.localizedDescription)
                }
            
        }.resume()
    }    
}
    
