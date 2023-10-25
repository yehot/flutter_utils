import 'package:logger/logger.dart' show Logger, PrettyPrinter;

var logger = Logger(
  printer: PrettyPrinter(),
);

void loggerD(dynamic msg) => logger.d(msg);
