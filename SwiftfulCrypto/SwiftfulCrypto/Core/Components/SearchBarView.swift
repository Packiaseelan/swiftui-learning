//
//  SearchBarView.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 18/06/22.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            leftIcon
            textField
        }
        .font(.headline)
        .padding()
        .background(background)
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(searchText: .constant(""))
                .preferredColorScheme(.light)
            SearchBarView(searchText: .constant(""))
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}

extension SearchBarView {
    
    private var leftIcon: some View {
        Image(systemName: "magnifyingglass")
            .foregroundColor(
                searchText.isEmpty
                ? Color.theme.secondaryText
                : Color.theme.accent
            )
    }
    
    private var textField: some View {
        TextField("Search by name or symbols..", text: $searchText)
            .foregroundColor(Color.theme.accent)
            .disableAutocorrection(true)
            .overlay(
                Image(systemName: "xmark.circle.fill")
                    .padding()
                    .offset(x: 10)
                    .foregroundColor(Color.theme.accent)
                    .opacity(searchText.isEmpty ? 0 : 1)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                        searchText = ""
                    }
                ,alignment: .trailing
            )
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.theme.background)
            .shadow(color: Color.theme.accent.opacity(0.15), radius: 10, x: 0, y: 0)
    }
    
}
