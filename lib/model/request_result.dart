/// <BaseRespR<T> 返回 status code msg data Response.
class Result<T> {
  int code;
  String message;
  T result;

  Result(this.code, this.message, this.result);

  Result.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'],
        result = json['result'];

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write(",\"code\":$code");
    sb.write(",\"msg\":\"$message\"");
    sb.write(",\"data\":\"$result\"");
    sb.write('}');
    return sb.toString();
  }
}