
import Foundation

struct AnyContextProtocol: ContextProtocol {
    let _merge: (Context) -> Context
    
    init(context: ContextProtocol) {
        _merge = context.merge
    }
    
    func merge(with context: Context) -> Context {
        return _merge(context)
    }
}
