//
//  MainView.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainViewModel()
    
    var body: some View {
        NavigationStack {
            switch vm.homeRoute {
            case .signIn:
                SignInView()
                    .environmentObject(vm)
            case .tabs:
                GameDatabaseTabView()
            }
        }
    }
}

#Preview {
    MainView()
}
