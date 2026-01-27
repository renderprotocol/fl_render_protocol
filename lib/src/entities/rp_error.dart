enum RPError implements Exception {
  notInitialized
  ;

  @override
  String toString() {
    switch (this) {
      case .notInitialized:
        return "RenderProtocol not initialized, call `RenderProtocol.initialize(with:)` first.";
    }
  }
}
