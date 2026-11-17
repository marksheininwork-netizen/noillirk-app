import SwiftUI
import WebKit
import UIKit

struct ContentView: View {
    var body: some View {
        GameWebView()
            .ignoresSafeArea(edges: .bottom)
    }
}

private struct GameWebView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.websiteDataStore = .default()
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        webView.isOpaque = false
        webView.backgroundColor = UIColor(red: 0.965, green: 0.969, blue: 0.988, alpha: 1)
        webView.scrollView.contentInsetAdjustmentBehavior = .never

        if let webRoot = Bundle.main.resourceURL?.appendingPathComponent("Web", isDirectory: true),
           let entry = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "Web") {
            webView.loadFileURL(entry, allowingReadAccessTo: webRoot)
        } else {
            webView.loadHTMLString("<main style='font:17px -apple-system;padding:32px'><h1>Noillirk</h1><p>The game files could not be loaded. Please reinstall the app.</p></main>", baseURL: nil)
        }
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {}

    final class Coordinator: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if navigationAction.request.url?.scheme == "mailto" {
                if let url = navigationAction.request.url {
                    UIApplication.shared.open(url)
                }
                decisionHandler(.cancel)
            } else {
                decisionHandler(.allow)
            }
        }
    }
}
