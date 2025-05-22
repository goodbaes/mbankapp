import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mbankapp/core/error/api_exception.dart';
import 'package:mbankapp/core/utils/date_helper.dart';

class ApiDatasource {
  ApiDatasource({
    required this.baseUrl,
    http.Client? client,
  }) : client = client ?? http.Client();
  final String baseUrl;
  final http.Client client;

  Future<List<Map<String, dynamic>>> fetchEvents(
    DateTime startDate, {
    DateTime? endDate,
  }) async {
    final effectiveEndDate = endDate ?? DateTime.now();

    if (!DateHelper.isValidRange(startDate, effectiveEndDate)) {
      throw ApiException('Date range must be exactly 7 days');
    }

    final endDateString = endDate != null
        ? '&end_date=${DateHelper.format(
            endDate,
          )}'
        : '';

    log(endDate.toString());

    final response = await client.get(
      Uri.parse(
        '$baseUrl/api/test-task?start_date=${DateHelper.format(startDate)}$endDateString',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.cast<Map<String, dynamic>>();
    } else {
      log('Failed to fetch events: ${response.body}');
      throw ApiException(
        'Failed to fetch events',
        statusCode: response.statusCode,
      );
    }
  }
}
