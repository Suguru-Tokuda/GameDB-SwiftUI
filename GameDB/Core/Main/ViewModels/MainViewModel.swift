//
//  MainViewModel.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import Foundation

enum HomeRoute : String, Hashable {
    case signIn, tabs
}

class MainViewModel : ObservableObject {
    @Published var homeRoute: HomeRoute = .signIn
}
