import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentPostsRecord extends FirestoreRecord {
  StudentPostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "student" field.
  DocumentReference? _student;
  DocumentReference? get student => _student;
  bool hasStudent() => _student != null;

  // "image_paths" field.
  List<String>? _imagePaths;
  List<String> get imagePaths => _imagePaths ?? const [];
  bool hasImagePaths() => _imagePaths != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  void _initializeFields() {
    _student = snapshotData['student'] as DocumentReference?;
    _imagePaths = getDataList(snapshotData['image_paths']);
    _content = snapshotData['content'] as String?;
    _created = snapshotData['created'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('studentPosts');

  static Stream<StudentPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudentPostsRecord.fromSnapshot(s));

  static Future<StudentPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudentPostsRecord.fromSnapshot(s));

  static StudentPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudentPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudentPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudentPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudentPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudentPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudentPostsRecordData({
  DocumentReference? student,
  String? content,
  DateTime? created,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'student': student,
      'content': content,
      'created': created,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudentPostsRecordDocumentEquality
    implements Equality<StudentPostsRecord> {
  const StudentPostsRecordDocumentEquality();

  @override
  bool equals(StudentPostsRecord? e1, StudentPostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.student == e2?.student &&
        listEquality.equals(e1?.imagePaths, e2?.imagePaths) &&
        e1?.content == e2?.content &&
        e1?.created == e2?.created;
  }

  @override
  int hash(StudentPostsRecord? e) => const ListEquality()
      .hash([e?.student, e?.imagePaths, e?.content, e?.created]);

  @override
  bool isValidKey(Object? o) => o is StudentPostsRecord;
}
