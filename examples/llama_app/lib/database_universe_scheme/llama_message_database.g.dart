// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'llama_message_database.dart';

// **************************************************************************
// _DatabaseUniverseCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetLlamaMessageDatabaseCollection on DatabaseUniverse {
  DatabaseUniverseCollection<int, LlamaMessageDatabase>
      get llamaMessageDatabases => this.collection();
}

const LlamaMessageDatabaseSchema = DatabaseUniverseGeneratedSchema(
  schema: DatabaseUniverseSchema(
    name: 'LlamaMessageDatabase',
    idName: 'id',
    embedded: false,
    properties: [
      DatabaseUniversePropertySchema(
        name: 'special_type',
        type: DatabaseUniverseType.string,
      ),
      DatabaseUniversePropertySchema(
        name: 'is_outgoing',
        type: DatabaseUniverseType.bool,
      ),
      DatabaseUniversePropertySchema(
        name: 'is_done',
        type: DatabaseUniverseType.bool,
      ),
      DatabaseUniversePropertySchema(
        name: 'text',
        type: DatabaseUniverseType.string,
      ),
      DatabaseUniversePropertySchema(
        name: 'date',
        type: DatabaseUniverseType.long,
      ),
    ],
    indexes: [],
  ),
  converter: DatabaseUniverseObjectConverter<int, LlamaMessageDatabase>(
    serialize: serializeLlamaMessageDatabase,
    deserialize: deserializeLlamaMessageDatabase,
    deserializeProperty: deserializeLlamaMessageDatabaseProp,
  ),
  embeddedSchemas: [],
);

@databaseUniverseProtected
int serializeLlamaMessageDatabase(
    DatabaseUniverseWriter writer, LlamaMessageDatabase object) {
  DatabaseUniverseCore.writeString(writer, 1, object.special_type);
  DatabaseUniverseCore.writeBool(writer, 2, object.is_outgoing);
  DatabaseUniverseCore.writeBool(writer, 3, object.is_done);
  DatabaseUniverseCore.writeString(writer, 4, object.text);
  DatabaseUniverseCore.writeLong(writer, 5, object.date);
  return object.id;
}

@databaseUniverseProtected
LlamaMessageDatabase deserializeLlamaMessageDatabase(
    DatabaseUniverseReader reader) {
  final object = LlamaMessageDatabase();
  object.special_type = DatabaseUniverseCore.readString(reader, 1) ?? '';
  object.id = DatabaseUniverseCore.readId(reader);
  object.is_outgoing = DatabaseUniverseCore.readBool(reader, 2);
  object.is_done = DatabaseUniverseCore.readBool(reader, 3);
  object.text = DatabaseUniverseCore.readString(reader, 4) ?? '';
  object.date = DatabaseUniverseCore.readLong(reader, 5);
  return object;
}

