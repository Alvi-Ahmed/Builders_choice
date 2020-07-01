// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Todo extends DataClass implements Insertable<Todo> {
  final String name;
  final String content;
  Todo({@required this.name, @required this.content});
  factory Todo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Todo(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Todo(
      name: serializer.fromJson<String>(json['name']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'content': serializer.toJson<String>(content),
    };
  }

  Todo copyWith({String name, String content}) => Todo(
        name: name ?? this.name,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('name: $name, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(name.hashCode, content.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Todo &&
          other.name == this.name &&
          other.content == this.content);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<String> name;
  final Value<String> content;
  const TodosCompanion({
    this.name = const Value.absent(),
    this.content = const Value.absent(),
  });
  TodosCompanion.insert({
    @required String name,
    @required String content,
  })  : name = Value(name),
        content = Value(content);
  static Insertable<Todo> custom({
    Expression<String> name,
    Expression<String> content,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (content != null) 'content': content,
    });
  }

  TodosCompanion copyWith({Value<String> name, Value<String> content}) {
    return TodosCompanion(
      name: name ?? this.name,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('name: $name, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class Todos extends Table
    with TableInfo<Todos, Todo>, VirtualTableInfo<Todos, Todo> {
  final GeneratedDatabase _db;
  final String _alias;
  Todos(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: '');
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn('content', $tableName, false,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [name, content];
  @override
  Todos get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'todos';
  @override
  final String actualTableName = 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content'], _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Todo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Todo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Todos createAlias(String alias) {
    return Todos(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs => 'fts5(name, content)';
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  Todos _todos;
  Todos get todos => _todos ??= Todos(this);
  Selectable<Todo> todoscol() {
    return customSelect('SELECT * FROM todos',
        variables: [], readsFrom: {todos}).map(todos.mapFromRow);
  }

  Future<int> createEntry(String name, String content) {
    return customInsert(
      'INSERT INTO todos (name, content) VALUES (:name, :content)',
      variables: [Variable.withString(name), Variable.withString(content)],
      updates: {todos},
    );
  }

  Selectable<Todo> featuresWithFts5() {
    return customSelect(
        'SELECT * FROM todos WHERE todos MATCH \'fts5\' ORDER BY rank',
        variables: [],
        readsFrom: {todos}).map(todos.mapFromRow);
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todos];
}
