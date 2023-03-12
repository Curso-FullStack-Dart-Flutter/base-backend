import '../../models/push.dart';

abstract class PushService {
  Future<List<Push>> getAllPushs();

  Future<bool> savePush(Push push);
}
