import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:monenou_web/Screens/Products/into_screen.dart';
import 'package:monenou_web/constant.dart';

class BoostPayment extends StatefulWidget {
  final productId;
  final userId;

  const BoostPayment({Key key, this.productId, this.userId}) : super(key: key);

  @override
  _BoostPaymentState createState() => _BoostPaymentState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _amountController = TextEditingController();

class _BoostPaymentState extends State<BoostPayment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Montant du payement",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixText: 'FCFA',
                        // prefixIcon:Icon( Icons.add_alert_outlined ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[200])),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[300])),
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Montant souhaité",
                      ),
                      controller: _amountController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter un montant';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        child: Text("Valider"),
                        textColor: Colors.white,
                        padding: EdgeInsets.all(16),
                        onPressed: () async {
                          //                        final collRef = Firestore.instance.collection('gameLevels');
                          // DocumentReferance docReference = collRef.document();

                          // docReferance.setData(map).then((doc) {
                          //   print('hop ${docReferance.documentID}');
                          // }).catchError((error) {
                          //   print(error);
                          // });
                          if (_formKey.currentState.validate()) {
                            DocumentReference collect = FirebaseFirestore
                                .instance
                                .collection('Payments')
                                .doc();

                            collect.set({
                              'productId': widget.productId,
                              'userId': widget.userId
                            }).then((value) {
                              MakePayment(context, _amountController.text,
                                  widget.userId, widget.productId, collect.id);
                            }).catchError((onError) {
                              print(onError);
                            });
                          }
                        },
                        color: orango,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

MakePayment(BuildContext context, amount, userId, productId, paymentid) async {
  String result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CustomWebView(
        selectedUrl:
            'https://paygateglobal.com/v1/page?token=71f1ca4d-daf6-4d44-925d-77b05f46b78d&amount=$amount&description=boost&identifier=$paymentid',
        amount: amount,
        userid: userId,
        paymentid: paymentid,
        productid: productId,
      ),
      maintainState: true,
    ),
  );
  // if (result == null) {
  //   var now = DateTime.now();
  //   FirebaseFirestore.instance.collection('Payments').doc(paymentid).update({
  //     'PaymentDate':now.toString(),
  //     'amount':amount,

  //   }).then((value) {
  // Navigator.pop(context);
  //   });

  // }
}

class CustomWebView extends StatefulWidget {
  final String selectedUrl;

  final amount;
  final userid;
  final paymentid;
  final productid;

  CustomWebView(
      {this.selectedUrl,
      this.amount,
      this.userid,
      this.paymentid,
      this.productid});

  @override
  _CustomWebViewState createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (url.contains("accepted")) {
        var now = DateTime.now();
        FirebaseFirestore.instance
            .collection('Payments')
            .doc(widget.paymentid)
            .update({
          'PaymentDate': now.toString(),
          'amount': widget.amount,
        }).then((value) {
          FirebaseFirestore.instance
              .collection('products')
              .doc(widget.productid)
              .update({'isPremium': true});
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => IntroScreen()),
              (Route<dynamic> route) => false);
        });

        // Navigator.pop(context);
      }

      // if (url.contains(
      //     "https://www.facebook.com/connect/login_success.html?error=access_denied&error_code=200&error_description=Permissions+error&error_reason=user_denied")) {
      //   denied();
      // }
    });
  }

  denied() {
    Navigator.pop(context);
  }

  // succeed(String url) {
  // var params = url.split("access_token=");

  // var endparam = params[1].split("&");

  // }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: widget.selectedUrl,
        appBar: new AppBar(
          leading: IconButton(
              icon: Icon(Icons.refresh_outlined),
              onPressed: () {
                setState(() {});
              }),
          backgroundColor: orango,
          title: new Text("Payements"),
        ));
  }
}
