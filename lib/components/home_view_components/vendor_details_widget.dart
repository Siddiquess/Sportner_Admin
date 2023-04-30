import 'package:flutter/material.dart';

class VendorDetails {

  static vendorDetailBox(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        children: [
          const SimpleDialogOption(
            child: Text(
              "Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //---------------- Song Title
          SimpleDialogOption(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 1.6 / 10,
                    child: const Text('Name')),
                const Expanded(
                  child: Text(
                    "hiiiii",
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          //---------------- Song Artist
          SimpleDialogOption(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 1.6 / 10,
                    child: const Text('Artist')),
                const Expanded(
                  child: Text(
                    "hellooo",
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          //---------------- Song Artist
          SimpleDialogOption(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 1.6 / 10,
                    child: const Text('Album')),
                const Expanded(
                  child: Text(
                    "hioiiiiiiiii",
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          //---------------- Song Duration
          SimpleDialogOption(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 1.6 / 10,
                    child: const Text('Duration')),
                const Expanded(child: Text("yessssss")),
              ],
            ),
          ),
          //---------------- Song Size
          SimpleDialogOption(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 1.6 / 10,
                    child: const Text('Size')),
                const Expanded(child: Text("wowwwwwwwww")),
              ],
            ),
          ),
          //---------------- Song Path
          SimpleDialogOption(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 1.6 / 10,
                    child: const Text('Path')),
                const Expanded(
                  child: Text(
                    "heheeeeeeee",
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SimpleDialogOption(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok'),
              ),
            ),
          )
        ],
      );
    },
  );
}
}