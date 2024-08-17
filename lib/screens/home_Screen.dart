import 'package:flutter/material.dart';
import 'package:mineexchange/screens/filter_screen.dart';
import 'package:provider/provider.dart';
import '../viewmodels/mine_exchange_view_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<MineExchangeViewModel>(context, listen: false)
        .fetchMineExchangeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'MineXchange',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 17, 31),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: screenHeight / 6,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 0, 17, 31),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Empowering ",
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            "Brakers, Buyers & Sellers",
                            style: TextStyle(
                              color: Colors.orange,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Connect & Transact in a Transparent Marketplace",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 5),
                    child: Container(
                      color: Colors.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Discover",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "Featured Projects",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 8, 41, 70),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  const Color.fromARGB(255, 8, 41, 70),
                            ),
                            child: const Text("View All"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: screenHeight,
                  color: Colors.grey,
                  child: Consumer<MineExchangeViewModel>(
                    builder: (context, viewModel, child) {
                      if (viewModel.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (viewModel.error != null) {
                        return Center(child: Text(viewModel.error!));
                      }

                      return ListView.builder(
                        itemCount: viewModel.projects.length,
                        itemBuilder: (context, index) {
                          final project = viewModel.projects[index];
                          return Stack(
                            children: [
                              Container(
                                height: 400,
                                padding:
                                    const EdgeInsets.fromLTRB(30, 10, 30, 10),
                                child: Column(children: [
                                  Container(
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          topRight: Radius.circular(7)),
                                      color: Color.fromARGB(255, 8, 41, 70),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          project.name,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          project.name,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 200,
                                    width: double.infinity,
                                    child: Image.network(
                                      project.image[0]['url'],
                                      fit: BoxFit
                                          .cover, // Adjust the fit as needed
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      (loadingProgress
                                                              .expectedTotalBytes ??
                                                          1)
                                                  : null,
                                            ),
                                          );
                                        }
                                      },
                                      errorBuilder: (BuildContext context,
                                          Object error,
                                          StackTrace? stackTrace) {
                                        return const Center(
                                            child: Icon(Icons.error,
                                                color: Colors.red));
                                      },
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(7),
                                          bottomRight: Radius.circular(7)),
                                      color: Colors.white,
                                    ),
                                    height: 150,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                project.commodity_sector[0],
                                                style: const TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 8, 41, 70),
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                project.commodity_sector[0],
                                                style: const TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 8, 41, 70),
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                project.commodity,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 8, 41, 70),
                                                    fontSize: 18),
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                      Icons.chalet_sharp),
                                                  Text(
                                                    project.intension,
                                                    style: const TextStyle(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 8, 41, 70),
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(Icons.location_on),
                                                  Text(
                                                    project.region,
                                                    style: const TextStyle(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 8, 41, 70),
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(Icons
                                                      .model_training_sharp),
                                                  Text(
                                                    project.commodity,
                                                    style: const TextStyle(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 8, 41, 70),
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                      Icons.monetization_on),
                                                  Text(
                                                    project.price_range,
                                                    style: const TextStyle(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 8, 41, 70),
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                              const Positioned(
                                top: 45,
                                left: 280,
                                right: 1,
                                child: CircleAvatar(
                                  child: Icon(Icons.person),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight / 7,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search...',
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, FilterScreen.route);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text("Filter"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
