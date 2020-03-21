
import Foundation

public protocol ContextProtocol {
    func merge(with context: Context) -> Context
}

public func + (lhs: ContextProtocol, rhs: ContextProtocol) -> Context {
    return Context {
        lhs
        rhs
    }
}
