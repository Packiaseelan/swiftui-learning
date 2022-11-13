//
//  TypealiasBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 01/06/22.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypealiasBootcamp: View {
//    @State var item: MovieModel = MovieModel(title: "MARVEL", director: "JOE", count: 10)
    
    @State var item: TVModel = TVModel(title: "MARVEL Studio", director: "EMMILY", count: 10)
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct TypealiasBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TypealiasBootcamp()
    }
}
