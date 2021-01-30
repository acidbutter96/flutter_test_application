import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset("images/profile.png"),
            ),
            width: 80,
            height: 80,
          ),
          Container(
            child: Column(
              children: [
                Text(
                  "Nome Cadastrado",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text("email@co.uk",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 95,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Text(
                      "Editar Perfil",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    print("Editar perfil");
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
