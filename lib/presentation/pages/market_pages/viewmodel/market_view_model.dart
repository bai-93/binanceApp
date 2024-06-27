class MarketViewModel {
  List<String> _historyOfSearch = [];

  void clear() {
    _historyOfSearch.clear();
  }

  void addToHistory(String input) {
    if (!_historyOfSearch.contains(input)) {
      _historyOfSearch.insert(0, input);
    }
  }

  List<String> getHistoryData() {
    return _historyOfSearch;
  }
}
