//
//  ModelView.swift
//  Assignment3
//
//  Created by user236826 on 3/26/23.
//

import SwiftUI

//View to handle media from NASA APOD API
struct PictureView: View {
    
    var url : String
    var type : String
    
    var body: some View {
        //Have to check if media is image or video because of NASA's mediatype API
        if(type == "image") {
            //Load image async
            AsyncImage(url: URL(string: url)) { image in
                image.resizable()
                    .scaledToFit()
                    //.frame(width: 350, height: 350)
            } placeholder: {
                ProgressView()
            }
        }
        //Just load a video in Safari, Vimeo links don't work yet
        if(type == "video") {
            Link("Watch video in Safari (some links may not work)", destination: URL(string: url)!)
                .padding()
        }
    }
}

/*
struct ModelView_Previews: PreviewProvider {
    static var previews: some View {
        PictureView(url: "")
    }
}
*/
