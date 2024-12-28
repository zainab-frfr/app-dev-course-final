import 'package:final_exam/bloc/bloc.dart';
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
                  return Column(
                    children: [
                      const SizedBox(
                        height: 115,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "MONDAY",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 170, 169, 169),
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "17 Nov",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  )
                                ],
                              ),
                              Text(
                                "\$2,983",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
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
                                  topRight: Radius.circular(35))),
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
                                      fontSize: 20),
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
                                      rating: double.parse("${state.product.rating}"),
                                      size: 30,
                                    ),
                                    Text('(${state.product.peopleRated})')
                                  ],
                                )
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.pink)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ClipOval(
                                        child: Material(
                                            color: Colors.pink,
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                )))),
                                  ),
                                  const Text('01'),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ClipOval(
                                        child: Material(
                                            color: Colors.pink,
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                )))),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Indulge in the vibrant burst of summer with every sip',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'of our luscious strawberry elixir.',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11),
                                ),
                                Text(
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

/*
BlocBuilder<InformationBloc,States>(
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
*/
/*
Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Image.network(
                    'https://png.pngtree.com/png-vector/20240427/ourlarge/pngtree-strawberry-fruit-juice-isolated-on-transparent-background-png-image_12324754.png'),
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
                        const Text(
                          'Strawberry Juice',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const Text(
                          'Each(100g-700g)',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 13),
                        ),
                        Row(
                          children: [
                            StarRating(
                              rating: 4,
                              size: 30,
                            ),
                            const Text('(30)')
                          ],
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.pink)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipOval(
                                child: Material(
                                    color: Colors.pink,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        )))),
                          ),
                          const Text('01'),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipOval(
                                child: Material(
                                    color: Colors.pink,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        )))),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Indulge in the vibrant burst of summer with every sip',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 11),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'of our luscious strawberry elixir.',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 11),
                        ),
                        Text(
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery Time',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '40-45min',
                          style: TextStyle(
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
                              fontWeight: FontWeight.bold, fontSize: 20),
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
          ),
        )
*/
