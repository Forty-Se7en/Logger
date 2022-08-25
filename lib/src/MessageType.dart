enum MessageType {
  error('[\u00D7]'), // ×
  warning('[\u203C]'), // ‼
  success('[\u2713]'), // ✓
  info('[\u00ED]'); // í

  const MessageType(this.stringValue);

  final String stringValue;
}
