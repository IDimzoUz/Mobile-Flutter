class ScannedHistoryResponse {
  int? count;
  String? next;
  List<Results>? results;

  ScannedHistoryResponse({this.count, this.next, this.results});

  ScannedHistoryResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  Seat? seat;
  double? ticketPrice;
  PriceCategory? priceCategory;
  bool? push;
  bool? refunded;
  bool? hasInvitation;

  Results(
      {this.id,
        this.seat,
        this.ticketPrice,
        this.priceCategory,
        this.push,
        this.refunded,
        this.hasInvitation,
      });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seat = json['seat'] != null ? new Seat.fromJson(json['seat']) : null;
    ticketPrice = json['ticket_price'];
    priceCategory = json['price_category'] != null
        ? new PriceCategory.fromJson(json['price_category'])
        : null;
    push = json['push'];
    refunded = json['refunded'];
    hasInvitation = json['has_invitation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.seat != null) {
      data['seat'] = this.seat!.toJson();
    }
    data['ticket_price'] = this.ticketPrice;
    if (this.priceCategory != null) {
      data['price_category'] = this.priceCategory!.toJson();
    }
    data['push'] = this.push;
    data['refunded'] = this.refunded;
    data['has_invitation'] = this.hasInvitation;
    return data;
  }
}

class Seat {
  String? row;
  int? seatNumber;
  Null? image;
  String? sector;

  Seat({this.row, this.seatNumber, this.image, this.sector});

  Seat.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    seatNumber = json['seat_number'];
    image = json['image'];
    sector = json['sector'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row'] = this.row;
    data['seat_number'] = this.seatNumber;
    data['image'] = this.image;
    data['sector'] = this.sector;
    return data;
  }
}

class PriceCategory {
  int? id;
  String? name;
  String? price;
  Color? color;

  PriceCategory({this.id, this.name, this.price, this.color});

  PriceCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    color = json['color'] != null ? new Color.fromJson(json['color']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    if (this.color != null) {
      data['color'] = this.color!.toJson();
    }
    return data;
  }
}

class Color {
  String? bgColor;
  String? textColor;

  Color({this.bgColor, this.textColor});

  Color.fromJson(Map<String, dynamic> json) {
    bgColor = json['bg_color'];
    textColor = json['text_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bg_color'] = this.bgColor;
    data['text_color'] = this.textColor;
    return data;
  }
}
