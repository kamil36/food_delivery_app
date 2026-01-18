import 'package:flutter/material.dart';

class GridTileWidget extends StatefulWidget {
  final String image;
  final String title;
  final String price;

  const GridTileWidget({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  State<GridTileWidget> createState() => _GridTileWidgetState();
}

class _GridTileWidgetState extends State<GridTileWidget> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffEBE8E8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ✅ Image takes flexible space
            Expanded(
              child: Center(
                child: Image.network(
                  widget.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 4),

            /// ✅ Prevent text overflow
            Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),

            const SizedBox(height: 4),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffC9AA05),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() => _isLiked = !_isLiked);
                  },
                  child: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    size: 18,
                    color: _isLiked ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
