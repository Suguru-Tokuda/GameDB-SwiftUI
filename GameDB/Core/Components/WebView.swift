//
//  WebView.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var urlStr: String
    typealias UIViewType = WKWebView

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlStr) {
            uiView.load(URLRequest(url: url))
        }
    }
}

#Preview {
    WebView(urlStr: "https://www.apple.com")
}
