
enum Organizations {
  individual(2),
  company(3),
  government(4);

  const Organizations(this.value);
  final int value;
}
enum MessageType {
  Error,
  Success
}


