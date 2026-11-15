import SwiftUI
import WebKit

// Set to a real HTTPS address when the web game is ready.
private enum Website {
    static let urlString = ""
}

struct ContentView: View {
    private var websiteURL: URL? {
        guard let url = URL(string: Website.urlString),
              url.scheme?.lowercased() == "https",
              url.host != nil else { return nil }
        return url
    }

    var body: some View {
        Group {
            if let url = websiteURL {
                GameWebView(url: url)
                    .ignoresSafeArea(edges: .bottom)
            } else {
                VStack(spacing: 16) {
                    Image(systemName: "gamecontroller.fill")
                        .font(.system(size: 64))
                        .foregroundColor(.accentColor)
                    Text("Noillirk")
                        .font(.largeTitle.bold())
                    Text("Coming soon")
                        .font(.title2)
                    Text("This is an iOS starter. Game content will be added later.")
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

private struct GameWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView(frame: .zero)
        view.load(URLRequest(url: url))
        return view
    }

    func updateUIView(_ view: WKWebView, context: Context) {}
}
