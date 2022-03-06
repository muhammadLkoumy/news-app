import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/bloc/cubit.dart';
import 'package:news/layout/bloc/states.dart';
import '../shred/components/componant.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    var searchController = TextEditingController();

    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {

          var list = NewsCubit.get(context).search;

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                  NewsCubit.get(context).search = [];
                },
                icon: Icon(Icons.arrow_back_ios, color: NewsCubit.get(context).isDark ? CupertinoColors.black : Colors.white,),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children:
                [
                  TextFormField(

                    // style to change color of text input field
                    style: Theme.of(context).textTheme.bodyText2,
                    decoration: const InputDecoration(
                      label: Text('Search', style: TextStyle(color: Colors.grey),),
                      prefixIcon: Icon(Icons.search, color: Colors.grey,),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                      NewsCubit.get(context).getSearch(value: value);
                    },
                  ),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => articleView(list[index], context),
                      separatorBuilder: (context, index) => separator(),
                      itemCount: list.length,
                    ),
                  )
                ],
              ),
            ),
          );
        },
    );
  }
}
