func dispatch_main_async(block: dispatch_block_t) {
    dispatch_async(dispatch_get_main_queue(), block)
}

infix operator >>- { associativity left precedence 150 }

func >>-<A, B>(a: A?, f: A -> B?) -> B? {
    switch a {
    case let .Some(x): return f(x)
    default: return .None
    }
}
