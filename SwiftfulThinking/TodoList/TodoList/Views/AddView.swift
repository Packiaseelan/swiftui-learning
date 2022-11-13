//
//  AddView.swift
//  TodoList
//
//  Created by Packiaseelan S on 12/05/22.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listVM: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var text: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $text)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button (
                    action: addItem,
                    label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })

            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖋")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func addItem() {
        if text.count < 3 {
            alertTitle = "New item must me atleast 3 characters long."
            showAlert.toggle()
            return
        }
        listVM.addItem(title: text)
        presentationMode.wrappedValue.dismiss()
    }
    
    func getAlert() -> Alert {
        Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
