
import Foundation

public class ContextKeyPaths {
    static let factory = ContextKeyPaths()

    private var keys = [KeyPath<ContextKeyPaths, Context.AnyKey> : Context.AnyKey]()

    func key<T>(for keyPath: KeyPath<ContextKeyPaths, Context.Key<T>>) -> Context.Key<T> {
        let castedKeyPath = keyPath.appending(path: \.any)
        guard let key = keys[castedKeyPath] else {
            let key = self[keyPath: keyPath]
            keys[castedKeyPath] = key
            return key
        }
        return key as! Context.Key<T>
    }

    private init() { }
}

extension Context.Key {

    fileprivate var any: Context.AnyKey {
        return self
    }

}
