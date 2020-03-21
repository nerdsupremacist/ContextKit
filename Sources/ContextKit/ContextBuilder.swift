
import Foundation

@_functionBuilder
public struct ContextBuilder {

    public static func buildBlock() -> ContextProtocol {
        return Context.empty
    }
    
    public static func buildBlock(_ context: ContextProtocol) -> ContextProtocol {
        return context
    }
    
    public static func buildBlock(_ context: ContextProtocol...) -> ContextProtocol {
        return context.map { AnyContextProtocol(context: $0) }
    }
    
}

extension Context {
    
    public init(@ContextBuilder context: () throws -> ContextProtocol) rethrows {
        self = try context().merge(with: .empty)
    }
    
}
