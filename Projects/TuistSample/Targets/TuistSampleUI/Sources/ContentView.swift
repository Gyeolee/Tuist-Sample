import SwiftUI
import TuistSampleKit
import Resources

public struct ContentView: View {
    public init() {}

    public var body: some View {
        Text("Hello, World!")
            .font(.pretendardBold(size: 14))
            .padding()
            .onAppear(perform: TuistSampleKit.hello)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
