import Foundation

public final class TuistSampleKit {
    public static func hello() {
        print("Hello, from your Kit framework")
        
#if DEBUG
        print("DEBUG")
#elseif RELEASE
        print("RELEASE")
#endif
    }
}
