//
//  UIViewRepresentableBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 22/08/22.
//

import SwiftUI

// Convert a UIView from UIKit to SwiftUI
struct UIViewRepresentableBootcamp: View {
    @State var text: String = ""
    var body: some View {
        VStack {
            Text(text)
            
            TextField("Text here", text: $text)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.gray)
            
            UITextFieldViewRepresentable(text: $text)
                .updatePlaceHolder("updated")
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.gray)
        }
    }
}

struct UIViewRepresentableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewRepresentableBootcamp()
    }
}

struct BasicUIViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView();
        view.backgroundColor = .red
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    let placeholderColor: UIColor
    
    init(text: Binding<String>, placeholder: String = "Default placeholder...", placeholderColor: UIColor = .red) {
        self._text = text
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
    }
    
    // send data From SwiftUI to UIKit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textfield = getTextField()
        textfield.delegate = context.coordinator
        return textfield
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func updatePlaceHolder(_ text: String) -> UITextFieldViewRepresentable {
        var view = self
        view.placeholder = text
        return view
    }
    
    private func getTextField() -> UITextField {
        let textfield = UITextField(frame: .zero)
        let placeholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: placeholderColor])
        textfield.attributedPlaceholder = placeholder
        return textfield
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}
