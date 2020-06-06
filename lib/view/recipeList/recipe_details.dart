import 'package:MahaBelly/networking/recipe_response.dart';
import 'package:MahaBelly/shared/recipe_image.dart';
import 'package:MahaBelly/shared/recipe_text.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parse;

class RecipeDetails extends StatefulWidget {
  final Recipe _recipe;

  RecipeDetails(this._recipe);

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // "Unmount" the controllers:
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerViewIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RecipeImage(widget._recipe.imageURI),
                    RecipeTitle(widget._recipe, 15.0),
                  ],
                ),
              ),
              expandedHeight: 340.0,
              pinned: true,
              floating: true,
              elevation: 2.0,
              forceElevated: innerViewIsScrolled,
              bottom: TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                labelColor: Theme.of(context).primaryColor,
                tabs: <Widget>[
                  Tab(text: "Summary"),
                  Tab(text: "Preparation"),
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[
            SummaryView('${parse.parse(widget._recipe.summary).body.text}'),
            PreparationView(widget._recipe.analyzedInstructions)
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}

//Text('${parse.parse(_recipe.summary).body.text}'),
class PreparationView extends StatelessWidget {
  final List<AnalyzedInstructions> preparationSteps;

  PreparationView(this.preparationSteps);

  @override
  Widget build(BuildContext context) {
    List<Widget> textElements = List<Widget>();
    preparationSteps.forEach((item) {
      textElements.add(
        Text(item.toString()),
      );
      // Add spacing between the lines:
      textElements.add(
        SizedBox(
          height: 10.0,
        ),
      );
    });
    return ListView(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 75.0),
      children: textElements,
    );
  }
}

class SummaryView extends StatelessWidget {
  final String _summary;

  SummaryView(this._summary);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Text(
        _summary,
        style: TextStyle(fontSize: 20.0, wordSpacing: 2.0),
      ),
    );
  }
}