@databaseUniverseProtected
dynamic deserializeLlamaMessageDatabaseProp(
    DatabaseUniverseReader reader, int property) {
  switch (property) {
    case 1:
      return DatabaseUniverseCore.readString(reader, 1) ?? '';
    case 0:
      return DatabaseUniverseCore.readId(reader);
    case 2:
      return DatabaseUniverseCore.readBool(reader, 2);
    case 3:
      return DatabaseUniverseCore.readBool(reader, 3);
    case 4:
      return DatabaseUniverseCore.readString(reader, 4) ?? '';
    case 5:
      return DatabaseUniverseCore.readLong(reader, 5);
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _LlamaMessageDatabaseUpdate {
  bool call({
    required int id,
    String? special_type,
    bool? is_outgoing,
    bool? is_done,
    String? text,
    int? date,
  });
}

class _LlamaMessageDatabaseUpdateImpl implements _LlamaMessageDatabaseUpdate {
  const _LlamaMessageDatabaseUpdateImpl(this.collection);

  final DatabaseUniverseCollection<int, LlamaMessageDatabase> collection;

  @override
  bool call({
    required int id,
    Object? special_type = ignore,
    Object? is_outgoing = ignore,
    Object? is_done = ignore,
    Object? text = ignore,
    Object? date = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (special_type != ignore) 1: special_type as String?,
          if (is_outgoing != ignore) 2: is_outgoing as bool?,
          if (is_done != ignore) 3: is_done as bool?,
          if (text != ignore) 4: text as String?,
          if (date != ignore) 5: date as int?,
        }) >
        0;
  }
}

sealed class _LlamaMessageDatabaseUpdateAll {
  int call({
    required List<int> id,
    String? special_type,
    bool? is_outgoing,
    bool? is_done,
    String? text,
    int? date,
  });
}

class _LlamaMessageDatabaseUpdateAllImpl
    implements _LlamaMessageDatabaseUpdateAll {
  const _LlamaMessageDatabaseUpdateAllImpl(this.collection);

  final DatabaseUniverseCollection<int, LlamaMessageDatabase> collection;

  @override
  int call({
    required List<int> id,
    Object? special_type = ignore,
    Object? is_outgoing = ignore,
    Object? is_done = ignore,
    Object? text = ignore,
    Object? date = ignore,
  }) {
    return collection.updateProperties(id, {
      if (special_type != ignore) 1: special_type as String?,
      if (is_outgoing != ignore) 2: is_outgoing as bool?,
      if (is_done != ignore) 3: is_done as bool?,
      if (text != ignore) 4: text as String?,
      if (date != ignore) 5: date as int?,
    });
  }
}

extension LlamaMessageDatabaseUpdate
    on DatabaseUniverseCollection<int, LlamaMessageDatabase> {
  _LlamaMessageDatabaseUpdate get update =>
      _LlamaMessageDatabaseUpdateImpl(this);

  _LlamaMessageDatabaseUpdateAll get updateAll =>
      _LlamaMessageDatabaseUpdateAllImpl(this);
}

sealed class _LlamaMessageDatabaseQueryUpdate {
  int call({
    String? special_type,
    bool? is_outgoing,
    bool? is_done,
    String? text,
    int? date,
  });
}

class _LlamaMessageDatabaseQueryUpdateImpl
    implements _LlamaMessageDatabaseQueryUpdate {
  const _LlamaMessageDatabaseQueryUpdateImpl(this.query, {this.limit});

  final DatabaseUniverseQuery<LlamaMessageDatabase> query;
  final int? limit;

  @override
  int call({
    Object? special_type = ignore,
    Object? is_outgoing = ignore,
    Object? is_done = ignore,
    Object? text = ignore,
    Object? date = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (special_type != ignore) 1: special_type as String?,
      if (is_outgoing != ignore) 2: is_outgoing as bool?,
      if (is_done != ignore) 3: is_done as bool?,
      if (text != ignore) 4: text as String?,
      if (date != ignore) 5: date as int?,
    });
  }
}

extension LlamaMessageDatabaseQueryUpdate
    on DatabaseUniverseQuery<LlamaMessageDatabase> {
  _LlamaMessageDatabaseQueryUpdate get updateFirst =>
      _LlamaMessageDatabaseQueryUpdateImpl(this, limit: 1);

  _LlamaMessageDatabaseQueryUpdate get updateAll =>
      _LlamaMessageDatabaseQueryUpdateImpl(this);
}

class _LlamaMessageDatabaseQueryBuilderUpdateImpl
    implements _LlamaMessageDatabaseQueryUpdate {
  const _LlamaMessageDatabaseQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QOperations>
      query;
  final int? limit;

  @override
  int call({
    Object? special_type = ignore,
    Object? is_outgoing = ignore,
    Object? is_done = ignore,
    Object? text = ignore,
    Object? date = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (special_type != ignore) 1: special_type as String?,
        if (is_outgoing != ignore) 2: is_outgoing as bool?,
        if (is_done != ignore) 3: is_done as bool?,
        if (text != ignore) 4: text as String?,
        if (date != ignore) 5: date as int?,
      });
    } finally {
      q.close();
    }
  }
}

