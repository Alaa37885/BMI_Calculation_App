import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:bmi_aug/core/constants/api_constants.dart';
import 'package:bmi_aug/features/bmi/data/models/bmi_model.dart';
import 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  final Dio dio;

  BmiCubit(this.dio) : super(BmiInitial());

  Future<void> calculateBmi({
    required String name,
    required String birthDate,
    required String gender,
    required int height,
    required int weight,
  }) async {
    emit(BmiLoading());

    try {
      final response = await dio.get(
        "${ApiConstants.baseUrl}${ApiConstants.bmiEndpoint}",
        queryParameters: {
          "weight": weight,
          "height": height,
          "unit": "metric",
        },
        options: Options(
          headers: {
            "x-api-key": ApiConstants.apiKey,
          },
        ),
      );

      if (response.data != null) {
        var data = response.data;
        data['name'] = name;
        data['birthDate'] = birthDate;
        data['gender'] = gender;
        
        final bmiResponse = BmiResponse.fromJson(data);
        emit(BmiSuccess(bmiResponse));
      } else {
        emit(const BmiError("No data received from server"));
      }
    } catch (e) {
      emit(BmiError(e.toString()));
    }
  }
}
