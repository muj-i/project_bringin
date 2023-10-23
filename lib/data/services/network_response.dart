class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final dynamic responseBody;

  NetworkResponse(this.isSuccess, this.statusCode, this.responseBody);
}
