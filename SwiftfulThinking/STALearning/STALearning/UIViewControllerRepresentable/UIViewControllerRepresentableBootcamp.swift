//
//  UIViewControllerRepresentableBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 24/08/22.
//

import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {
    
    @State var showView: Bool = false
    @State var image: UIImage? = nil
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, World!")
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            Button("Click here") {
                showView.toggle()
            }
        }
        .sheet(isPresented: $showView) {
//            BasicUIViewControllerRepresentable(labelText: "new value")
            UIImagePickerControllerRepresentable(image: $image, showView: $showView)
        }
    }
}

struct UIViewControllerRepresentableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerRepresentableBootcamp()
    }
}

struct UIImagePickerControllerRepresentable: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Binding var showView: Bool
    
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Controller {
        return Controller(image: $image, showView: $showView)
    }
    
    class Controller: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        @Binding var image: UIImage?
        @Binding var showView: Bool
        
        init(image: Binding<UIImage?>, showView: Binding<Bool>) {
            self._image = image
            self._showView = showView
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let newImage = info[.originalImage] as? UIImage else { return }
            
            self.image = newImage
            self.showView = false
        }
    }
}

struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    let labelText: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = MyViewController()
        vc.labelText = labelText
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

class MyViewController: UIViewController {
    
    var labelText: String = "starting value"
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
        
        let label = UILabel()
        label.text = labelText
        label.textColor = .white
        
        view.addSubview(label)
        label.frame = view.frame
    }
}
