//
//  ListView.swift
//  TodoList
//
//  Created by Packiaseelan S on 12/05/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listVM: ListViewModel
    
    var body: some View {
        ZStack{
            if listVM.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listVM.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listVM.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listVM.deleteItem)
                    .onMove(perform: listVM.moveItem)
                }
                .listStyle(InsetListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
