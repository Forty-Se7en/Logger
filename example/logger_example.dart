import 'package:logger/logger.dart';

void main() {
  var logger = Logger(fileName: 'LOGS\\logs_example');

  logger.log(message: 'Start logging');
  logger.error(message: 'Some error');
  logger.warning(message: 'Some warning');
  logger.success(message: 'Some success');
  logger.info(message: 'Some important info');

  logger.logDate = false;
  logger.logTime = false;
  logger.log(message: 'Log without date and time');

  logger.logDate = true;
  logger.logTime = true;
  logger.log(message: 'Log with date and time');
}
