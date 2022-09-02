import 'package:catering_sdu/components/recommend_box.dart';
import 'package:catering_sdu/components/search_box.dart';
import 'package:catering_sdu/models/home_config.dart';
import 'package:catering_sdu/utils/debug.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isRearrangingListenable = ValueNotifier(false);
  late List<bool> onAir = list.map((_) => false).toList();
  late List<double> onAirDelta = list.map((_) => 0.0).toList();

  var list = [
    const SearchBox(key: ValueKey('search')),
    const RecommendBox(key: ValueKey('recommend'))
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.hot_tub),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          // baseline: TextBaseline.alphabetic,
                          child: Icon(
                            Icons.location_on,
                            size: Theme.of(context).textTheme.caption?.fontSize,
                          ),
                          alignment: PlaceholderAlignment.middle,
                          // style: Theme.of(context).textTheme.caption,
                        ),
                        TextSpan(
                          text: "Deliver to",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Shandong Univ. (Weihai)",
                    style: Theme.of(context).textTheme.overline,
                  ),
                ],
              ),
              const Icon(Icons.shopping_cart)
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
          separatorBuilder: (ctx, i) => const Divider(),
          itemCount: list.length,
          itemBuilder: (ctx, i) {
            var child = list[i];
            return const SizedBox(
              height: 120,
              width: double.infinity,
              child: Placeholder(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isRearrangingListenable.value = !isRearrangingListenable.value;
        },
        child: ValueListenableBuilder(
          builder: (ctx, bool isOn, _) => Icon(isOn
              ? Icons.dashboard_customize
              : Icons.dashboard_customize_outlined),
          valueListenable: isRearrangingListenable,
        ),
      ),
    );
  }
}
