import '../log_bloc.dart';
import '../log_level.dart';
import '../log_message.dart';

class MailService {
  final LogBloc logBloc;

  MailService(this.logBloc);

  void sendErrorMail(LogLevel logLevel, String message) {
    final logMessage = LogMessage(logLevel: logLevel, message: message);
    /// Suppose here we want send email with error message
    ///
    ///
    logBloc.log(logMessage);
  }
}