//
//  DetailsView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 10/12/22.
//

import SwiftUI

struct DetailsView: View {
    
    @EnvironmentObject var vm: TodayViewModel
    @Environment(\.colorScheme) var colorScheme
    
    @GestureState private var drag = CGSize.zero
    
    var body: some View {
        GeometryReader { geo  in
            if let item = vm.selectedItem {
                ZStack {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing:0) {
                            ZStack{
                                buildImage(image: item.image)
                                buildDetail(item: item)
                            }
                            .frame(height: vm.itemHeight)
                            .zIndex(1)
                            Text(item.description)
                                .padding()
                                .frame(maxHeight: vm.showDetails ? .infinity : 0)
                        }
                    }
                    .frame(width: vm.detailsStartPoint.width,
                           height: vm.detailsStartPoint.height)
                    .background(colorScheme == .dark ? Color.black : Color.white)
                    .cornerRadius(vm.showDetails ? 0 : 15 )
                    .animation(.easeInOut(duration: 0.3), value: vm.showDetails)
                    .offset(x: vm.detailsStartPoint.minX, y: vm.detailsStartPoint.minY)
                    
                    closeButton
                }
                
            } else {
                EmptyView()
            }
        }.edgesIgnoringSafeArea(.top)
            .opacity(vm.showDetails ? 1 : 0.0)
            .animation(
                Animation.easeInOut(duration: 0.05)
                    .delay(vm.detailsWillHide ? 0.5 : 0),
                value: vm.detailsWillHide
            )
    }
}

// MARK: PREVIEW Block
struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
            .environmentObject(TodayViewModel())
    }
}

// MARK: Components
extension DetailsView {
    private var closeIcon: some View {
        Image(systemName: "xmark.circle.fill")
            .foregroundColor(.init(white: 0.9))
            .font(.system(size: 25)).padding()
            .opacity(vm.showDetails ? 1 : 0.0)
            .animation(
                Animation.easeInOut(duration: 0.3),
                value: vm.showDetails
            )
    }
    
    private var closeButton: some View {
        Button(action: onClose) { closeIcon }
            .offset(x: (UIScreen.main.bounds.width/2) - 30,
                    y: (-1 * UIScreen.main.bounds.height/2) + 60)
    }
}

// MARK: ViewBuilder Block
extension DetailsView {
    @ViewBuilder
    private func buildImage(image: String) -> some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(
                width: vm.showDetails ? UIScreen.main.bounds.width : vm.SVWidth,
                height:vm.itemHeight
            )
            .clipped()
            .edgesIgnoringSafeArea(.top)
    }
    
    @ViewBuilder
    private func buildDetail(item: TodayModel) -> some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("\(item.subtitle)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.init(white: 0.8)).opacity(0.6)

                Text("\(item.name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .offset(y:vm.showDetails ? 44 : 0)
            Spacer()
            
            Text("\(item.description)")
                .lineLimit(2)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.init(white: 0.9)).opacity(0.8)
        }
        .padding()
        .frame(width: vm.detailsStartPoint.width)
    }
}

// MARK: Functions and Events Block
extension DetailsView {
    
    private func onClose() {
        vm.detailsWillHide = true
        vm.detailsStartPoint = vm.detailsReturnPoint
        vm.showDetails = false
        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false, block: hideDetails)
    }
    
    private func hideDetails(timer: Timer) {
        vm.detailsWillHide = false
    }
}
