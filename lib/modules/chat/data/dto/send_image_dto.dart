import 'dart:typed_data';

class SendImageDto {
  final List<Uint8List> images;

  SendImageDto(this.images);

  Map<String, dynamic> toJson() {
    return {"images": images};
  }
}

class SendImageDtoList {
  final List<List<int>> images;

  SendImageDtoList(this.images);

  List<Map<String, dynamic>> toJson() {
    return images.map((image) {
      return {"image": Uint8List.fromList(image).buffer.asUint8List()};
    }).toList();
  }
}
