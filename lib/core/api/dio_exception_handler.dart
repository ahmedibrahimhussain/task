import 'package:dio/dio.dart';

String dioExceptionHandler(DioException error) {
  if (error.type == DioExceptionType.connectionTimeout) {
    return 'انتهت مهلة الاتصال';
  } else if (error.type == DioExceptionType.receiveTimeout) {
    return 'انتهت مهلة الاستقبال';
  } else if (error.type == DioExceptionType.sendTimeout) {
    return 'انتهت مهلة الإرسال';
  } else if (error.type == DioExceptionType.cancel) {
    return 'تم الإغلاق';
  } else if (error.type == DioExceptionType.badCertificate) {
    return 'حدث خطأ';
  } else if (error.type == DioExceptionType.badResponse) {
    return apiHandler(error);
  } else if (error.type == DioExceptionType.unknown) {
    return 'خطأ غير معروف';
  } else if (error.type == DioExceptionType.connectionError) {
    return 'تفقد اتصالك بالانترنت';
  } else {
    return 'حدث خطأ';
  }
}

String apiHandler(DioException error) {
  if (error.response != null &&
      (error.response!.data['message']).toString().startsWith('JWT')) {
    return 'برجاء تسجيل الدخول مرة اخري';
  } else if (error.response != null &&
      (error.response!.data['message']).toString().startsWith('Token')) {
    return 'برجاء تسجيل الدخول مرة اخري';
  } else {
    return error.response?.data['message'] ?? 'Bad Response';
  }
}
