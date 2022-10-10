class ApiReturnValue<T> {
  T? data;
  String message;
  bool success;
  int statusCode;
  ApiReturnValue(
      {this.data,
      required this.message,
      required this.statusCode,
      required this.success});

  // ApiReturnValue<T> copyWith({
  //   T? data,
  //   String? message,
  //   bool? success,
  //   int? statusCode,
  // }) =>
  //     ApiReturnValue(
  //       message: message ?? this.message,
  //       statusCode: statusCode ?? this.statusCode,
  //       success: success ?? this.success,
  //     );
}
