abstract interface class RPRegisterable {
  String get id;
  Future<void> didRegister();
  Future<void> willUnregister();
}
