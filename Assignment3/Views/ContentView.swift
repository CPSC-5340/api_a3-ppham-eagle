//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

//Main view
struct ContentView: View {
    
    @ObservedObject var contentvm = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            //load list of photo dates for user to select
            List {
                ForEach(contentvm.pictureData) { pic in
                    NavigationLink {
                        ContentDetail(results: pic)
                    } label: {
                        Text(pic.date)
                    }
                }
            }
            /*
             .onAppear() {
                 contentvm.fetchData()
             }
             */
            .task {
                await contentvm.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("NASA Pics (Mar. 2023)")
            /*
            .alert(isPresented: $contentvm.hasError, error: contentvm.error) { Text("")
            }
            */
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
