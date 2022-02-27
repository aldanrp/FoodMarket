import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:restaurant_food/models/models.dart';
import 'package:restaurant_food/shared/shared.dart';

class OrderItemsFood extends StatelessWidget {
  final Transaction transactionfood;
  const OrderItemsFood({Key? key, required this.transactionfood})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(20, 2, 20, 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(transactionfood.food.picturePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactionfood.food.name,
                    style:
                        blackFontstyle3.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    "${transactionfood.quantity} item(s) " +
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0)
                            .format(transactionfood.total),
                    style: greyFontstyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
          ]),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  convertDateTime(transactionfood.dateTime),
                  style: greyFontstyle.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                (transactionfood.status == TransactionStatus.cancelled)
                    ? Text(
                        "Cancelled",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFD9435E),
                          fontSize: 12,
                        ),
                      )
                    : (transactionfood.status == TransactionStatus.pending)
                        ? Text(
                            "Pending",
                            style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 218, 221, 20),
                              fontSize: 12,
                            ),
                          )
                        : (transactionfood.status ==
                                TransactionStatus.on_delivery)
                            ? Text(
                                "On Delivery",
                                style: GoogleFonts.poppins(
                                  color:
                                      const Color.fromARGB(255, 166, 218, 25),
                                  fontSize: 12,
                                ),
                              )
                            : Text("Delivered",
                                style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(255, 20, 218, 30),
                                  fontSize: 12,
                                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  String convertDateTime(DateTime dateTime) {
    String month;

    switch (dateTime.month) {
      case 1:
        month = "Jan";
        break;
      case 2:
        month = "Feb";
        break;
      case 3:
        month = "Mar";
        break;
      case 4:
        month = "Apr";
        break;
      case 5:
        month = "Mei";
        break;
      case 6:
        month = "Jun";
        break;
      case 7:
        month = "Jul";
        break;
      case 8:
        month = "Agust";
        break;
      case 9:
        month = "Sep";
        break;
      case 10:
        month = "Okto";
        break;
      case 11:
        month = "Nov";
        break;
      default:
        month = "Des";
    }
    return month + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  }
}
