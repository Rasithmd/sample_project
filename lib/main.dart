import 'package:flutter/material.dart';
import 'package:sample_project/api/response_api.dart';
import 'package:sample_project/model/response_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'All Vehicle Makes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    getResponseData();
  }

  Response? model;
  List<dynamic> results = [];
  Future<void> getResponseData() async {
    await ResponseApi().getResponseData().then((value) {
      setState(() {
        model = value;
        // model!.results
        //     .sort((a, b) => int.parse(a.makeId).compareTo(int.parse(b.makeId)));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: model == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: PaginatedDataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Make Name')),
                ],
                source: MyDataTableSource(model!.results),
                rowsPerPage: 14, // display 20 rows per page
              ),
            ),
    );
  }
}

class MyDataTableSource extends DataTableSource {
  final List<dynamic> _results;

  MyDataTableSource(this._results);

  @override
  int get rowCount => _results.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_results[index].makeId)),
      DataCell(Text(_results[index].makeName)),
    ]);
  }
}
