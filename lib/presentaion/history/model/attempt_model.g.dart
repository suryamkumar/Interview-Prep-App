// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attempt_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttemptModelAdapter extends TypeAdapter<AttemptModel> {
  @override
  final int typeId = 1;

  @override
  AttemptModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttemptModel(
      questionId: fields[0] as String,
      questionText: fields[1] as String,
      answer: fields[2] as String,
      score: fields[3] as int,
      dateTime: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AttemptModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.questionId)
      ..writeByte(1)
      ..write(obj.questionText)
      ..writeByte(2)
      ..write(obj.answer)
      ..writeByte(3)
      ..write(obj.score)
      ..writeByte(4)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttemptModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
