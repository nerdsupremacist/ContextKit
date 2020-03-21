
import Foundation

extension Array: ContextProtocol where Element: ContextProtocol {
    
    public func merge(with context: Context) -> Context {
        return reduce(context) { $1.merge(with: $0) }
    }
    
}
