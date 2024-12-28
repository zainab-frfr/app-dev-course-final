import 'package:final_exam/bloc/bloc.dart';
import 'package:final_exam/ui/widgets/counter.dart';
import 'package:final_exam/ui/widgets/shimmer_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:shimmer/shimmer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 234, 231, 231),
        appBar: AppBar(
          title: const Text(
            'Details',
            style: TextStyle(color: Colors.grey),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 204, 221),
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(
                Icons.share,
                color: Colors.grey,
              ),
            )
          ],
        ),
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 255, 204, 221),
                Colors.white,
                Colors.white,
              ],
            )),
            child:
                BlocBuilder<InformationBloc, States>(builder: (context, state) {
              switch (state) {
                case FetchingState():
                  return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child:const ShimmerTile());
                case FetchedState():
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Image.network(state.product.image),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.product.title,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  state.product.quantity,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13),
                                ),
                                Row(
                                  children: [
                                    StarRating(
                                      rating: double.parse(
                                          "${state.product.rating}"),
                                      size: 30,
                                    ),
                                    Text('(${state.product.peopleRated})')
                                  ],
                                )
                              ],
                            ),
                            /// add counter
                            const MyCounter()
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.product.descOne,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  state.product.descTwo,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11),
                                ),
                                const Text(
                                  ' Read more',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(255, 255, 204, 221),
                                      Color.fromARGB(255, 255, 88, 144),
                                    ],
                                  )),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.timelapse,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Delivery Time',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  state.product.deliveryTime,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                      color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Price',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                      color: Colors.grey),
                                ),
                                Text(
                                  '\$20.00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromARGB(255, 255, 204, 221),
                                        Color.fromARGB(255, 255, 88, 144),
                                      ],
                                    )),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Text('Add to cart',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ))
                          ],
                        )
                      ],
                    ),
                  );
                case ErrorState():
                  return Center(
                    child: Text(state.message),
                  );
                default:
                  return const Center(
                    child: Text('Unrecognized State'),
                  );
              }
            })));
  }
}
