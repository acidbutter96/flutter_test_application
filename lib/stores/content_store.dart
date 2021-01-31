import 'package:mobx/mobx.dart';
part 'content_store.g.dart';

class ContentStore = _ContentStore with _$ContentStore;

abstract class _ContentStore with Store {
  @observable
  String noticias = '';
}
