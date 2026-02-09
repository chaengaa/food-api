// ignore_for_file: non_constant_identifier_names

class Paymentcon {
  double Subtotal(List<dynamic> paymentlist) {
    double subtotal = 0;
    for (var item in paymentlist) {
      subtotal += (item.price * item.qty);
    }
    return subtotal;
  }

  double TotalPrice(List<dynamic> paymentlist) {
    if (Subtotal(paymentlist) == 0) {
      return Subtotal(paymentlist);
    }
    return Subtotal(paymentlist) + 2.50;
  }

  double Delivery(List<dynamic> paymentlist) {
    double delivery = 2.50;
    if (Subtotal(paymentlist) == 0) {
      return 0;
    }
    return delivery;
  }

  double Discount(List<dynamic> paymentlist) {
    final dis = Subtotal(paymentlist);
    if (dis >= 25 && dis < 50) {
      return dis * 0.05;
    } else if (dis > 50) {
      return dis * 0.6;
    }
    return 0;
  }

  double AfterDiscount(List<dynamic> paymentlist) {
    final totaldis = Subtotal(paymentlist);
    if (totaldis == 0) return 0;
    return totaldis - Discount(paymentlist) + Delivery(paymentlist);
  }
}
