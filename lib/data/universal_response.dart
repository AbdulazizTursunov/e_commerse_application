class UniversalResponse {
  final String error;
  final dynamic data;
  final int statusCode;

  UniversalResponse({this.error = '', this.data, this.statusCode = 0});
}
