

import Foundation
struct Movies : Codable {
	let page : Int?
	let results : [Results]?
	let total_pages : Int?
	let total_results : Int?

	enum CodingKeys: String, CodingKey {

		case page = "page"
		case results = "results"
		case total_pages = "total_pages"
		case total_results = "total_results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		page = try values.decodeIfPresent(Int.self, forKey: .page)
		results = try values.decodeIfPresent([Results].self, forKey: .results)
		total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
		total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
	}
}
struct SchoolData : Codable {
    let dbn : String?
    let school_name : String?

    enum CodingKeys: String, CodingKey {

        case dbn = "dbn"
        case school_name = "school_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dbn = try values.decodeIfPresent(String.self, forKey: .dbn)
        school_name = try values.decodeIfPresent(String.self, forKey: .school_name)
    }
}
struct SchoolSATData : Codable {
    
    var dbn : String? = ""
    var school_name : String? = ""
    var num_of_sat_test_takers : String? = ""
    var sat_critical_reading_avg_score : String? = ""
    var sat_math_avg_score : String? = ""
    var sat_writing_avg_score : String? = ""
    
    init(){
        
    }
    enum CodingKeys: String, CodingKey {

        case dbn = "dbn"
        case school_name = "school_name"
        case sat_critical_reading_avg_score = "sat_critical_reading_avg_score"
        case sat_math_avg_score = "sat_math_avg_score"
        case sat_writing_avg_score = "sat_writing_avg_score"
        case num_of_sat_test_takers = "num_of_sat_test_takers"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dbn = try values.decodeIfPresent(String.self, forKey: .dbn)
        school_name = try values.decodeIfPresent(String.self, forKey: .school_name)
        sat_critical_reading_avg_score = try values.decodeIfPresent(String.self, forKey: .sat_critical_reading_avg_score)
        sat_math_avg_score = try values.decodeIfPresent(String.self, forKey: .sat_math_avg_score)
        sat_writing_avg_score = try values.decodeIfPresent(String.self, forKey: .sat_writing_avg_score)
        num_of_sat_test_takers = try values.decodeIfPresent(String.self, forKey: .num_of_sat_test_takers)
        
    }
}
