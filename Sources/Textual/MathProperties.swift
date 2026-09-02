import SwiftUI
private import SwiftUIMath

/// Properties that control how Textual renders math expressions.
public struct MathProperties: Sendable, Hashable {
  public struct FontName: Hashable, Sendable, RawRepresentable, ExpressibleByStringLiteral {
    public let rawValue: String

    public init(rawValue: String) {
      self.rawValue = rawValue
    }

    public init(stringLiteral value: StringLiteralType) {
      self.rawValue = value
    }
  }

  /// The math font family to use.
  public var fontName: FontName

  /// Scales the math font relative to the surrounding text.
  public var fontScale: CGFloat

  /// The alignment applied to block math paragraphs.
  public var textAlignment: TextAlignment

  public init(
    fontName: FontName = .latinModern,
    fontScale: CGFloat = 1.2,
    textAlignment: TextAlignment = .center
  ) {
    self.fontName = fontName
    self.fontScale = fontScale
    self.textAlignment = textAlignment
  }
}

extension MathProperties.FontName {
  public static let latinModern: Self = .init(rawValue: Math.Font.Name.latinModern.rawValue)
}

extension EnvironmentValues {
  @Entry var mathProperties = MathProperties()
}
