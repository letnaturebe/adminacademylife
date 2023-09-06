import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentsRecord extends FirestoreRecord {
  StudentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "phone_number" field.
  int? _phoneNumber;
  int get phoneNumber => _phoneNumber ?? 0;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "academy" field.
  DocumentReference? _academy;
  DocumentReference? get academy => _academy;
  bool hasAcademy() => _academy != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _comment = snapshotData['comment'] as String?;
    _phoneNumber = castToType<int>(snapshotData['phone_number']);
    _status = snapshotData['status'] as String?;
    _academy = snapshotData['academy'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('students');

  static Stream<StudentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudentsRecord.fromSnapshot(s));

  static Future<StudentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudentsRecord.fromSnapshot(s));

  static StudentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudentsRecordData({
  String? name,
  String? comment,
  int? phoneNumber,
  String? status,
  DocumentReference? academy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'comment': comment,
      'phone_number': phoneNumber,
      'status': status,
      'academy': academy,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudentsRecordDocumentEquality implements Equality<StudentsRecord> {
  const StudentsRecordDocumentEquality();

  @override
  bool equals(StudentsRecord? e1, StudentsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.comment == e2?.comment &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.status == e2?.status &&
        e1?.academy == e2?.academy;
  }

  @override
  int hash(StudentsRecord? e) => const ListEquality()
      .hash([e?.name, e?.comment, e?.phoneNumber, e?.status, e?.academy]);

  @override
  bool isValidKey(Object? o) => o is StudentsRecord;
}
