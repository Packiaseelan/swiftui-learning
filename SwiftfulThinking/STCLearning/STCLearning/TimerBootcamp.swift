//
//  TimerBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 05/06/22.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    /*
    @State var currentDate:Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
    */
    
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
    */
    
    @State var remainingTime: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    
    @State var count: Int = 1
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))], center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
//            Text(remainingTime)
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .foregroundColor(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
            
//            HStack {
//                Circle()
//                    .offset(y: count == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -20 : 0)
//            }
//            .frame(width: 150)
//            .foregroundColor(.white)
            
            TabView(selection: $count) {
                Rectangle()
                    .foregroundColor(.red)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.green)
                    .tag(3)
            }
            .frame( height: 200)
            .tabViewStyle(PageTabViewStyle())
            
        }
        .onReceive(timer, perform: { _ in
//            currentDate = value
            
//            if count < 1 {
//                finishedText = "Wow!"
//            } else {
//                count -= 1
//            }
            
//            updateRemainingTime()
            withAnimation(.easeIn(duration: 0.5)){
                count = count == 3 ? 1 : count + 1
            }
        })
    }
    
    func updateRemainingTime() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        remainingTime = "\(hour):\(minute):\(second)"
        
    }
}

struct TimerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TimerBootcamp()
    }
}
