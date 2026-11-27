/// How a script loads: the part of its attributes that is identity, not
/// delivery. Scripts may share a file only when they load the same way.
public struct JSScriptLoading:
    Sendable,
    Hashable
{
    public var kind: JSScriptKind
    public var defer_loading: Bool
    public var async_loading: Bool

    public init(
        kind: JSScriptKind = .classic,
        defer_loading: Bool = false,
        async_loading: Bool = false
    ) {
        self.kind = kind
        self.defer_loading = defer_loading
        self.async_loading = async_loading
    }

    /// The attributes a file delivering scripts of this loading carries.
    public var attributes: JSScriptAttributes {
        .init(
            kind: kind,
            defer_loading: defer_loading,
            async_loading: async_loading
        )
    }
}

public extension JSScriptAttributes {
    var loading: JSScriptLoading {
        .init(
            kind: kind,
            defer_loading: defer_loading,
            async_loading: async_loading
        )
    }
}

public extension JSScript {
    var attributes: JSScriptAttributes {
        switch self {
        case .inline(_, let attributes),
             .external(_, let attributes):
            return attributes
        }
    }

    var loading: JSScriptLoading {
        attributes.loading
    }

    /// Authored source, when the script is written inline.
    var source: JSSource? {
        guard case .inline(let source, _) = self else {
            return nil
        }
        return source
    }
}
