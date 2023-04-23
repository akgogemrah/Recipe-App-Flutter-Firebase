import 'package:flutter/material.dart';
import 'package:recipe_app_work/Model/FireStoreViewModel.dart';

class MenuPage extends StatelessWidget {
   MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FireStoreViewModel fireStoreViewModel= FireStoreViewModel();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(stream: fireStoreViewModel.getNotes(),builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
            {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              final recipes = snapshot.data.docs;
              return Expanded(
                child: ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(recipes[index].data()['name']),
                    );
                  },
                ),
              );
            },)
          ],

        ),
      ),
    );
  }
}
