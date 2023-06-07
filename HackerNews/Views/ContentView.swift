import SwiftUI

struct ContentView: View {
    
   @ObservedObject var posts = Posts()
    
    var body: some View {
        VStack {
            NavigationView {
                List(posts.postDetails) { post in
                    NavigationLink(destination: PostDetailsView(url: post.url)) {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    }
                }
                .onAppear {
                    UITableView.appearance().isScrollEnabled = false
                }
                .navigationTitle("Hacker News")
            }
            .onAppear(perform: posts.fetchData)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
