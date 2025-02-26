// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_llama_library_database.dart';

// **************************************************************************
// _DatabaseUniverseCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetApplicationLlamaLibraryDatabaseCollection on DatabaseUniverse {
  DatabaseUniverseCollection<int, ApplicationLlamaLibraryDatabase>
      get applicationLlamaLibraryDatabases => this.collection();
}

const ApplicationLlamaLibraryDatabaseSchema = DatabaseUniverseGeneratedSchema(
  schema: DatabaseUniverseSchema(
    name: 'ApplicationLlamaLibraryDatabase',
    idName: 'id',
    embedded: false,
    properties: [
      DatabaseUniversePropertySchema(
        name: 'special_type',
        type: DatabaseUniverseType.string,
      ),
      DatabaseUniversePropertySchema(
        name: 'llama_model_path',
        type: DatabaseUniverseType.string,
      ),
    ],
    indexes: [],
  ),
  converter:
      DatabaseUniverseObjectConverter<int, ApplicationLlamaLibraryDatabase>(
    serialize: serializeApplicationLlamaLibraryDatabase,
    deserialize: deserializeApplicationLlamaLibraryDatabase,
    deserializeProperty: deserializeApplicationLlamaLibraryDatabaseProp,
  ),
  embeddedSchemas: [],
);

@databaseUniverseProtected
int serializeApplicationLlamaLibraryDatabase(
    DatabaseUniverseWriter writer, ApplicationLlamaLibraryDatabase object) {
  DatabaseUniverseCore.writeString(writer, 1, object.special_type);
  DatabaseUniverseCore.writeString(writer, 2, object.llama_model_path);
  return object.id;
}

@databaseUniverseProtected
ApplicationLlamaLibraryDatabase deserializeApplicationLlamaLibraryDatabase(
    DatabaseUniverseReader reader) {
  final object = ApplicationLlamaLibraryDatabase();
  object.id = DatabaseUniverseCore.readId(reader);
  object.special_type = DatabaseUniverseCore.readString(reader, 1) ?? '';
  object.llama_model_path = DatabaseUniverseCore.readString(reader, 2) ?? '';
  return object;
}

@databaseUniverseProtected
dynamic deserializeApplicationLlamaLibraryDatabaseProp(
    DatabaseUniverseReader reader, int property) {
  switch (property) {
    case 0:
      return DatabaseUniverseCore.readId(reader);
    case 1:
      return DatabaseUniverseCore.readString(reader, 1) ?? '';
    case 2:
      return DatabaseUniverseCore.readString(reader, 2) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _ApplicationLlamaLibraryDatabaseUpdate {
  bool call({
    required int id,
    String? special_type,
    String? llama_model_path,
  });
}

class _ApplicationLlamaLibraryDatabaseUpdateImpl
    implements _ApplicationLlamaLibraryDatabaseUpdate {
  const _ApplicationLlamaLibraryDatabaseUpdateImpl(this.collection);

  final DatabaseUniverseCollection<int, ApplicationLlamaLibraryDatabase>
      collection;

  @override
  bool call({
    required int id,
    Object? special_type = ignore,
    Object? llama_model_path = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (special_type != ignore) 1: special_type as String?,
          if (llama_model_path != ignore) 2: llama_model_path as String?,
        }) >
        0;
  }
}

sealed class _ApplicationLlamaLibraryDatabaseUpdateAll {
  int call({
    required List<int> id,
    String? special_type,
    String? llama_model_path,
  });
}

class _ApplicationLlamaLibraryDatabaseUpdateAllImpl
    implements _ApplicationLlamaLibraryDatabaseUpdateAll {
  const _ApplicationLlamaLibraryDatabaseUpdateAllImpl(this.collection);

  final DatabaseUniverseCollection<int, ApplicationLlamaLibraryDatabase>
      collection;

  @override
  int call({
    required List<int> id,
    Object? special_type = ignore,
    Object? llama_model_path = ignore,
  }) {
    return collection.updateProperties(id, {
      if (special_type != ignore) 1: special_type as String?,
      if (llama_model_path != ignore) 2: llama_model_path as String?,
    });
  }
}

extension ApplicationLlamaLibraryDatabaseUpdate
    on DatabaseUniverseCollection<int, ApplicationLlamaLibraryDatabase> {
  _ApplicationLlamaLibraryDatabaseUpdate get update =>
      _ApplicationLlamaLibraryDatabaseUpdateImpl(this);

  _ApplicationLlamaLibraryDatabaseUpdateAll get updateAll =>
      _ApplicationLlamaLibraryDatabaseUpdateAllImpl(this);
}

sealed class _ApplicationLlamaLibraryDatabaseQueryUpdate {
  int call({
    String? special_type,
    String? llama_model_path,
  });
}

class _ApplicationLlamaLibraryDatabaseQueryUpdateImpl
    implements _ApplicationLlamaLibraryDatabaseQueryUpdate {
  const _ApplicationLlamaLibraryDatabaseQueryUpdateImpl(this.query,
      {this.limit});

  final DatabaseUniverseQuery<ApplicationLlamaLibraryDatabase> query;
  final int? limit;

  @override
  int call({
    Object? special_type = ignore,
    Object? llama_model_path = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (special_type != ignore) 1: special_type as String?,
      if (llama_model_path != ignore) 2: llama_model_path as String?,
    });
  }
}

