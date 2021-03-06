import 'package:flutter/material.dart';
import 'model/kategori.dart';

class EntryFormKategori extends StatefulWidget {
  final Kategori kategori;
  EntryFormKategori(this.kategori);
  @override
  EntryFormKategoriState createState() => EntryFormKategoriState(this.kategori);
}

//class controller
class EntryFormKategoriState extends State<EntryFormKategori> {
  Kategori kategori;
  EntryFormKategoriState(this.kategori);
  TextEditingController golonganController = TextEditingController();
  TextEditingController gajiController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //kondisi
    if (kategori != null) {
      golonganController.text = kategori.golongan;
      gajiController.text = kategori.gaji.toString();
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: kategori == null ? Text('Tambah Kategori') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // Golongan
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: golonganController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Golongan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // Gaji
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: gajiController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Gaji',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              
              // tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (kategori == null) {
                            // tambah data
                            kategori = Kategori(
                              golonganController.text,
                              int.parse(gajiController.text),
                            );
                          } else {
                            // ubah data
                            kategori.golongan = golonganController.text;
                            kategori.gaji = int.parse(gajiController.text);
                          }
                          // kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context, kategori);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                          ),
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      );
  }
}