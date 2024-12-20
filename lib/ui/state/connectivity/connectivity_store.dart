import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_store.g.dart';

enum ConnectivityStatuses { waiting, connected, disconnected }

class ConnectivityStore = ConnectivityStoreBase with _$ConnectivityStore;

abstract class ConnectivityStoreBase with Store {
  ConnectivityStoreBase({
    required Connectivity connectivity,
  }) : _connectivity = connectivity {
    _listenConnection();
  }

  final Connectivity _connectivity;

  @observable
  ConnectivityStatuses status = ConnectivityStatuses.waiting;

  @action
  void connected() {
    status = ConnectivityStatuses.connected;
  }

  @action
  void disconnected() {
    status = ConnectivityStatuses.disconnected;
  }

  void _setConnection(bool hasConnection) {
    if (hasConnection) {
      return connected();
    }
    return disconnected();
  }

  void _listenConnection() {
    _connectivity.onConnectivityChanged.map((state) {
      return state.contains(ConnectivityResult.wifi) ||
          state.contains(ConnectivityResult.ethernet);
    }).listen(_setConnection);
  }
}
