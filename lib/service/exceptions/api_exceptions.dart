import '../../utils/app_exception.dart';

class CardNotFoundException extends AppException {
  const CardNotFoundException({
    super.message = 'Card not found',
    super.stacktrace,
  });
}
