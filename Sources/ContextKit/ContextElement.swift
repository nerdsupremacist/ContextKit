
import Foundation

public protocol ContextElement: ContextProtocol {
    static var key: Context.Key<Self> { get }
}

extension ContextElement {
    
    public func merge(with context: Context) -> Context {
        return (Self.key ~> self).merge(with: context)
    }
    
}

extension Context {

    public subscript<T: ContextElement>(type: T.Type) -> T? {
        return self[type.key]
    }

    public func forced<T: ContextElement>(for type: T.Type = T.self) -> T {
        return forced(type.key)
    }

}
