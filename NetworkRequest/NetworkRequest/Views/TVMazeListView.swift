//
//  TVMazeListView.swift
//  NetworkRequest
//
//  Created by AMALITECH MACBOOK on 15/06/2023.
//

import SwiftUI

struct TVMazeListView: View {
    @ObservedObject var viewModel = TVMazeViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach (viewModel.allTVmaze, id: \.self) {
                tvMaze in
                NavigationLink {
                    SingleTVMazeView(tvMaze: tvMaze)
                } label: {
                    SingleTVMazeView(tvMaze: tvMaze)
                }
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchData()
        }
    }
}

struct TVMazeListView_Previews: PreviewProvider {
    static var previews: some View {
        TVMazeListView()
    }
}
