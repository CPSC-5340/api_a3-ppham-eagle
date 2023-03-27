//
//  ContentDetail.swift
//  Assignment3
//
//  Created by user236826 on 3/26/23.
//

import SwiftUI

//View to show a detailed view of photo date selected
//Details includ title of media, media, and media explanation
struct ContentDetail: View {
    
    let results: QueryResults
    
    var body: some View {
        ScrollView {
            VStack() {
                Text(results.title)
                    .font(.system(size: 30))
                PictureView(url: results.url, type: results.media_type)
                Text(results.explanation)
                    .padding(8)
            }
            .padding(.top, -40)
        }
    }
}

/*
 struct ContentDetail_Previews: PreviewProvider {
 static var previews: some View {
 ContentDetail()
 }
 }
 */
