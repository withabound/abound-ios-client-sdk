//
//  AboundThemeButton.swift
//  Abound
//
//  Created by Hansy Schmitt on 7/4/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    var currentType: DocumentType
    var accessToken: String
    var theme: AboundTheme
    var year: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func getHTML() -> String{
        if currentType == DocumentType.taxDocument{
            return String(format: taxDocumentHTML, arguments: [accessToken,theme.toHtml(),year])
        }else{
            return String(format: taxProfileHTML, arguments: [accessToken,theme.toHtml(),year])
        }
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let domain = URL(string: "https://api.withabound.com")!
        webView.loadHTMLString(getHTML(), baseURL: domain)
    }
}