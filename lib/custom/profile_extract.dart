// ignore_for_file: camel_case_types

import 'package:bitebox/user/accountpage/more_info.dart';
import 'package:bitebox/user/accountpage/profile.dart';
import 'package:bitebox/user/accountpage/terms.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class termsandcondition extends StatelessWidget {
  const termsandcondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.all(8),
     child: Container(
       decoration: BoxDecoration(
           border: Border.all(
             color: Colors.black,
           ),
           borderRadius: BorderRadius.circular(18)),
       child: ListTile(
         onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => TermsScreen()));
         },
         leading: Icon(
           Icons.telegram,
           color: Colors.black,
         ),
         trailing: Icon(
           Icons.arrow_forward_ios,
           color: Colors.black,
         ),
         title: Text(
           'Terms & Condition',
           style:
               GoogleFonts.poppins(color: Colors.black, fontSize: 17),
         ),
       ),
     ),
            );
  }
}

class about extends StatelessWidget {
  const about({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(18)),
        child: ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
          },
          leading: Icon(
            Icons.more_horiz_sharp,
            color: Colors.black,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ),
          title: Text(
            'More INFO',
            style:
                GoogleFonts.poppins(color: Colors.black, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

class profile extends StatelessWidget {
  const profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(18)),
        child: ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          },
          leading: Icon(
            Icons.person,
            //color: Colors.black,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ),
          title: Text(
            'Profile',
            style:
                GoogleFonts.poppins(color: Colors.black, fontSize: 17),
          ),
        ),
      ),
    );
  }
}


