
extension Character {
  var xmlValue: String {
    "&#x\(String.init(self.utf8.first!, radix: 16, uppercase: true));"
  }
}

extension Array where Element == Key {
  func generateKeys(for path: KeyPath<Key, Do>) -> String {
    self
      .sorted(by:) { $0.code < $1.code }
      .map { key -> String in
        switch key[keyPath: path] {
        case .output(let char):
          return #"<key code="\#(key.code)" output="\#(char.xmlValue)"/>"#
        case .action(let id):
          return #"<key code="\#(key.code)" action="\#(id)"/>"#
        }
      }
      .joined(separator: "\n      ")
  }
}

extension Array where Element == Action {
  func generateActions() -> String {
    self
      .sorted(by:) { $0.id < $1.id }
      .map { action -> String in
        """
        <action id="\(action.id)">
              \(action.body.generateWhens())
            </action>
        """
      }
      .joined(separator: "\n    ")
  }
}

extension Array where Element == When {
  func generateWhens() -> String {
    self
      .sorted(by:) {
        guard let s0 = $0.state else { return true }
        guard let s1 = $1.state else { return false }
        return s0 < s1
      }
      .map { action -> String in
        switch action {
        case let .next(.none, next):
          return #"<when state="none" next="\#(next)"/>"#
        case let .next(.some(state), next):
          return #"<when state="\#(state)" next="\#(next)"/>"#
        case let .output(.none, out):
          return #"<when state="none" output="\#(out)"/>"#
        case let .output(.some(state), out):
          return #"<when state="\#(state)" output="\#(out)"/>"#
        }
      }
      .joined(separator: "\n      ")
  }
}
