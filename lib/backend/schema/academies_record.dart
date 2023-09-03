import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AcademiesRecord extends FirestoreRecord {
  AcademiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "admin" field.
  DocumentReference? _admin;
  DocumentReference? get admin => _admin;
  bool hasAdmin() => _admin != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "account_number" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  bool hasAccountNumber() => _accountNumber != null;

  // "available_time" field.
  String? _availableTime;
  String get availableTime => _availableTime ?? '';
  bool hasAvailableTime() => _availableTime != null;

  // "payment_date" field.
  DateTime? _paymentDate;
  DateTime? get paymentDate => _paymentDate;
  bool hasPaymentDate() => _paymentDate != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  void _initializeFields() {
    _admin = snapshotData['admin'] as DocumentReference?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _accountNumber = snapshotData['account_number'] as String?;
    _availableTime = snapshotData['available_time'] as String?;
    _paymentDate = snapshotData['payment_date'] as DateTime?;
    _created = snapshotData['created'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('academies');

  static Stream<AcademiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AcademiesRecord.fromSnapshot(s));

  static Future<AcademiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AcademiesRecord.fromSnapshot(s));

  static AcademiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AcademiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AcademiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AcademiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AcademiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AcademiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAcademiesRecordData({
  DocumentReference? admin,
  String? photoUrl,
  String? accountNumber,
  String? availableTime,
  DateTime? paymentDate,
  DateTime? created,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'admin': admin,
      'photo_url': photoUrl,
      'account_number': accountNumber,
      'available_time': availableTime,
      'payment_date': paymentDate,
      'created': created,
    }.withoutNulls,
  );

  return firestoreData;
}

class AcademiesRecordDocumentEquality implements Equality<AcademiesRecord> {
  const AcademiesRecordDocumentEquality();

  @override
  bool equals(AcademiesRecord? e1, AcademiesRecord? e2) {
    return e1?.admin == e2?.admin &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.availableTime == e2?.availableTime &&
        e1?.paymentDate == e2?.paymentDate &&
        e1?.created == e2?.created;
  }

  @override
  int hash(AcademiesRecord? e) => const ListEquality().hash([
        e?.admin,
        e?.photoUrl,
        e?.accountNumber,
        e?.availableTime,
        e?.paymentDate,
        e?.created
      ]);

  @override
  bool isValidKey(Object? o) => o is AcademiesRecord;
}
