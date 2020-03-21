
import Foundation

public class MutableContext {
    var context: Context

    public init(context: Context = .empty) {
        self.context = context
    }

    public convenience init(@ContextBuilder context: () throws -> ContextProtocol) rethrows {
        self.init(context: try Context(context: context))
    }

    public subscript<T>(key: Context.Key<T>) -> T {
        get {
            return context[key]
        }
        set {
            push {
                key ~> newValue
            }
        }
    }

    public func push(@ContextBuilder context: () throws -> ContextProtocol) rethrows {
        self.context = try context().merge(with: self.context)
    }
}
