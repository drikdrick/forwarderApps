import 'package:bokshaulforwarder/Model/promo.dart';
import 'package:bokshaulforwarder/Resource/promo_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Promotion extends StatefulWidget {
  const Promotion({Key? key}) : super(key: key);

  @override
  _PromotionState createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        FutureBuilder<List>(
          future: fetchPromo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              List? promotions = snapshot.data;
              if (promotions!.length == 0) {
                return Center(
                  child: Text(
                    "Belum ada promosi.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }
              return Column(
                children: promotions
                    .map(
                      (promotions) => new Column(
                        children: <Widget>[
                          promoCard(context, promotions),
                        ],
                      ),
                    )
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
  // List<Promo>? promoList;
  // @override
  // void initState() {
  //   _getRefreshData();
  //   super.initState();
  // }

  // Future<void> _getRefreshData() async {
  //   promoList = await fetchPromo();
  //   print(promoList);
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return RefreshIndicator(
  //     onRefresh: _getRefreshData,
  //     child: ListView.builder(
  //       itemCount: promoList == null ? 0 : promoList!.length,
  //       itemBuilder: (context, index) {
  //         final Promo promo = promoList![index];
  //         return
  //       },
  //     ),
  //   );
  // }
}
