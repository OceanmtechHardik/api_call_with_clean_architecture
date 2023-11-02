import 'package:api_call_with_clean_architecture/di/get_it.dart';
import 'package:api_call_with_clean_architecture/features/home/presentation/cubit/home_cubit.dart';
import 'package:api_call_with_clean_architecture/features/home/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';

abstract class HomeWidget extends State<HomeScreen> {
  late HomeCubit homeCubit;
  @override
  void initState() {
    homeCubit = getItInstance<HomeCubit>();
    homeCubit.loadInitialData();
    super.initState();
  }

  @override
  void dispose() {
    homeCubit.close();
    super.dispose();
  }

  Widget commonTile({required HomeLoadedState state, required int index}) {
    var employeeDetails = state.productDataEntity;
    return ListTile(
      leading: const CircleAvatar(backgroundColor: Colors.orange),
      subtitle: RichText(
        text: TextSpan(
          text: 'Employee Name: ',
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
                text: employeeDetails[index].address.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      trailing: Row(
        children: [
          const Text('Employee Salary:'),
          Text(
            employeeDetails[index].subCategoryName,
          ),
        ],
      ),
    );
  }
}
