import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:temporary_switch_listview/models/pets.dart';
import 'package:temporary_switch_listview/providers/pets_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    await Provider.of<PetsProvider>(context, listen: false).fetchPets();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider API Call"),
        centerTitle: true,
      ),
      body: Container(
        child: PetList(),
      ),
    );
  }

  Widget getLoadindgUI() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SpinKitFadingCircle(
            color: Colors.blueGrey,
            size: 80.0,
          ),
          Text('Loading...'),
        ],
      ),
    );
  }
}

class PetList extends StatelessWidget {
  const PetList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PetsProvider>(
      builder: (context, petData, child) {
        return ListView.builder(
          itemCount: petData.petsCount,
          itemBuilder: (context, index) {
            final pet = petData.pets[index];
            final subpet = petData.subpets[index];
            return ListTile(
              title: Text(pet.categoryDisplayName),
              subtitle: Text(subpet.categoryDisplayName),
              trailing: Switch(
                value: pet.subscribeFlag == "Y" ? true : false,
                onChanged: (newValue) {
                  pet.subscribeFlag == "Y" ? false : true == newValue;
                },
              ),
            );
          },
        );
      },
    );
  }
}
