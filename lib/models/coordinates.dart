class Coordinates {
  /// Create a coordinates informing [x] and [y].
  /// [x] represents the horizontal position;
  /// [y] represents the vertical position;
  final int x; // Horizontal
  final int y; // Vertical

  const Coordinates({required this.x, required this.y});

  @override
  String toString() {
    return 'Coordinates{x: $x, y: $y}';
  }
}
