//
//  ContentView.swift
//  NetworkRequest
//
//  Created by AMALITECH MACBOOK on 15/06/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = TVMazeViewModel()
    var body: some View {
        NavigationStack {
            TVMazeListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
