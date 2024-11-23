import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final String? statusCode;
  final String? message;
  final String? description;

  ErrorModel({
    this.statusCode,
    this.message,
    this.description,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      statusCode: json['statusCode'] as String?,
      message: json['message'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (statusCode != null) 'statusCode': statusCode,
      if (message != null) 'message': message,
      if (description != null) 'description': description,
    };
  }

  @override
  List<Object?> get props => [statusCode, message, description];
}
