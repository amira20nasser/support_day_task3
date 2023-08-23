import 'package:flutter/material.dart';
import 'package:task_day3/models/category.dart';

List imagesOffers = [
  const AssetImage("assets/images/kfc.jpeg"),
  const AssetImage("assets/images/mac.jpeg"),
  const AssetImage("assets/images/offercar.jpeg"),
  const AssetImage("assets/images/offerg.jpeg"),
  const AssetImage("assets/images/kfc.jpeg"),
];

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/stu.jpeg"),
                radius: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      color: const Color(0xFFFF5A00).withOpacity(0.5),
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "Amira Nasser",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 48),
                    child: Text(
                      "Talabat",
                      style: TextStyle(
                        color: Color(0xFFFF5A00),
                        fontSize: 30,
                        fontFamily: "font talabat",
                      ),
                    ),
                  ),
                  IconButton(
                    color: Colors.white,
                    iconSize: 30,
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFFFF5A00),
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
          ),
          const ContainerSection(),
          const SizedBox(height: 30),
          const Text(
            "Categories",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Image(
                          image: categories[index].image,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          categories[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, i__) {
                  return const SizedBox(
                    width: 20,
                  );
                },
                itemCount: categories.length),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Offers",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      color: Color(0xFFFF5A00),
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 700,
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Image(
                          image: imagesOffers[index],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, i__) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: imagesOffers.length),
          )
        ],
      ),
    );
  }
}

class ContainerSection extends StatelessWidget {
  const ContainerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFFF5A00),
        boxShadow: const [
          BoxShadow(
            offset: Offset(-3, 15),
            color: Color.fromARGB(255, 215, 165, 138),
          ),
          BoxShadow(
            offset: Offset(-3, 10),
            color: Color.fromARGB(255, 239, 186, 158),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Talabat mart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                "20 mins delivery",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 100,
                child: Text(
                  "I can't see what in the photo. The quality is bad",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Shop now",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/images/cart.png",
            width: 150,

            //color: Colors.white,
          ),
        ],
      ),
    );
  }
}
