import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourdine/constants/text_style.dart';
import 'package:tourdine/features/home/home_screen/provider/provider.dart';

import 'widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // <-- SEE HERE
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  SearchTendingBottomStaticLayout(
                    controller: controller,
                  ),
                  const SearchAndTrendingScrollLayout(),
                  Consumer(
                    builder: (context, ref, child) {
                      String text = ref.watch(myProvider) as String;
                      bool isFilter = ref.watch(isFilterProvider) as bool;
                      if (text.isNotEmpty && isFilter == false) {
                        return const SearchPanel();
                      } else if (isFilter) {
                        return const FilterPanel();
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
                  // if (controller.text.isNotEmpty) const SearchPanel(),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Text(
                  "Categories",
                  style: textStyle2.copyWith(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CategoriesContainers(),
            ],
          ),
        ),
      ),
    );
  }
}
