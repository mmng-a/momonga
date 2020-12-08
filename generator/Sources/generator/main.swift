import Foundation

var data: String = try {
  let path = Bundle.module.path(forResource: "base", ofType: "keylayout")!
  let data = try Data(contentsOf: URL(fileURLWithPath: path))
  return String(data: data, encoding: .utf8)!
}()

let date: String = {
  let formatter = DateFormatter()
  formatter.dateFormat = "yyyy/MM/dd hh:mm z"
  return formatter.string(from: Date())
}()

data = data
  .replacingOccurrences(of: "[[generated_date]]", with: date)
  .replacingOccurrences(of: "[[author_name]]", with: layout.author)
  .replacingOccurrences(of: "[[layout_name]]", with: layout.layoutName)
  .replacingOccurrences(of: "[[layout_id]]", with: "\(layout.layoutID)")
  .replacingOccurrences(
    of: #"<keyMap index="0"></keyMap>"#,
    with: """
    <keyMap index="0">
          \(layout.keys.generateKeys(for: \.default))
        </keyMap>
    """
  )
  .replacingOccurrences(
    of: #"<keyMap index="1"></keyMap>"#,
    with: """
    <keyMap index="1">
          \(layout.keys.generateKeys(for: \.shift))
        </keyMap>
    """
  )
  .replacingOccurrences(
    of: #"<keyMap index="2"></keyMap>"#,
    with: """
    <keyMap index="2">
          \(layout.keys.generateKeys(for: \.caps))
        </keyMap>
    """
  )
  .replacingOccurrences(
    of: #"<keyMap index="3"></keyMap>"#,
    with: """
    <keyMap index="3">
          \(layout.keys.filter({ $0.opt != nil }).generateKeys(for: \.opt!))
        </keyMap>
    """
  )
  .replacingOccurrences(
    of: #"<keyMap index="4"></keyMap>"#,
    with: """
    <keyMap index="4">
          \(layout.keys.filter({ $0.shiftOpt != nil }).generateKeys(for: \.shiftOpt!))
        </keyMap>
    """
  )
  .replacingOccurrences(
    of: #"<keyMap index="5"></keyMap>"#,
    with: """
    <keyMap index="5">
          <key code="0" output=" "/>
        </keyMap>
    """
  )
  .replacingOccurrences(
    of: #"<keyMap index="6"></keyMap>"#,
    with: """
    <keyMap index="6">
          <key code="0" output=" "/>
        </keyMap>
    """
  )
  .replacingOccurrences(
    of: #"<keyMap index="7"></keyMap>"#,
    with: """
    <keyMap index="7">
          \(layout.keys.filter({ $0.ctrl != nil }).generateKeys(for: \.ctrl!))
        </keyMap>
    """
  )
  .replacingOccurrences(
    of: #"<actions></actions>"#,
    with: """
    <actions>
        \(layout.actions.generateActions())
      </actions>
    """
  )
  .replacingOccurrences(
    of: #"<terminators></terminators>"#,
    with: """
    <terminators>
        \(layout.terminators.generateWhens())
      </terminators>
    """
  )


print(data)
