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

infix operator <^> { associativity left }

func <^><A, B>(f: A -> B, a: A?) -> B? {
    switch a {
    case .Some(let x): return f(x)
    case .None: return .None
    }
}

infix operator <*> { associativity left }

func <*><A, B>(f: (A -> B)?, a: A?) -> B? {
    switch a {
    case .Some(let x):
        if let fx = f {
            return fx(x)
        }
        fallthrough
    case .None: return .None
    }
}