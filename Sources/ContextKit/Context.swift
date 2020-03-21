
import Foundation

public struct Context {
    public class AnyKey: NSObject {
        fileprivate override init() {
            super.init()
        }
    }
    
    public final class Key<T>: AnyKey {
        override init() {
            super.init()
        }
    }
    
    fileprivate let dictionary: [AnyKey : Any]
    
    fileprivate init(dictionary: [AnyKey : Any]) {
        self.dictionary = dictionary
    }
    
    public subscript<T>(key: Key<T>) -> T {
        guard let value = dictionary[key] else { fatalError("Key not populated") }
        guard let casted = value as? T else { fatalError("Value in key does not match type") }
        return casted
    }
}

extension Context {
    
    public static let empty = Context(dictionary: [:])
    
}

extension Context: ContextProtocol {
    
    public func merge(with context: Context) -> Context {
        return Context(dictionary: context.dictionary.merging(dictionary) { $1 })
    }
    
}

extension ContextKeyAssignment {
    
    public func merge(with context: Context) -> Context {
        return Context(dictionary: context.dictionary.merging([key : value]) { $1 })
    }
    
}
