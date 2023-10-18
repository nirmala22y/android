//
//  Constant.swift


import Foundation

 
var appName : String {
    return Bundle.main.infoDictionary!["CFBundleName"] as! String
}
let AppDelegateObj : AppDelegate = AppDelegate.shared


let BASE_URL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
let BASE2_URL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"

class Constant:NSObject{
 
    static let ImageBasePath = "https://image.tmdb.org/t/p/w500"
    
}
