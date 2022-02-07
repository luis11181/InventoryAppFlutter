abstract class ScanPageState {}

class ScanPageCameraOffState extends ScanPageState {}

class ScanPageScanning extends ScanPageState {}

class ScanPageCodeScanned extends ScanPageState {
  final String code;
  ScanPageCodeScanned(this.code);
}