extension ApplicationLlamaLibraryDatabaseQueryUpdate
    on DatabaseUniverseQuery<ApplicationLlamaLibraryDatabase> {
  _ApplicationLlamaLibraryDatabaseQueryUpdate get updateFirst =>
      _ApplicationLlamaLibraryDatabaseQueryUpdateImpl(this, limit: 1);

  _ApplicationLlamaLibraryDatabaseQueryUpdate get updateAll =>
      _ApplicationLlamaLibraryDatabaseQueryUpdateImpl(this);
}

class _ApplicationLlamaLibraryDatabaseQueryBuilderUpdateImpl
    implements _ApplicationLlamaLibraryDatabaseQueryUpdate {
  const _ApplicationLlamaLibraryDatabaseQueryBuilderUpdateImpl(this.query,
      {this.limit});

  final QueryBuilder<ApplicationLlamaLibraryDatabase,
      ApplicationLlamaLibraryDatabase, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? special_type = ignore,
    Object? llama_model_path = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (special_type != ignore) 1: special_type as String?,
        if (llama_model_path != ignore) 2: llama_model_path as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension ApplicationLlamaLibraryDatabaseQueryBuilderUpdate on QueryBuilder<
    ApplicationLlamaLibraryDatabase,
    ApplicationLlamaLibraryDatabase,
    QOperations> {
  _ApplicationLlamaLibraryDatabaseQueryUpdate get updateFirst =>
      _ApplicationLlamaLibraryDatabaseQueryBuilderUpdateImpl(this, limit: 1);

  _ApplicationLlamaLibraryDatabaseQueryUpdate get updateAll =>
      _ApplicationLlamaLibraryDatabaseQueryBuilderUpdateImpl(this);
}

extension ApplicationLlamaLibraryDatabaseQueryFilter on QueryBuilder<
    ApplicationLlamaLibraryDatabase,
    ApplicationLlamaLibraryDatabase,
    QFilterCondition> {
  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
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

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterFilterCondition> llama_model_pathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterFilterCondition> llama_model_pathGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterFilterCondition> llama_model_pathGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterFilterCondition> llama_model_pathLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterFilterCondition> llama_model_pathLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterFilterCondition> llama_model_pathBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterFilterCondition> llama_model_pathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterFilterCondition> llama_model_pathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
          QAfterFilterCondition>
      llama_model_pathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
          QAfterFilterCondition>
      llama_model_pathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterFilterCondition> llama_model_pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterFilterCondition> llama_model_pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }
}

extension ApplicationLlamaLibraryDatabaseQueryObject on QueryBuilder<
    ApplicationLlamaLibraryDatabase,
    ApplicationLlamaLibraryDatabase,
    QFilterCondition> {}

extension ApplicationLlamaLibraryDatabaseQuerySortBy on QueryBuilder<
    ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase, QSortBy> {
  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterSortBy> sortBySpecial_type({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterSortBy> sortBySpecial_typeDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterSortBy> sortByLlama_model_path({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterSortBy> sortByLlama_model_pathDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension ApplicationLlamaLibraryDatabaseQuerySortThenBy on QueryBuilder<
    ApplicationLlamaLibraryDatabase,
    ApplicationLlamaLibraryDatabase,
    QSortThenBy> {
  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterSortBy> thenBySpecial_type({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterSortBy> thenBySpecial_typeDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterSortBy> thenByLlama_model_path({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterSortBy> thenByLlama_model_pathDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension ApplicationLlamaLibraryDatabaseQueryWhereDistinct on QueryBuilder<
    ApplicationLlamaLibraryDatabase,
    ApplicationLlamaLibraryDatabase,
    QDistinct> {
  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterDistinct> distinctBySpecial_type({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, ApplicationLlamaLibraryDatabase,
      QAfterDistinct> distinctByLlama_model_path({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }
}

extension ApplicationLlamaLibraryDatabaseQueryProperty1 on QueryBuilder<
    ApplicationLlamaLibraryDatabase,
    ApplicationLlamaLibraryDatabase,
    QProperty> {
  QueryBuilder<ApplicationLlamaLibraryDatabase, int, QAfterProperty>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, String, QAfterProperty>
      special_typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, String, QAfterProperty>
      llama_model_pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension ApplicationLlamaLibraryDatabaseQueryProperty2<R>
    on QueryBuilder<ApplicationLlamaLibraryDatabase, R, QAfterProperty> {
  QueryBuilder<ApplicationLlamaLibraryDatabase, (R, int), QAfterProperty>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, (R, String), QAfterProperty>
      special_typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, (R, String), QAfterProperty>
      llama_model_pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension ApplicationLlamaLibraryDatabaseQueryProperty3<R1, R2>
    on QueryBuilder<ApplicationLlamaLibraryDatabase, (R1, R2), QAfterProperty> {
  QueryBuilder<ApplicationLlamaLibraryDatabase, (R1, R2, int), QOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, (R1, R2, String), QOperations>
      special_typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ApplicationLlamaLibraryDatabase, (R1, R2, String), QOperations>
      llama_model_pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}
