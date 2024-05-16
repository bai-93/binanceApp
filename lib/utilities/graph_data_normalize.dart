import '../domain/models/responses/crypto_models/crypto_history_price_model.dart';

class GraphDataNormalizeUtility {
  static List<double> normalizeData(CryptoHistoryPriceListModel input) {
    int startIndex = input.data.length - 15;
    int endIndex = input.data.length;
    List<CryptoHistoryPriceModel> dataPrices = input.data
        .getRange(startIndex, endIndex)
        .toList(); // because I don't need large data
    List<double> convertedPriceData =
        dataPrices.map((e) => double.parse(e.priceUsd)).toList();
    double maxPrice = convertedPriceData
        .reduce((value, element) => value > element ? value : element);
    List<double> differenceBetweenPrices =
        convertedPriceData.map((e) => maxPrice - e).toList();
    double maxValueAfterDifferencePrice = differenceBetweenPrices
        .reduce((value, element) => value > element ? value : element);

    List<double> output = differenceBetweenPrices.map((e) {
      if (e == 0.0) {
        return 0.0;
      } else if (e == maxValueAfterDifferencePrice) {
        return 0.9;
      } else {
        return (e / maxValueAfterDifferencePrice - 0.1).abs();
      }
    }).toList();
    return output;
  }
}
