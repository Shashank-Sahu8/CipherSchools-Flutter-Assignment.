import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('Money')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .delete();
                print(FirebaseAuth.instance.currentUser!.uid);
              },
              icon: Icon(Icons.delete))
        ],
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'All Transactions',
          style: GoogleFonts.inter(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Money')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('data')
              .snapshots(),
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final docs = snapshots.data!.docs;
              return docs.length == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Image.asset('assets/NOOPTIONS.png', height: 120),
                        Text(
                          'No Teansactions yet',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        )
                      ],
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            //color: Colors.white,
                            height: 89,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Color(0xffFFF6E5),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Image.asset(docs[index]
                                                    ['Category'] ==
                                                'Shopping'
                                            ? 'assets/shopping bag.png'
                                            : docs[index]['Category'] ==
                                                    'Subscription'
                                                ? 'assets/recurring bill.png'
                                                : docs[index]['Category'] ==
                                                        'Travel'
                                                    ? 'assets/car.png'
                                                    : docs[index]['Category'] ==
                                                            'Food'
                                                        ? 'assets/restaurant.png'
                                                        : docs[index][
                                                                    'Category'] ==
                                                                'Bills'
                                                            ? 'assets/recurring bill.png'
                                                            : 'assets/currency exchange.png'),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            docs[index]['Category'],
                                            style: GoogleFonts.inter(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Text(
                                            (docs[index]['description']
                                                        .toString()
                                                        .length) >
                                                    12
                                                ? docs[index]['description']
                                                        .toString()
                                                        .substring(0, 12) +
                                                    "..."
                                                : docs[index]['description']
                                                    .toString(),
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Color(0xff91919F)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            docs[index]['check'] == true
                                                ? "-" +
                                                    docs[index]['amount']
                                                        .toString()
                                                : "+" +
                                                    docs[index]['amount']
                                                        .toString(),
                                            style: GoogleFonts.inter(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    docs[index]['check'] == true
                                                        ? Color(0xffFD3C4A)
                                                        : Color(0xff00A86B)),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            "10:00 AM",
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Color(0xff91919F)),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            FirebaseFirestore.instance
                                                .collection('Money')
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.uid)
                                                .collection('data')
                                                .doc(docs[index]['time'])
                                                .delete();
                                            print("yes");
                                            print(docs[index]['time']);
                                          },
                                          icon: Icon(
                                            Icons.delete_forever_sharp,
                                            color: Color(0xff7F3DFF),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
            }
          },
        ),
      ),
    );
  }
}
