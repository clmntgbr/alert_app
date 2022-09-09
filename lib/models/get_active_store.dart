import 'dart:convert';

ActiveStore activeStoreFromJson(String str) => ActiveStore.fromJson(json.decode(str));

class ActiveStore {
  String context;
  String contextId;
  String contextType;
  int id;
  String name;
  bool isActive;
  int itemsInStore;
  int itemsExpiredInStore;
  int maxItemPerStore;

  @override
  String toString() {
    return '{context: $context, contextId: $contextId, contextType: $contextType, id: $id, name: $name, isActive: $isActive, itemsInStore: $itemsInStore, itemsExpiredInStore: $itemsExpiredInStore}';
  }

  ActiveStore({
    required this.context,
    required this.contextId,
    required this.contextType,
    required this.id,
    required this.name,
    required this.isActive,
    required this.itemsInStore,
    required this.itemsExpiredInStore,
    required this.maxItemPerStore,
  });

  factory ActiveStore.fromJson(Map<String, dynamic> json) {
    return ActiveStore(
      context: json['@context'],
      contextId: json['@id'],
      contextType: json['@type'],
      id: json['id'],
      name: json['name'],
      isActive: json['isActive'],
      itemsInStore: json['itemsInStore'],
      itemsExpiredInStore: json['itemsExpiredInStore'],
      maxItemPerStore: json['maxItemPerStore'],
    );
  }
}

ActiveStore activeStoreInit() {
  return ActiveStore(context: '', contextId: '', contextType: '', id: 0, name: '', isActive: false, itemsInStore: 0, itemsExpiredInStore: 0, maxItemPerStore: 0);
}
