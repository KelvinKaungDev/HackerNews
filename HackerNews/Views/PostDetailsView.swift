import SwiftUI

struct PostDetailsView: View {
    
    let url : String?
    
    var body: some View {
        WebView(url: url)
    }
}

struct PostDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailsView(url: "www.google.com")
    }
}
