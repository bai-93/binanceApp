import 'base_alerts.dart';

enum AlertTypes {
  successAlert,
  errorAlert,
  somethingWrongAlert;

  BaseAlerts alertWidget(BaseAlertsDTO dto) {
    switch (this) {
      case AlertTypes.successAlert:
        return SuccessAlert(dto: dto);
      case AlertTypes.errorAlert:
        return SuccessAlert(dto: dto);
      case AlertTypes.somethingWrongAlert:
        return SuccessAlert(dto: dto);
      default:
    }
    return SuccessAlert(dto: dto);
  }
}
