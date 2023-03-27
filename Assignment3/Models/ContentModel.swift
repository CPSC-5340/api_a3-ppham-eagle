//
//  ContentModel.swift
//  Assignment3
//
//  Created by user236826 on 3/25/23.
//

import Foundation

//Model for holding API variables
struct QueryResults : Codable, Identifiable{
    //Both ways work for creating id for identifiable
    /*
    var id : String {
        return date
    }
    */
    var id : UUID {
        return UUID()
    }
    
    //Must match API strings exactly
    let date: String
    let explanation: String
    let title: String
    let url: String
    let media_type: String
}
