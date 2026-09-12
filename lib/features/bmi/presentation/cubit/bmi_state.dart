import 'package:equatable/equatable.dart';
import 'package:bmi_aug/features/bmi/data/models/bmi_model.dart';

abstract class BmiState extends Equatable {
  const BmiState();

  @override
  List<Object?> get props => [];
}

class BmiInitial extends BmiState {}

class BmiLoading extends BmiState {}

class BmiSuccess extends BmiState {
  final BmiResponse bmiResponse;
  const BmiSuccess(this.bmiResponse);

  @override
  List<Object?> get props => [bmiResponse];
}

class BmiError extends BmiState {
  final String message;
  const BmiError(this.message);

  @override
  List<Object?> get props => [message];
}
