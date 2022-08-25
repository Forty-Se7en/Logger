import 'dart:io';

import 'package:logger/src/MessageType.dart';

class Logger {
  late final File _logFile;
  bool logDate;
  bool logTime;
  //String prefix = '';

  Logger({
    required String fileName,
    this.logDate = false,
    this.logTime = true,
  }) {
    DateTime now = DateTime.now().toLocal();
    _logFile = File('${fileName}_${now.day}.${now.month}.${now.year}.log');
    if (!_logFile.existsSync()) {
      _logFile.createSync(recursive: true);
    }
  }

  void log({required String message, String prefix = ''}) {
    DateTime now = DateTime.now().toLocal();
    String date = logDate ? '(${now.day}.${now.month}.${now.year})' : '';
    String time = logTime ? '(${now.hour}:${now.minute}:${now.second})' : '';
    var text = '${'$date$time $prefix $message'.trim()}\n';
    print(text);
    if (!_logFile.existsSync()) {
      _logFile.createSync(recursive: true);
    }
    _logFile.writeAsStringSync(text, mode: FileMode.append);
  }

  void error({required String message}) {
    log(message: message, prefix: MessageType.error.stringValue);
  }

  void warning({required String message}) {
    log(message: message, prefix: MessageType.warning.stringValue);
  }

  void success({required String message}) {
    log(message: message, prefix: MessageType.success.stringValue);
  }

  void info({required String message}) {
    log(message: message, prefix: MessageType.info.stringValue);
  }
}
