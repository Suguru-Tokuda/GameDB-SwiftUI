//
//  SwiftUIToUIKit.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import SwiftUI
import UIKit

struct SwiftUIToUIKit: View {
    var navigationController = UINavigationController()
    
    init() {
        let vc = SimpleViewController()
        navigationController.setViewControllers([vc], animated: true)
    }
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            Button(action: {
                handleGoToUIVCBtnTapped()
            }, label: {
                Text("Go to UI View Controller")
            })
        }
    }
}

extension SwiftUIToUIKit {
    func handleGoToUIVCBtnTapped() {
//        let vc = SimpleViewController()
//        navigationController.pushViewController(vc, animated: true)
////        navigationController.pushViewController(SimpleViewController(), animated: true)
    }
}

#Preview {
    SwiftUIToUIKit()
}
