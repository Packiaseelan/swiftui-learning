//
//  ProtocolsBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 24/08/22.
//

import SwiftUI

protocol ColorThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiory: Color { get }
}

struct DefaultColorTheme: ColorThemeProtocol {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiory: Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
    let primary: Color = .red
    let secondary: Color = .white
    let tertiory: Color = .green
}

protocol ButtonTextProtocol {
    var buttonText: String { get }
}

protocol ButtonPressedProtocol {
    func buttonPressed()
}

protocol ButtonDataSourceProtocol: ButtonTextProtocol, ButtonPressedProtocol {

}

struct DefaultDataSource: ButtonDataSourceProtocol {
    var buttonText: String = "Hello, world!"
    
    func buttonPressed() {
        print("button pressed!")
    }
}

struct AlternativeDataSource: ButtonTextProtocol {
    var buttonText: String = "Hello, everyone!"
}

struct ProtocolsBootcamp: View {
    
//    let colorTheme: DefaultColorTheme = DefaultColorTheme()
//    let colorTheme: AlternativeColorTheme = AlternativeColorTheme()
    let colorTheme: ColorThemeProtocol = DefaultColorTheme()
    let dataSource: ButtonDataSourceProtocol = DefaultDataSource()
    
    var body: some View {
        ZStack {
            colorTheme.tertiory.ignoresSafeArea()
            
            Text(dataSource.buttonText)
                .foregroundColor(colorTheme.primary)
                .padding()
                .background(colorTheme.secondary)
                .cornerRadius(10)
                .onTapGesture {
                    dataSource.buttonPressed()
                }
        }
    }
}

struct ProtocolsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ProtocolsBootcamp()
    }
}
