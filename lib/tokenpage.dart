// import 'package:flutter/material.dart';
// import 'package:rootsam/mainpage.dart';

// class TokenPage extends StatelessWidget {
//   const TokenPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 150,
//               ),
//               const Positioned(
//                 top: 50,
//                 left: 0,
//                 right: 0,
//                 child: Icon(
//                   Icons.check_circle,
//                   color: Color.fromARGB(255, 50, 204, 33),
//                   size: 100,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Positioned(
//                 top: 200,
//                 left: 0,
//                 right: 0,
//                 child: SizedBox(
//                   width: 163,
//                   height: 31,
//                   child: Text(
//                     "Ticket no: XXXX45",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 17,
//                       fontFamily: "Poppins",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 120,
//               ),
//               const SizedBox(
//                 width: 276,
//                 child: Text(
//                   "NOTE: ",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 233, 32, 18),
//                     fontSize: 17,
//                     fontFamily: "Poppins",
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 276,
//                 child: Text(
//                   "Complaint has been raised to authorities, for quries contact helpdesk",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 17,
//                     fontFamily: "Poppins",
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 100,
//               ),
//               SizedBox(
//                 width: 240,
//                 height: 60,
//                 child: ElevatedButton(
//                   onPressed: () => {
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(builder: (context) => MainPage()),
//                       (route) => false,
//                     ),
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     backgroundColor: const Color.fromARGB(255, 50, 204, 33),
//                     padding: const EdgeInsets.fromLTRB(39, 16, 42, 11),
//                     elevation: 4,
//                   ),
//                   child: const Text(
//                     "FINISH",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontFamily: "Poppins",
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:samtry/mainpage.dart';

class TokenPage extends StatelessWidget {
String? ticket_no;
TokenPage({super.key,required this.ticket_no});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 150),
                  const Icon(
                    Icons.check_circle,
                    color: Color.fromARGB(255, 50, 204, 33),
                    size: 100,
                  ),
                  const SizedBox(height: 20),
                   Text(
                    "Ticket no: ${ticket_no}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 120),
                   Text(
                    " Note:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 233, 32, 18),
                      fontSize: 17,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "Complaint has been raised to authorities, for queries contact helpdesk",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 100),
                  SizedBox(
                    width: 240,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: const Color.fromARGB(255, 50, 204, 33),
                        padding: const EdgeInsets.fromLTRB(39, 16, 42, 11),
                        elevation: 4,
                      ),
                      child: const Text(
                        "FINISH",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

