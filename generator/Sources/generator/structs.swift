struct Layout {
  var author: String
  var layoutName: String
  var layoutID: Int

  var keys: [Key]
  var actions: [Action]
  var terminators: [When]
}

// MARK: - Key
struct Key {
  var code: Int
  var `default`: Do
  var shift: Do
  var caps: Do
  var opt: Do?
  var shiftOpt: Do?
  var ctrl: Do?
}

extension Key {
  init(_ code: Int, _ `default`: Do, shift: Do, caps: Do, opt: Do?, shiftOpt: Do?, ctrl: Do?) {
    self.code = code
    self.default = `default`
    self.shift = shift
    self.caps = caps
    self.opt = opt
    self.shiftOpt = shiftOpt
    self.ctrl = ctrl
  }

  static func all(_ code: Int, _ do: Do) -> Key {
    Key(code, `do`, shift: `do`, caps: `do`, opt: `do`, shiftOpt: `do`, ctrl: `do`)
  }
}

enum Do {
  case action(Int)
  case output(Character)
}

extension Do: ExpressibleByExtendedGraphemeClusterLiteral {
  init(extendedGraphemeClusterLiteral value: Character) {
    self = .output(value)
  }
}

// MARK: - Action
struct Action {
  var id: Int
  var body = [When]()

  init(_ id: Int, _ body: [When]) {
    self.id = id
    self.body = body
  }
}

enum When {
  case next(state: Int?, Int)
  case output(state: Int?, Character)

  var state: Int? {
    switch self {
    case .next(let c, _), .output(let c, _):
      return c
    }
  }
}
