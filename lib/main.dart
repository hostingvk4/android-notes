import "dart:io";
import "package:flutter/material.dart";
import "package:path_provider/path_provider.dart";
import "notes/Notes.dart";
import "tasks/Tasks.dart";
import "utils.dart" as utils;


/// Start it up!
void main() {
  startMeUp() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory docsDir = await getApplicationDocumentsDirectory();
    utils.docsDir = docsDir;
    runApp(FlutterBook());
  }

  startMeUp();

} /* End main(). */


/// ********************************************************************************************************************
/// Main app widget.
/// ********************************************************************************************************************
class FlutterBook extends StatelessWidget {


  /// The build() method.
  ///
  /// @param  inContext The BuildContext for this widget.
  /// @return           A Widget.
  Widget build(BuildContext inContext) {

    print("## FlutterBook.build()");

    return MaterialApp(
      home : DefaultTabController(
        length : 2,
        child : Scaffold(
          appBar : AppBar(
            title : Text("FlutterBook"),
            bottom : TabBar(
              tabs : [
                Tab(icon : Icon(Icons.note), text : "Notes"),
                Tab(icon : Icon(Icons.assignment_turned_in), text : "Tasks")
              ] /* End TabBar.tabs. */
            ) /* End TabBar. */
          ), /* End AppBar. */
          body : TabBarView(
            children : [
              Notes(),
              Tasks()
            ] /* End TabBarView.children. */
          ) /* End TabBarView. */
        ) /* End Scaffold. */
      ) /* End DefaultTabController. */
    ); /* End MaterialApp. */

  } /* End build(). */


} /* End class. */
