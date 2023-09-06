import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoticesRecord extends FirestoreRecord {
  NoticesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "image_paths" field.
  List<String>? _imagePaths;
  List<String> get imagePaths => _imagePaths ?? const [];
  bool hasImagePaths() => _imagePaths != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "updated" field.
  DateTime? _updated;
  DateTime? get updated => _updated;
  bool hasUpdated() => _updated != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _imagePaths = getDataList(snapshotData['image_paths']);
    _created = snapshotData['created'] as DateTime?;
    _updated = snapshotData['updated'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notices');

  static Stream<NoticesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NoticesRecord.fromSnapshot(s));

  static Future<NoticesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NoticesRecord.fromSnapshot(s));

  static NoticesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NoticesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NoticesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NoticesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NoticesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NoticesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNoticesRecordData({
  String? title,
  String? content,
  DateTime? created,
  DateTime? updated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'content': content,
      'created': created,
      'updated': updated,
    }.withoutNulls,
  );

  return firestoreData;
}

class NoticesRecordDocumentEquality implements Equality<NoticesRecord> {
  const NoticesRecordDocumentEquality();

  @override
  bool equals(NoticesRecord? e1, NoticesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        listEquality.equals(e1?.imagePaths, e2?.imagePaths) &&
        e1?.created == e2?.created &&
        e1?.updated == e2?.updated;
  }

  @override
  int hash(NoticesRecord? e) => const ListEquality()
      .hash([e?.title, e?.content, e?.imagePaths, e?.created, e?.updated]);

  @override
  bool isValidKey(Object? o) => o is NoticesRecord;
}
