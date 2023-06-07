import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    let url : String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = url {
            if let url = URL(string: safeUrl) {
                uiView.load(URLRequest(url: url))
            }
        }
    }
}
