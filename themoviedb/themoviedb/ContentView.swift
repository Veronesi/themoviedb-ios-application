//
//  ContentView.swift
//  themoviedb
//
//  Created by facundo veronesi on 13/04/2022.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @ObservedObject var obs = observer()
    var body: some View {
        Text("hello world")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


class observer: ObservableObject {
    init(){

    }
}
