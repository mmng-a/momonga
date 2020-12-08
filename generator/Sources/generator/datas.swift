let layout = Layout(
  author: "Masashi Aso",
  layoutName: "generated",
  layoutID: -5670,
  keys: [
    Key.all(36,  "\u{000D}"), // return
    Key.all(48,  "\u{0009}"), // tab
    Key.all(49,  " "       ), // space
    Key.all(51,  "\u{0008}"), // back space
    Key.all(53,  "\u{001B}"), // ESC
    Key.all(123, "\u{001C}"), // arrows
    Key.all(124, "\u{001D}"),
    Key.all(125, "\u{001F}"),
    Key.all(126, "\u{001E}"),
    // JIS
    Key.all(102, "\u{0010}"), // eisu
    Key.all(104, "\u{0010}"), // kana

    Key.all(122, "\u{0010}"), // fnctions
    Key.all(120, "\u{0010}"),
    Key.all( 99, "\u{0010}"),
    Key.all(118, "\u{0010}"),
    Key.all( 96, "\u{0010}"),
    Key.all( 97, "\u{0010}"),
    Key.all( 98, "\u{0010}"),
    Key.all(100, "\u{0010}"),
    Key.all(101, "\u{0010}"),
    Key.all(109, "\u{0010}"),
    Key.all(103, "\u{0010}"),
    Key.all(111, "\u{0010}"),

    Key(18, "1", shift: "!", caps: "1", opt: .action(0), shiftOpt: nil, ctrl: nil),
    Key(19, "2", shift: "@", caps: "2", opt: .action(1), shiftOpt: nil, ctrl: nil),
    Key(20, "3", shift: "#", caps: "3", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(21, "4", shift: "$", caps: "4", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(23, "5", shift: "%", caps: "5", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(22, "6", shift: "^", caps: "6", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(26, "7", shift: "&", caps: "7", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(28, "8", shift: "*", caps: "8", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(25, "9", shift: "(", caps: "9", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(29, "0", shift: ")", caps: "0", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(27, "|", shift: "\\", caps: "|", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(24, "`", shift: "~", caps: "`", opt: nil, shiftOpt: nil, ctrl: nil),
    // ANSI: 50, JIS: 94
    Key(50, "'", shift: "\"", caps: "'", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(94, "'", shift: "\"", caps: "'", opt: nil, shiftOpt: nil, ctrl: nil),

    Key(12, "q", shift: "Q", caps: "Q", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(13, "w", shift: "W", caps: "W", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(14, "o", shift: "O", caps: "O", opt: nil, shiftOpt: nil, ctrl: "\u{000F}"), // open line
    Key(15, "u", shift: "U", caps: "U", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(17, ",", shift: "<", caps: ",", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(16, "=", shift: "+", caps: "=", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(32, "h", shift: "H", caps: "H", opt: nil, shiftOpt: nil, ctrl: "\u{0002}"), // backward
    Key(34, "j", shift: "J", caps: "J", opt: nil, shiftOpt: nil, ctrl: "\u{001E}"), // "\u{0010}"), // previous line
    Key(31, "k", shift: "K", caps: "K", opt: nil, shiftOpt: nil, ctrl: "\u{000E}"), // next line
    Key(35, "l", shift: "L", caps: "L", opt: nil, shiftOpt: nil, ctrl: "\u{0006}"), // forward
    Key(33, "[", shift: "{", caps: "[", opt: nil, shiftOpt: nil, ctrl: "\u{001B}"), // escape
    Key(30, "]", shift: "}", caps: "]", opt: nil, shiftOpt: nil, ctrl: nil),

    Key(0,  "y", shift: "Y", caps: "Y", opt: nil, shiftOpt: nil, ctrl: "\u{0019}"), // yank
    Key(1,  "i", shift: "I", caps: "I", opt: nil, shiftOpt: nil, ctrl: "\u{0009}"), // tab
    Key(2,  "e", shift: "E", caps: "E", opt: nil, shiftOpt: nil, ctrl: "\u{0005}"), // end of line
    Key(3,  "a", shift: "A", caps: "A", opt: nil, shiftOpt: nil, ctrl: "\u{0001}"), // ahead of line
    Key(5,  ".", shift: ">", caps: ".", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(4,  "d", shift: "D", caps: "D", opt: nil, shiftOpt: nil, ctrl: "\u{0004}"), // delete
    Key(38, "n", shift: "N", caps: "N", opt: nil, shiftOpt: nil, ctrl: "\u{000D}"), // M, new line
    Key(40, "s", shift: "S", caps: "S", opt: nil, shiftOpt: nil, ctrl: "\u{0008}"), // H, back space
    Key(37, "t", shift: "T", caps: "T", opt: nil, shiftOpt: nil, ctrl: "\u{0014}"), // transport
    Key(41, "g", shift: "G", caps: "G", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(39, "-", shift: "_", caps: "-", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(42, "/", shift: "?", caps: "/", opt: nil, shiftOpt: nil, ctrl: nil),

    Key(6,  "z", shift: "Z", caps: "Z", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(7,  "x", shift: "X", caps: "X", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(8,  "c", shift: "C", caps: "C", opt: nil, shiftOpt: nil, ctrl: "\u{0003}"),
    Key(9,  "v", shift: "V", caps: "V", opt: nil, shiftOpt: nil, ctrl: "\u{0010}"), // 英数（多分できない）
    Key(11, ":", shift: ";", caps: ":", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(45, "m", shift: "M", caps: "M", opt: nil, shiftOpt: nil, ctrl: "\u{0010}"), // かな（多分できない）
    Key(46, "r", shift: "R", caps: "R", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(43, "f", shift: "F", caps: "F", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(47, "p", shift: "P", caps: "P", opt: nil, shiftOpt: nil, ctrl: nil),
    Key(44, "b", shift: "B", caps: "B", opt: nil, shiftOpt: nil, ctrl: nil),
  ],
  actions: [
    Action(0, [When.next(state: nil, 1),
               When.output(state: 1, "⌘"),]),
    Action(1, [When.output(state: nil, "¡")]),
  ],
  terminators: [
    When.output(state: 1, ""),
  ]
)
