class DateTimeConstants {
  static const monthNames = {
    DateTime.january: "January",
    DateTime.february: "February",
    DateTime.march: "March",
    DateTime.april: "April",
    DateTime.may: "May",
    DateTime.june: "June",
    DateTime.july: "July",
    DateTime.august: "August",
    DateTime.september: "September",
    DateTime.october: "October",
    DateTime.november: "November",
    DateTime.december: "December",
  };

  static const weekdayShortNames = {
    DateTime.sunday: "S",
    DateTime.monday: "M",
    DateTime.tuesday: "T",
    DateTime.wednesday: "W",
    DateTime.thursday: "T",
    DateTime.friday: "F",
    DateTime.saturday: "S",
  };

  static const weekdayOrder = [
    DateTime.sunday,
    DateTime.monday,
    DateTime.tuesday,
    DateTime.wednesday,
    DateTime.thursday,
    DateTime.friday,
    DateTime.saturday,
  ];

  static final currentDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
}
