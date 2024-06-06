import 'dart:convert';

ExchangeRateDto exchangeRateDtoFromJson(String str) =>
    ExchangeRateDto.fromJson(json.decode(str) as Map<String, dynamic>);

class ExchangeRateDto {
  final String time;
  final String assetIdBase;
  final String assetIdQuote;
  final double rate;

  ExchangeRateDto({
    required this.time,
    required this.assetIdBase,
    required this.assetIdQuote,
    required this.rate,
  });

  factory ExchangeRateDto.fromJson(Map<String, dynamic> json) {
    return ExchangeRateDto(
      time: json['time'],
      assetIdBase: json['asset_id_base'],
      assetIdQuote: json['asset_id_quote'],
      rate: json['rate'],
    );
  }
}
