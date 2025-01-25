class AuthRepository with AppLogger {
  AuthRepository(this._dioClient);

  final DioClient _dioClient;

  Future<(AppError?, String?)> login({
    required String emailID,
    required String password,
  }) async {
    return (null, null);
    // const url = '$apiVersion1/doctor/login';
    // try {
    //   final responseData = await _dioClient.post(
    //     url,
    //     data: json.encode({
    //       'emailId': emailID,
    //       'password': password,
    //     }),
    //   );

    //   final token = responseData['data']['token'] as String;
    //   _dioClient.updateAccessToken(token: token);
    //   return (null, token);
    // } on NetworkException catch (e, stackTrace) {
    //   log.severe('NetworkException: $e', e, stackTrace);
    //   return (AppError.fromStatusCode(e.statusCode, e.message), null);
    // } catch (e, stackTrace) {
    //   log.severe('Exception: $e', e, stackTrace);
    //   return (const AppError(AppErrorType.unknown, 'Unknown error'), null);
    // }
  }
}
