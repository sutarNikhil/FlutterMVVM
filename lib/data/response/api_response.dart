import 'Status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.success() : status = Status.SUCCESS;
  ApiResponse.failure() : status = Status.ERROR;

  @override
  String toString() {
    return '$status: $message \n $data';
  }
}
