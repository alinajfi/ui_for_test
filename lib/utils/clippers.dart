
// class CenterClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path()
//       ..lineTo(0, 0)
//       ..lineTo(size.width - 60, 0)
//       ..quadraticBezierTo(x1, y1, x2, y2);

//     // path.lineTo(0, size.height);
//     // path.lineTo(size.width / 2, size.height - 30); // Clip from the center
//     // path.lineTo(size.width, size.height);
//     // path.lineTo(size.width, 0);
//     // path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