extension LlamaMessageDatabaseQueryBuilderUpdate
    on QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QOperations> {
  _LlamaMessageDatabaseQueryUpdate get updateFirst =>
      _LlamaMessageDatabaseQueryBuilderUpdateImpl(this, limit: 1);

  _LlamaMessageDatabaseQueryUpdate get updateAll =>
      _LlamaMessageDatabaseQueryBuilderUpdateImpl(this);
}

extension LlamaMessageDatabaseQueryFilter on QueryBuilder<LlamaMessageDatabase,
    LlamaMessageDatabase, QFilterCondition> {
  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> special_typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> special_typeGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> special_typeGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> special_typeLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> special_typeLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> special_typeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> special_typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> special_typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
          QAfterFilterCondition>
      special_typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
          QAfterFilterCondition>
      special_typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> special_typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> special_typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> is_outgoingEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> is_doneEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> textEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> textGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> textGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> textLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> textLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> textBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
          QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
          QAfterFilterCondition>
      textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 4,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> dateEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> dateGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> dateGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> dateLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> dateLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase,
      QAfterFilterCondition> dateBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension LlamaMessageDatabaseQueryObject on QueryBuilder<LlamaMessageDatabase,
    LlamaMessageDatabase, QFilterCondition> {}

extension LlamaMessageDatabaseQuerySortBy
    on QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QSortBy> {
  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      sortBySpecial_type({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      sortBySpecial_typeDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      sortByIs_outgoing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      sortByIs_outgoingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      sortByIs_done() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      sortByIs_doneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      sortByText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      sortByTextDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }
}

extension LlamaMessageDatabaseQuerySortThenBy
    on QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QSortThenBy> {
  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      thenBySpecial_type({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      thenBySpecial_typeDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      thenByIs_outgoing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      thenByIs_outgoingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      thenByIs_done() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      thenByIs_doneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      thenByText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      thenByTextDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }
}

extension LlamaMessageDatabaseQueryWhereDistinct
    on QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QDistinct> {
  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterDistinct>
      distinctBySpecial_type({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterDistinct>
      distinctByIs_outgoing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterDistinct>
      distinctByIs_done() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterDistinct>
      distinctByText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QAfterDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }
}

extension LlamaMessageDatabaseQueryProperty1
    on QueryBuilder<LlamaMessageDatabase, LlamaMessageDatabase, QProperty> {
  QueryBuilder<LlamaMessageDatabase, String, QAfterProperty>
      special_typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<LlamaMessageDatabase, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<LlamaMessageDatabase, bool, QAfterProperty>
      is_outgoingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<LlamaMessageDatabase, bool, QAfterProperty> is_doneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<LlamaMessageDatabase, String, QAfterProperty> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<LlamaMessageDatabase, int, QAfterProperty> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}

extension LlamaMessageDatabaseQueryProperty2<R>
    on QueryBuilder<LlamaMessageDatabase, R, QAfterProperty> {
  QueryBuilder<LlamaMessageDatabase, (R, String), QAfterProperty>
      special_typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<LlamaMessageDatabase, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<LlamaMessageDatabase, (R, bool), QAfterProperty>
      is_outgoingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<LlamaMessageDatabase, (R, bool), QAfterProperty>
      is_doneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<LlamaMessageDatabase, (R, String), QAfterProperty>
      textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<LlamaMessageDatabase, (R, int), QAfterProperty> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}

extension LlamaMessageDatabaseQueryProperty3<R1, R2>
    on QueryBuilder<LlamaMessageDatabase, (R1, R2), QAfterProperty> {
  QueryBuilder<LlamaMessageDatabase, (R1, R2, String), QOperations>
      special_typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<LlamaMessageDatabase, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<LlamaMessageDatabase, (R1, R2, bool), QOperations>
      is_outgoingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<LlamaMessageDatabase, (R1, R2, bool), QOperations>
      is_doneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<LlamaMessageDatabase, (R1, R2, String), QOperations>
      textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<LlamaMessageDatabase, (R1, R2, int), QOperations>
      dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}
