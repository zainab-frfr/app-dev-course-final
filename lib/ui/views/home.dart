import 'package:final_exam/bloc/bloc.dart';
import 'package:final_exam/data/model.dart';
import 'package:final_exam/ui/widgets/shimmer_tile.dart';
import 'package:final_exam/ui/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 231, 231),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.arrow_back),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Icon(Icons.more_horiz),
          )
        ],
      ),
      body: BlocBuilder<InformationBloc,States>(
        builder: (context, state){
          switch (state){
            case FetchingState():
              return Column(
                children: [
                  const SizedBox(
                    height: 115,
                    child:  Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "MONDAY",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 170, 169, 169), 
                                  fontSize: 15
                                ),
                              ),
                              Text(
                                "17 Nov",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                                ),
                              )
                            ],
                          ),
                          Text(
                            "\$2,983",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35)
                        )
                      ),

                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 30, left: 30),
                              child: Text(
                                "Transactions",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                              ),
                            ),
                            //SizedBox(height: 20,), 
                            Expanded(
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: ListView.builder(
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return const ShimmerTile();
                                  },
                                )),
                            )
                          ],
                        ),
                      
                    ),
                  ),
                ],
              );
            case FetchedState():
              return Column(
                children: [
                  SizedBox(
                    height: 115,
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat('EEEE').format(DateTime.now()).toUpperCase(),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 170, 169, 169), 
                                  fontSize: 15
                                ),
                              ),
                              Text(
                                DateFormat('d MMM').format(DateTime.now()),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                                ),
                              )
                            ],
                          ),
                          Text(
                            "\$${state.balance}",
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35)
                        )
                      ),

                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 30, left: 30),
                              child: Text(
                                "Transactions",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                              ),
                            ),
                            //SizedBox(height: 20,), 
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: state.transactions.length,
                                itemBuilder: (context, index) {
                                  Model dataItem = state.transactions[index];

                                  return Padding(
                                    padding: const EdgeInsets.only(right: 30, left: 20, top: 10),
                                    child: TransactionTile(dataItem: dataItem,),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      
                    ),
                  ),
                ],
              );
            case ErrorState():
              return Center(child: Text(state.message),);
            default:
              return const Center(child: Text('Unrecognized State'),);
          }
        }
      )
    );
  }
}