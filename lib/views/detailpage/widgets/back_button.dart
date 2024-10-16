import 'package:flutter/material.dart';

class DetailBackButton extends StatelessWidget {
  const DetailBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OutlinedButton.icon(
        onPressed:() {
          Navigator.of(context).pop();
        } , 
        label: const SizedBox(width: 60,height: 30,child: Center(child: Text("Geri dön",style: TextStyle(color: Colors.white),)),),
        icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,),
      ),
    );
  }
}