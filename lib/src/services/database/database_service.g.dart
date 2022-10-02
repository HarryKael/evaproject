// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_service.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AplicacionDao? _getAplicacionDaoInstance;

  EgresadoDao? _getEgresadoDaoInstance;

  EmpresaDao? _getEmpresaDaoInstance;

  EmpresaOfertasDao? _getEmpresaOfertasDaoInstance;

  ExperienciaLaboralDao? _getExperienciaLaboralDaoInstance;

  FormacionAcademicaDao? _getFormacionAcademicaDaoInstance;

  OfertaDao? _getOfertaDaoInstance;

  OfertasAplicacionesDao? _getOfertasAplicacionesDaoInstance;

  ReferenciaDao? _getReferenciaDaoInstance;

  UsuarioEgresadoDao? _getUsuarioEgresadoDaoInstance;

  UsuarioEmpresaDao? _getUsuarioEmpresaDaoInstance;

  EgresadoReferenciasDao? _getEgresadoReferenciasDaoInstance;

  EgresadoFormacionesAcademicasDao?
      _getEgresadoFormacionesAcademicasDaoInstance;

  EgresadoExperienciasLabsDao? _getEgresadoExperienciasLabsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `aplicacion` (`idAplicacion` TEXT NOT NULL, `cedulaId` TEXT NOT NULL, `fechaAplicion` TEXT NOT NULL, FOREIGN KEY (`cedulaId`) REFERENCES `egresado` (`cedulaId`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`idAplicacion`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `egresado` (`cedulaId` TEXT NOT NULL, `nombreYApellido` TEXT NOT NULL, `estatura` REAL, `edad` INTEGER NOT NULL, `estadoCivil` TEXT NOT NULL, `sexo` TEXT NOT NULL, `correo` TEXT NOT NULL, `nivelEducativo` TEXT NOT NULL, `licenciaDeConducir` INTEGER NOT NULL, `vehiculoPropio` INTEGER NOT NULL, `telefonoCelular` TEXT, `telefonoResidencia` TEXT, `otro` TEXT, `fechaNacimiento` TEXT NOT NULL, `curriculo` TEXT, `disponibilidad` INTEGER NOT NULL, PRIMARY KEY (`cedulaId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `EmpresaModel` (`rncId` TEXT NOT NULL, `nombreComercial` TEXT NOT NULL, `direccion` TEXT NOT NULL, `telefono` TEXT NOT NULL, `email` TEXT NOT NULL, `web` TEXT NOT NULL, `nombreContacto` TEXT NOT NULL, `emailContacto` TEXT NOT NULL, PRIMARY KEY (`rncId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `empresa_ofertas` (`rncId` TEXT NOT NULL, `idOferta` TEXT NOT NULL, FOREIGN KEY (`rncId`) REFERENCES `EmpresaModel` (`rncId`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`idOferta`) REFERENCES `OfertaModel` (`idOferta`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`idOferta`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ExperienciaLaboralModel` (`idExperienciaLaboral` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `empresa` TEXT NOT NULL, `telefono` TEXT NOT NULL, `posicionDeTrabajo` TEXT NOT NULL, `desde` TEXT NOT NULL, `hasta` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `FormacionAcademicaModel` (`idFormacion` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `nivelAlcanzado` TEXT NOT NULL, `carreraOCurso` TEXT NOT NULL, `centroOInstitucion` TEXT NOT NULL, `desde` TEXT NOT NULL, `hasta` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `OfertaModel` (`idOferta` TEXT NOT NULL, `posicion` TEXT NOT NULL, `fechaPub` TEXT NOT NULL, `abre` TEXT NOT NULL, `cierra` TEXT NOT NULL, `beneficios` TEXT NOT NULL, `salario` REAL NOT NULL, `ubicacion` TEXT NOT NULL, `abierto` INTEGER NOT NULL, `versionPublicacion` TEXT NOT NULL, PRIMARY KEY (`idOferta`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ofertas_aplicaciones` (`idOferta` TEXT NOT NULL, `idAplicacion` TEXT NOT NULL, FOREIGN KEY (`idOferta`) REFERENCES `OfertaModel` (`idOferta`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`idAplicacion`) REFERENCES `aplicacion` (`idAplicacion`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`idAplicacion`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ReferenciaModel` (`idReferencia` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `nombreApellido` TEXT NOT NULL, `numero` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UsuarioEgresadoModel` (`idUsuario` TEXT NOT NULL, `password` TEXT NOT NULL, FOREIGN KEY (`idUsuario`) REFERENCES `egresado` (`cedulaId`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`idUsuario`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UsuarioEmpresaModel` (`idUsuario` TEXT NOT NULL, `password` TEXT NOT NULL, FOREIGN KEY (`idUsuario`) REFERENCES `EmpresaModel` (`rncId`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`idUsuario`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `EgresadoReferenciasModel` (`cedulaId` TEXT NOT NULL, `idReferencia` TEXT NOT NULL, FOREIGN KEY (`cedulaId`) REFERENCES `egresado` (`cedulaId`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`idReferencia`) REFERENCES `ReferenciaModel` (`idReferencia`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`idReferencia`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `EgresadoReferenciasModel` (`cedulaId` TEXT NOT NULL, `idFormacion` TEXT NOT NULL, FOREIGN KEY (`cedulaId`) REFERENCES `egresado` (`cedulaId`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`idFormacion`) REFERENCES `FormacionAcademicaModel` (`idFormacion`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`idFormacion`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `EgresadoReferenciasModel` (`cedulaId` TEXT NOT NULL, `idExperienciaLaboral` TEXT NOT NULL, FOREIGN KEY (`cedulaId`) REFERENCES `egresado` (`cedulaId`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`idExperienciaLaboral`) REFERENCES `ExperienciaLaboralModel` (`idExperienciaLaboral`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`idExperienciaLaboral`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AplicacionDao get getAplicacionDao {
    return _getAplicacionDaoInstance ??=
        _$AplicacionDao(database, changeListener);
  }

  @override
  EgresadoDao get getEgresadoDao {
    return _getEgresadoDaoInstance ??= _$EgresadoDao(database, changeListener);
  }

  @override
  EmpresaDao get getEmpresaDao {
    return _getEmpresaDaoInstance ??= _$EmpresaDao(database, changeListener);
  }

  @override
  EmpresaOfertasDao get getEmpresaOfertasDao {
    return _getEmpresaOfertasDaoInstance ??=
        _$EmpresaOfertasDao(database, changeListener);
  }

  @override
  ExperienciaLaboralDao get getExperienciaLaboralDao {
    return _getExperienciaLaboralDaoInstance ??=
        _$ExperienciaLaboralDao(database, changeListener);
  }

  @override
  FormacionAcademicaDao get getFormacionAcademicaDao {
    return _getFormacionAcademicaDaoInstance ??=
        _$FormacionAcademicaDao(database, changeListener);
  }

  @override
  OfertaDao get getOfertaDao {
    return _getOfertaDaoInstance ??= _$OfertaDao(database, changeListener);
  }

  @override
  OfertasAplicacionesDao get getOfertasAplicacionesDao {
    return _getOfertasAplicacionesDaoInstance ??=
        _$OfertasAplicacionesDao(database, changeListener);
  }

  @override
  ReferenciaDao get getReferenciaDao {
    return _getReferenciaDaoInstance ??=
        _$ReferenciaDao(database, changeListener);
  }

  @override
  UsuarioEgresadoDao get getUsuarioEgresadoDao {
    return _getUsuarioEgresadoDaoInstance ??=
        _$UsuarioEgresadoDao(database, changeListener);
  }

  @override
  UsuarioEmpresaDao get getUsuarioEmpresaDao {
    return _getUsuarioEmpresaDaoInstance ??=
        _$UsuarioEmpresaDao(database, changeListener);
  }

  @override
  EgresadoReferenciasDao get getEgresadoReferenciasDao {
    return _getEgresadoReferenciasDaoInstance ??=
        _$EgresadoReferenciasDao(database, changeListener);
  }

  @override
  EgresadoFormacionesAcademicasDao get getEgresadoFormacionesAcademicasDao {
    return _getEgresadoFormacionesAcademicasDaoInstance ??=
        _$EgresadoFormacionesAcademicasDao(database, changeListener);
  }

  @override
  EgresadoExperienciasLabsDao get getEgresadoExperienciasLabsDao {
    return _getEgresadoExperienciasLabsDaoInstance ??=
        _$EgresadoExperienciasLabsDao(database, changeListener);
  }
}

class _$AplicacionDao extends AplicacionDao {
  _$AplicacionDao(
    this.database,
    this.changeListener,
  ) : _aplicacionModelInsertionAdapter = InsertionAdapter(
            database,
            'aplicacion',
            (AplicacionModel item) => <String, Object?>{
                  'idAplicacion': item.idAplicacion,
                  'cedulaId': item.cedulaId,
                  'fechaAplicion': item.fechaAplicion
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<AplicacionModel> _aplicacionModelInsertionAdapter;

  @override
  Future<void> insertAplicacion(AplicacionModel aplicationModel) async {
    await _aplicacionModelInsertionAdapter.insert(
        aplicationModel, OnConflictStrategy.abort);
  }
}

class _$EgresadoDao extends EgresadoDao {
  _$EgresadoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _egresadoModelInsertionAdapter = InsertionAdapter(
            database,
            'egresado',
            (EgresadoModel item) => <String, Object?>{
                  'cedulaId': item.cedulaId,
                  'nombreYApellido': item.nombreYApellido,
                  'estatura': item.estatura,
                  'edad': item.edad,
                  'estadoCivil': item.estadoCivil,
                  'sexo': item.sexo,
                  'correo': item.correo,
                  'nivelEducativo': item.nivelEducativo,
                  'licenciaDeConducir': item.licenciaDeConducir ? 1 : 0,
                  'vehiculoPropio': item.vehiculoPropio ? 1 : 0,
                  'telefonoCelular': item.telefonoCelular,
                  'telefonoResidencia': item.telefonoResidencia,
                  'otro': item.otro,
                  'fechaNacimiento': item.fechaNacimiento,
                  'curriculo': item.curriculo,
                  'disponibilidad': item.disponibilidad ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<EgresadoModel> _egresadoModelInsertionAdapter;

  @override
  Future<List<EgresadoModel>> getEgresados() async {
    return _queryAdapter.queryList('SELECT * FROM egresado',
        mapper: (Map<String, Object?> row) => EgresadoModel(
            cedulaId: row['cedulaId'] as String,
            nombreYApellido: row['nombreYApellido'] as String,
            estatura: row['estatura'] as double?,
            edad: row['edad'] as int,
            estadoCivil: row['estadoCivil'] as String,
            sexo: row['sexo'] as String,
            correo: row['correo'] as String,
            nivelEducativo: row['nivelEducativo'] as String,
            licenciaDeConducir: (row['licenciaDeConducir'] as int) != 0,
            vehiculoPropio: (row['vehiculoPropio'] as int) != 0,
            telefonoCelular: row['telefonoCelular'] as String?,
            telefonoResidencia: row['telefonoResidencia'] as String?,
            otro: row['otro'] as String?,
            fechaNacimiento: row['fechaNacimiento'] as String,
            curriculo: row['curriculo'] as String?,
            disponibilidad: (row['disponibilidad'] as int) != 0));
  }

  @override
  Future<void> aceptarEgresado(String id) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE egresado SET disponibilidad = false WHERE cedulaId = ?1',
        arguments: [id]);
  }

  @override
  Future<void> updateCurriculo(
    String path,
    String id,
  ) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE egresado SET curriculo = ?1 WHERE cedulaId = ?2',
        arguments: [path, id]);
  }

  @override
  Future<List<EgresadoModel>> getEgresadosNoDisponibles() async {
    return _queryAdapter.queryList(
        'SELECT * FROM egresado WHERE disponibilidad = 0',
        mapper: (Map<String, Object?> row) => EgresadoModel(
            cedulaId: row['cedulaId'] as String,
            nombreYApellido: row['nombreYApellido'] as String,
            estatura: row['estatura'] as double?,
            edad: row['edad'] as int,
            estadoCivil: row['estadoCivil'] as String,
            sexo: row['sexo'] as String,
            correo: row['correo'] as String,
            nivelEducativo: row['nivelEducativo'] as String,
            licenciaDeConducir: (row['licenciaDeConducir'] as int) != 0,
            vehiculoPropio: (row['vehiculoPropio'] as int) != 0,
            telefonoCelular: row['telefonoCelular'] as String?,
            telefonoResidencia: row['telefonoResidencia'] as String?,
            otro: row['otro'] as String?,
            fechaNacimiento: row['fechaNacimiento'] as String,
            curriculo: row['curriculo'] as String?,
            disponibilidad: (row['disponibilidad'] as int) != 0));
  }

  @override
  Future<List<EgresadoModel>> getEgresadosDisponibles() async {
    return _queryAdapter.queryList(
        'SELECT * FROM egresado WHERE disponibilidad = 1',
        mapper: (Map<String, Object?> row) => EgresadoModel(
            cedulaId: row['cedulaId'] as String,
            nombreYApellido: row['nombreYApellido'] as String,
            estatura: row['estatura'] as double?,
            edad: row['edad'] as int,
            estadoCivil: row['estadoCivil'] as String,
            sexo: row['sexo'] as String,
            correo: row['correo'] as String,
            nivelEducativo: row['nivelEducativo'] as String,
            licenciaDeConducir: (row['licenciaDeConducir'] as int) != 0,
            vehiculoPropio: (row['vehiculoPropio'] as int) != 0,
            telefonoCelular: row['telefonoCelular'] as String?,
            telefonoResidencia: row['telefonoResidencia'] as String?,
            otro: row['otro'] as String?,
            fechaNacimiento: row['fechaNacimiento'] as String,
            curriculo: row['curriculo'] as String?,
            disponibilidad: (row['disponibilidad'] as int) != 0));
  }

  @override
  Future<EgresadoModel?> getEgresado(String id) async {
    return _queryAdapter.query('SELECT * FROM egresado WHERE cedulaId = ?1',
        mapper: (Map<String, Object?> row) => EgresadoModel(
            cedulaId: row['cedulaId'] as String,
            nombreYApellido: row['nombreYApellido'] as String,
            estatura: row['estatura'] as double?,
            edad: row['edad'] as int,
            estadoCivil: row['estadoCivil'] as String,
            sexo: row['sexo'] as String,
            correo: row['correo'] as String,
            nivelEducativo: row['nivelEducativo'] as String,
            licenciaDeConducir: (row['licenciaDeConducir'] as int) != 0,
            vehiculoPropio: (row['vehiculoPropio'] as int) != 0,
            telefonoCelular: row['telefonoCelular'] as String?,
            telefonoResidencia: row['telefonoResidencia'] as String?,
            otro: row['otro'] as String?,
            fechaNacimiento: row['fechaNacimiento'] as String,
            curriculo: row['curriculo'] as String?,
            disponibilidad: (row['disponibilidad'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<List<EgresadoModel>> getAplicantes(String idOferta) async {
    return _queryAdapter.queryList(
        'SELECT * FROM egresado as egre INNER JOIN aplicacion AS ap ON ap.cedulaId = egre.cedulaId INNER JOIN ofertas_aplicaciones as of ON of.idOferta = ?1 WHERE of.idAplicacion = ap.idAplicacion',
        mapper: (Map<String, Object?> row) => EgresadoModel(cedulaId: row['cedulaId'] as String, nombreYApellido: row['nombreYApellido'] as String, estatura: row['estatura'] as double?, edad: row['edad'] as int, estadoCivil: row['estadoCivil'] as String, sexo: row['sexo'] as String, correo: row['correo'] as String, nivelEducativo: row['nivelEducativo'] as String, licenciaDeConducir: (row['licenciaDeConducir'] as int) != 0, vehiculoPropio: (row['vehiculoPropio'] as int) != 0, telefonoCelular: row['telefonoCelular'] as String?, telefonoResidencia: row['telefonoResidencia'] as String?, otro: row['otro'] as String?, fechaNacimiento: row['fechaNacimiento'] as String, curriculo: row['curriculo'] as String?, disponibilidad: (row['disponibilidad'] as int) != 0),
        arguments: [idOferta]);
  }

  @override
  Future<void> insertEgresado(EgresadoModel egresadoModel) async {
    await _egresadoModelInsertionAdapter.insert(
        egresadoModel, OnConflictStrategy.abort);
  }
}

class _$EmpresaDao extends EmpresaDao {
  _$EmpresaDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _empresaModelInsertionAdapter = InsertionAdapter(
            database,
            'EmpresaModel',
            (EmpresaModel item) => <String, Object?>{
                  'rncId': item.rncId,
                  'nombreComercial': item.nombreComercial,
                  'direccion': item.direccion,
                  'telefono': item.telefono,
                  'email': item.email,
                  'web': item.web,
                  'nombreContacto': item.nombreContacto,
                  'emailContacto': item.emailContacto
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<EmpresaModel> _empresaModelInsertionAdapter;

  @override
  Future<List<EmpresaModel>> getEgresados() async {
    return _queryAdapter.queryList('SELECT * FROM EmpresaModel',
        mapper: (Map<String, Object?> row) => EmpresaModel(
            rncId: row['rncId'] as String,
            nombreComercial: row['nombreComercial'] as String,
            direccion: row['direccion'] as String,
            telefono: row['telefono'] as String,
            email: row['email'] as String,
            web: row['web'] as String,
            nombreContacto: row['nombreContacto'] as String,
            emailContacto: row['emailContacto'] as String));
  }

  @override
  Future<EmpresaModel?> getEmpresa(String id) async {
    return _queryAdapter.query('SELECT * FROM EmpresaModel WHERE rncId = ?1',
        mapper: (Map<String, Object?> row) => EmpresaModel(
            rncId: row['rncId'] as String,
            nombreComercial: row['nombreComercial'] as String,
            direccion: row['direccion'] as String,
            telefono: row['telefono'] as String,
            email: row['email'] as String,
            web: row['web'] as String,
            nombreContacto: row['nombreContacto'] as String,
            emailContacto: row['emailContacto'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertEmpresa(EmpresaModel empresaModel) async {
    await _empresaModelInsertionAdapter.insert(
        empresaModel, OnConflictStrategy.abort);
  }
}

class _$EmpresaOfertasDao extends EmpresaOfertasDao {
  _$EmpresaOfertasDao(
    this.database,
    this.changeListener,
  ) : _queryAdapter = QueryAdapter(database);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  @override
  Future<void> insertOferta(
    String rncId,
    String idOferta,
  ) async {
    await _queryAdapter.queryNoReturn(
        'INSERT INTO empresa_ofertas (\'rncId\', \'idOferta\') VALUES (?1, ?2)',
        arguments: [rncId, idOferta]);
  }

  @override
  Future<List<EmpresaOfertasModel>> getEmpresaOfertas(String id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM empresa_ofertas WHERE rncId = ?1',
        mapper: (Map<String, Object?> row) => EmpresaOfertasModel(
            rncId: row['rncId'] as String, idOferta: row['idOferta'] as String),
        arguments: [id]);
  }

  @override
  Future<EmpresaOfertasModel?> getEmpresaOfertasByOferta(String id) async {
    return _queryAdapter.query(
        'SELECT * FROM empresa_ofertas WHERE idOferta = ?1',
        mapper: (Map<String, Object?> row) => EmpresaOfertasModel(
            rncId: row['rncId'] as String, idOferta: row['idOferta'] as String),
        arguments: [id]);
  }
}

class _$ExperienciaLaboralDao extends ExperienciaLaboralDao {
  _$ExperienciaLaboralDao(
    this.database,
    this.changeListener,
  );

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;
}

class _$FormacionAcademicaDao extends FormacionAcademicaDao {
  _$FormacionAcademicaDao(
    this.database,
    this.changeListener,
  );

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;
}

class _$OfertaDao extends OfertaDao {
  _$OfertaDao(
    this.database,
    this.changeListener,
  ) : _queryAdapter = QueryAdapter(database);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  @override
  Future<void> insertOferta(
    String idOferta,
    String posicion,
    String fechaPub,
    String abre,
    String cierra,
    String beneficios,
    double salario,
    String ubicacion,
    bool abierto,
    String versionPublicacion,
  ) async {
    await _queryAdapter.queryNoReturn(
        'INSERT INTO OfertaModel (\'idOferta\', \'posicion\', \'fechaPub\', \'abre\', \'cierra\', \'beneficios\', \'salario\', \'ubicacion\', \'abierto\', \'versionPublicacion\') VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10)',
        arguments: [
          idOferta,
          posicion,
          fechaPub,
          abre,
          cierra,
          beneficios,
          salario,
          ubicacion,
          abierto ? 1 : 0,
          versionPublicacion
        ]);
  }

  @override
  Future<void> aceptarEgresado(String id) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE OfertaModel SET abierto = false WHERE idOferta = ?1',
        arguments: [id]);
  }

  @override
  Future<OfertaModel?> getOferta(String id) async {
    return _queryAdapter.query('SELECT * FROM OfertaModel WHERE idOferta = ?1',
        mapper: (Map<String, Object?> row) => OfertaModel(
            idOferta: row['idOferta'] as String,
            posicion: row['posicion'] as String,
            fechaPub: row['fechaPub'] as String,
            abre: row['abre'] as String,
            cierra: row['cierra'] as String,
            beneficios: row['beneficios'] as String,
            salario: row['salario'] as double,
            ubicacion: row['ubicacion'] as String,
            abierto: (row['abierto'] as int) != 0,
            versionPublicacion: row['versionPublicacion'] as String),
        arguments: [id]);
  }

  @override
  Future<List<OfertaModel>> getAllOferts() async {
    return _queryAdapter.queryList('SELECT * FROM OfertaModel',
        mapper: (Map<String, Object?> row) => OfertaModel(
            idOferta: row['idOferta'] as String,
            posicion: row['posicion'] as String,
            fechaPub: row['fechaPub'] as String,
            abre: row['abre'] as String,
            cierra: row['cierra'] as String,
            beneficios: row['beneficios'] as String,
            salario: row['salario'] as double,
            ubicacion: row['ubicacion'] as String,
            abierto: (row['abierto'] as int) != 0,
            versionPublicacion: row['versionPublicacion'] as String));
  }
}

class _$OfertasAplicacionesDao extends OfertasAplicacionesDao {
  _$OfertasAplicacionesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _ofertasAplicacionesModelInsertionAdapter = InsertionAdapter(
            database,
            'ofertas_aplicaciones',
            (OfertasAplicacionesModel item) => <String, Object?>{
                  'idOferta': item.idOferta,
                  'idAplicacion': item.idAplicacion
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<OfertasAplicacionesModel>
      _ofertasAplicacionesModelInsertionAdapter;

  @override
  Future<List<OfertasAplicacionesModel>> getOfertasAplicacionesModelByIdOferta(
    String idOferta,
    String cedulaId,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM ofertas_aplicaciones AS of INNER JOIN aplicacion as ap ON ap.idAplicacion = of.idAplicacion WHERE idOferta = ?1 AND ap.cedulaId = ?2',
        mapper: (Map<String, Object?> row) => OfertasAplicacionesModel(idOferta: row['idOferta'] as String, idAplicacion: row['idAplicacion'] as String),
        arguments: [idOferta, cedulaId]);
  }

  @override
  Future<void> insertOfertasApliciones(
      OfertasAplicacionesModel ofertasAplicacionesModel) async {
    await _ofertasAplicacionesModelInsertionAdapter.insert(
        ofertasAplicacionesModel, OnConflictStrategy.abort);
  }
}

class _$ReferenciaDao extends ReferenciaDao {
  _$ReferenciaDao(
    this.database,
    this.changeListener,
  );

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;
}

class _$UsuarioEgresadoDao extends UsuarioEgresadoDao {
  _$UsuarioEgresadoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _usuarioEgresadoModelInsertionAdapter = InsertionAdapter(
            database,
            'UsuarioEgresadoModel',
            (UsuarioEgresadoModel item) => <String, Object?>{
                  'idUsuario': item.idUsuario,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UsuarioEgresadoModel>
      _usuarioEgresadoModelInsertionAdapter;

  @override
  Future<List<UsuarioEgresadoModel>> getAllUsuariosEgresados() async {
    return _queryAdapter.queryList('SELECT * FROM UsuarioEgresadoModel',
        mapper: (Map<String, Object?> row) => UsuarioEgresadoModel(
            idUsuario: row['idUsuario'] as String,
            password: row['password'] as String));
  }

  @override
  Future<UsuarioEgresadoModel?> getUsuarioEgresado(
    String idUsuario,
    String password,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM UsuarioEgresadoModel WHERE idUsuario = ?1 AND password = ?2',
        mapper: (Map<String, Object?> row) => UsuarioEgresadoModel(idUsuario: row['idUsuario'] as String, password: row['password'] as String),
        arguments: [idUsuario, password]);
  }

  @override
  Future<void> insertUsuarioEgresado(UsuarioEgresadoModel userEgresado) async {
    await _usuarioEgresadoModelInsertionAdapter.insert(
        userEgresado, OnConflictStrategy.abort);
  }
}

class _$UsuarioEmpresaDao extends UsuarioEmpresaDao {
  _$UsuarioEmpresaDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _usuarioEmpresaModelInsertionAdapter = InsertionAdapter(
            database,
            'UsuarioEmpresaModel',
            (UsuarioEmpresaModel item) => <String, Object?>{
                  'idUsuario': item.idUsuario,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UsuarioEmpresaModel>
      _usuarioEmpresaModelInsertionAdapter;

  @override
  Future<List<UsuarioEmpresaModel>> getAllUsuariosEmpresa() async {
    return _queryAdapter.queryList('SELECT * FROM UsuarioEmpresaModel',
        mapper: (Map<String, Object?> row) => UsuarioEmpresaModel(
            idUsuario: row['idUsuario'] as String,
            password: row['password'] as String));
  }

  @override
  Future<UsuarioEmpresaModel?> getUsuarioEmpresa(
    String idUsuario,
    String password,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM UsuarioEmpresaModel WHERE idUsuario = ?1 AND password = ?2',
        mapper: (Map<String, Object?> row) => UsuarioEmpresaModel(idUsuario: row['idUsuario'] as String, password: row['password'] as String),
        arguments: [idUsuario, password]);
  }

  @override
  Future<void> insertUsuarioEmpresa(UsuarioEmpresaModel userEgresado) async {
    await _usuarioEmpresaModelInsertionAdapter.insert(
        userEgresado, OnConflictStrategy.abort);
  }
}

class _$EgresadoReferenciasDao extends EgresadoReferenciasDao {
  _$EgresadoReferenciasDao(
    this.database,
    this.changeListener,
  );

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;
}

class _$EgresadoFormacionesAcademicasDao
    extends EgresadoFormacionesAcademicasDao {
  _$EgresadoFormacionesAcademicasDao(
    this.database,
    this.changeListener,
  );

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;
}

class _$EgresadoExperienciasLabsDao extends EgresadoExperienciasLabsDao {
  _$EgresadoExperienciasLabsDao(
    this.database,
    this.changeListener,
  );

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;
}
