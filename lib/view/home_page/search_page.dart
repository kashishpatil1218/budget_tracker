import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'Home_Page.dart';
import 'component/insert_dialogueBox.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,)),
        title: Text("Transaction",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                controller.filterBySearch(value);
              },
              controller: controller.txtSearch,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              ),
            ),
          ),
        ),
      ),
     body:  Obx(
           () => Expanded(
         child: ListView.builder(
             itemCount: controller.budgetList.length,
             itemBuilder: (context, index) => Card(
               color: controller.budgetList[index].isIncome == 1
                   ? Colors.green.shade100
                   : Colors.red.shade100,
               child: ListTile(
                 leading: Text(
                   controller.budgetList[index].id.toString(),
                 ),
                 title: Text(
                   controller.budgetList[index].amount.toString(),
                 ),
                 subtitle: Text(
                     controller.budgetList[index].category! +
                         " - ${controller.budgetList[index].date!}"),
                 trailing: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     IconButton(
                       onPressed: () {
                         editBox(
                             context, controller.budgetList[index]);
                       },
                       icon: Icon(Icons.edit),
                     ),
                     IconButton(
                       onPressed: () {
                         controller.deleteData(
                             controller.budgetList[index].id!);
                       },
                       icon: Icon(Icons.delete),
                     ),
                   ],
                 ),
               ),
             )),
       ),
     ),

    );
  }
}
