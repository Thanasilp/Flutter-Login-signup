import 'package:flutter/material.dart';
import '../services/api_coffee.dart';

class CoffeeList extends StatefulWidget {
  const CoffeeList({super.key});

  @override
  State<CoffeeList> createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  List coffee = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCoffee();
  }

  Future<void> loadCoffee() async {
    try {
      final data = await ApiCoffee.fetchCoffee();
      setState(() {
        coffee = data;
      });
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return coffee.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: coffee.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final coffeeItem = coffee[index];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.network(
                          coffeeItem['imagePublicId'], //ดึง url รูป
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.green,
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              coffeeItem['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 3.0),
                            Text(
                              "฿${coffeeItem['price']}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.zero, // ไม่มีขอบโค้ง
                                ),
                                elevation: 0, // ไม่มีเงา
                                backgroundColor:
                                    Colors
                                        .transparent, // พื้นหลังโปร่งใส (ถ้าต้องการ)
                                shadowColor:
                                    Colors.transparent, // ลบเงาเพิ่มเติม
                              ),
                              child: const Icon(
                                Icons.add_circle,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
  }
}
