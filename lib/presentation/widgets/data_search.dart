import '../../utils/tools/file_importers.dart';


class DataSearch extends StatefulWidget {
  const DataSearch({super.key});

  @override
  State<DataSearch> createState() => _DataSearchState();
}

class _DataSearchState extends State<DataSearch> {
  final TextEditingController searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 40,
      child: TextField(
        controller: searchQueryController,
        decoration: const InputDecoration(
          hintText: "TEXT Write",
          enabledBorder: OutlineInputBorder()
        ),
      )
    );
  }



  /*TextField(
  onTap: (){
  setState(() {
  isTapped = !isTapped;
  print(isTapped);
  _startSearch(context);
  });
  },
  controller: _searchQueryController,
  cursorColor: MyColors.customBlue,
  textAlignVertical: TextAlignVertical.bottom,
  decoration: InputDecoration(
  hintText: "🔍 ${"search".tr()}",
  fillColor: Theme
      .of(context)
      .colorScheme
      .secondary,
  filled: true,
  suffixIcon: isTapped ? IconButton(
  onPressed: _clearSearchQuery,
  icon: const Icon(Icons.add),
  ) : const Icon(Icons.abc),
  enabledBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
  color: MyColors.secondaryLight, width: 0.0),
  ),
  focusedBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
  color: MyColors.secondaryLight, width: 0.0),
  ),
  ),
  onChanged: (query) => updateSearchQuery(query),
  ),*/

/*  void _startSearch(context) {
    ModalRoute.of(context)?.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: _stopSearching),
    );

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    searchQuery = newQuery;
    updateQuery(uni: searchQuery);
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      searchQueryController.clear();
      updateSearchQuery("");
    });
  }

  void updateQuery({String? uni, context}) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.initList(uni: uni);
  }*/
  
}