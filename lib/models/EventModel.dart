class Event {
  int id;
  String title;
  String subtitle;
  String description;
  String rules;
  String dateStart;
  String dateFinish;
  bool online;
  int maxVisit;
  String place;
  int organizerID;
  List<String> categories;
  List<int> visitorsID;

  Event({
    this.id = -1,
    this.title = '',
    this.subtitle = '',
    this.description = '',
    this.rules = '',
    this.online = false,
    this.dateStart,
    this.dateFinish,
    this.maxVisit = 0,
    this.place = '',
    this.organizerID = -1,
    this.categories,
    this.visitorsID,
  });
}
