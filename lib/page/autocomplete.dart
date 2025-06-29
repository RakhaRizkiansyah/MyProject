import 'package:flutter/material.dart';

enum ButtonState { init, loading, done }

class AutocompletePage extends StatefulWidget {
  const AutocompletePage({super.key});

  @override
  State<AutocompletePage> createState() => _AutocompletePageState();
}

class _AutocompletePageState extends State<AutocompletePage> {
  bool isAnimating = true;
  ButtonState state = ButtonState.init;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDone = state == ButtonState.done;
    final isStretched = isAnimating || state == ButtonState.init;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Autocomplete"),
        centerTitle: true,
        backgroundColor: Colors.orange.shade400,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearch());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          width: state == ButtonState.init ? width * 0.6 : 60,
          onEnd: () => setState(() => isAnimating = !isAnimating),
          height: 70,
          child: isStretched ? buildButton() : buildSmallButton(isDone),
        ),
      ),
    );
  }

  Widget buildButton() => OutlinedButton(
    style: TextButton.styleFrom(
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 32),
    ),
    onPressed: () async {
      setState(() => state = ButtonState.loading);
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;
      setState(() => state = ButtonState.done);
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;
      setState(() => state = ButtonState.init);
    },
    child: const Text(
      'Submit',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.indigo,
      ),
    ),
  );

  Widget buildSmallButton(bool isDone) {
    final color = isDone ? Colors.green : Colors.indigo;

    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child:
            isDone
                ? const Icon(Icons.done, size: 52, color: Colors.white)
                : const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}

// SEARCH DELEGATE
class MySearch extends SearchDelegate {
  List<String> searchResults = ['Flutter', 'Kotlin', 'Java', 'PHP', 'HTML'];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, null),
  );

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = '';
        }
      },
      icon: const Icon(Icons.clear),
    ),
  ];

  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(
      query,
      style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w200),
    ),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions =
        searchResults.where((searchResult) {
          final result = searchResult.toLowerCase();
          final input = query.toLowerCase();
          return result.contains(input);
        }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
