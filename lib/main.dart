import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as developer;

class DataUMKM {
  int id;
  String nama;
  String jenis;
  DataUMKM(
      {required this.id,
      required this.nama,
      required this.jenis}); //constructor
}

class DataUMKMCubit extends Cubit<DataUMKM> {
  String url = "http://178.128.17.76:8000/daftar_umkm";
  DataUMKMCubit() : super(DataUMKM(id: 0, nama: "", jenis: ""));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String nama = json['nama'];
    String jenis = json['jenis'];
    emit(DataUMKM(id: id, nama: nama, jenis: jenis));
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => DataUMKMCubit(),
        child: const HalamanUtama(),
      ),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);
  @override
  Widget build(Object context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('My App'),
            centerTitle: true, // membuat judul di tengah
          ),
          body: Column(
            children: [
              BlocBuilder<DataUMKMCubit, DataUMKM>(
                buildWhen: (previousState, state) {
                  developer.log(
                    "${previousState.nama} -> ${state.nama}",
                    name: 'logyudi',
                  );
                  return true;
                },
                builder: (context, nama) {
                  return Center(
                    child: Container(
                      width: 568,
                      height: 591.2,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 568,
                            height: 50,
                            child: Text(
                              "2105745,Ridwan Albana;2100846,Rafly Putra Santoso;Saya berjanji tidak akan berbuat curang data atau membantu orang lain berbuat curang",
                              style: TextStyle(
                                color: Color.fromARGB(255, 7, 0, 0),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 180,
                            height: 30,
                            child: TextButton(
                              
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              onPressed: () {
                                context.read<DataUMKMCubit>().fetchData();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Scaffold();
                                    },
                                  ),
                                );
                              },
                               child: Text(
                            "Reload Daftar UMKM",
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 12,
                            ),
                          ),
                              
                            ),
                           
                          ),
                          
                          Container(
                            margin: const EdgeInsets.all(1),
                            child: ListTile(
                              onTap: () {},
                              leading: Image.network(
                                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                              trailing: const Icon(Icons.more_vert),
                              title: const Text('Judul'),
                              subtitle: const Text("ini Subjudul"),
                              tileColor: Colors.white70,
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.all(1),
                            child: ListTile(
                              onTap: () {},
                              leading: Image.network(
                                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                              trailing: const Icon(Icons.more_vert),
                              title: const Text('Judul'),
                              subtitle: const Text("ini Subjudul"),
                              tileColor: Colors.white70,
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.all(1),
                            child: ListTile(
                              onTap: () {},
                              leading: Image.network(
                                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                              trailing: const Icon(Icons.more_vert),
                              title: const Text('Judul'),
                              subtitle: const Text("ini Subjudul"),
                              tileColor: Colors.white70,
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.all(1),
                            child: ListTile(
                              onTap: () {},
                              leading: Image.network(
                                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                              trailing: const Icon(Icons.more_vert),
                              title: const Text('Judul'),
                              subtitle: const Text("ini Subjudul"),
                              tileColor: Colors.white70,
                            ),
                          ),
                           Text(nama.nama),
                    Text("Data UMKM: ${nama.nama}")
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
