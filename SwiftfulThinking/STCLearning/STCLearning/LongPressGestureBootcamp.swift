//
//  LongPressGestureBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 13/05/22.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            
            HStack {
                ButtonView(text: "Press me!")
                    .onLongPressGesture(
                        minimumDuration: 1.0,
                        maximumDistance: 50,
                        perform: onPressed,
                        onPressingChanged: onPressingChange)
              
                
                ButtonView(text: "Reset")
                    .onTapGesture(perform: onReset)
            }
            
        }
    }
    
    func onPressingChange(isPressing: Bool) {
        if isPressing {
            withAnimation(.easeInOut(duration: 1.0)) {
                isComplete = true
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                if !isSuccess {
                    withAnimation(.easeInOut) {
                        isComplete = false
                    }
                }
            }
        }
    }
    
    func onPressed() {
        withAnimation(.easeInOut) {
            isSuccess = true
        }
    }
    
    func onReset() {
        isSuccess = false
        isComplete = false
    }
}

struct LongPressGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureBootcamp()
    }
}

struct ButtonView: View {
    let text: String
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(Color.black)
            .cornerRadius(10)
    }
}
