//
//  SingleTVMazeView.swift
//  NetworkRequest
//
//  Created by AMALITECH MACBOOK on 15/06/2023.
//

import SwiftUI

struct SingleTVMazeView: View {
    let tvMaze: TVMazeModel
    var body: some View {
        VStack {
            if let url = URL(string:tvMaze.image.original) {
                ZStack(alignment: .bottomLeading) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray
                            .frame(width: 300, height: 200)
                            .redacted(reason: .placeholder)
                    }
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack {
                            ForEach (tvMaze.genres, id: \.self) { genre in
                                Text(genre)
                                    .padding(8)
                                    .foregroundColor(.white)
                                    .background(.black)
                                    .cornerRadius(16)
                            }
                        }
                        .padding(.bottom, 16)
                    }
                }

            }
            Text(tvMaze.name)
                .bold()
                .padding(8)
                .foregroundColor(.red)
                .background(.black)
                .cornerRadius(10)

        }
        .padding(.leading, 8)
        .padding(.trailing, 8)
    }
}
