import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:medicalassiss/features/doctor_features/patient_profile.dart/patient_profile.dart';
import 'package:medicalassiss/features/doctor_features/patients/data/patient_model.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController controller;
  List<PatientModel> itemsOnSearch = [];
  bool isError = false; // To track if there's an error

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    itemsOnSearch = mainList; // Default data from mainList
  }

  // Searching Function for TextField
  onSearch(String search) {
    try {
      setState(() {
        itemsOnSearch = mainList
            .where((element) =>
                element.name.toLowerCase().contains(search.toLowerCase()))
            .toList();
        isError = false; // Reset error state
      });
    } catch (e) {
      // In case any error happens during search
      setState(() {
        isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              // Search Box
              FadeInDownBig(
                delay: const Duration(milliseconds: 5),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.07,
                    child: Center(
                      child: TextField(
                        controller: controller,
                        onChanged: (value) {
                          onSearch(value);
                        },
                        style: textTheme.displaySmall?.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          filled: true,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.clear();
                              FocusManager.instance.primaryFocus?.unfocus();
                              setState(() {
                                itemsOnSearch =
                                    mainList; // Reset to original list
                                isError = false;
                              });
                            },
                            icon: const Icon(Icons.close),
                          ),
                          hintStyle: textTheme.displaySmall?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                          ),
                          hintText: "Search for a patient...",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),

              /// Main Item List for Searching
              Expanded(
                child: isError
                    // If there's an error
                    ? Center(
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 200),
                          child: const Text(
                            "An error occurred while searching. Please try again.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                    : itemsOnSearch.isNotEmpty
                        // If there are search results
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: itemsOnSearch.length,
                            itemBuilder: (context, index) {
                              PatientModel current = itemsOnSearch[index];
                              return FadeInLeft(
                                delay: Duration(milliseconds: 100 * index),
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigate to patient details
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          PatientProfilePage(),
                                    ));
                                  },
                                  child: Card(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.05,
                                        vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              current.imageUrl,
                                              width: size.width * 0.3,
                                              height: size.height * 0.12,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  current.name,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  "€${current.price}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        // If there are no results
                        : Center(
                            child: FadeInUp(
                              delay: const Duration(milliseconds: 200),
                              child: const Center(
                                child: Text(
                                  "No Result Found :(",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
