import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class CitasWidget extends StatefulWidget {
  const CitasWidget({Key? key}) : super(key: key);

  @override
  _CitasWidgetState createState() => _CitasWidgetState();
}

class _CitasWidgetState extends State<CitasWidget> {
  List<CitasRecord> simpleSearchResults = [];
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CitasRecord>>(
      stream: queryCitasRecord(
        queryBuilder: (citasRecord) => citasRecord.orderBy('fecha'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<CitasRecord> citasCitasRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              'Citas',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 5, 20),
                            child: TextFormField(
                              controller: textController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController',
                                Duration(milliseconds: 100),
                                () async {
                                  setState(() {
                                    simpleSearchResults = TextSearch(
                                      citasCitasRecordList
                                          .map(
                                            (record) => TextSearchItem(record, [
                                              record.nombre!,
                                              record.hora!,
                                              record.servicio!
                                            ]),
                                          )
                                          .toList(),
                                    )
                                        .search(textController!.text)
                                        .map((r) => r.object)
                                        .take(10)
                                        .toList();
                                  });
                                  setState(() => FFAppState().buscando = true);
                                },
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Buscar...',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x003B3C3C),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x003B3C3C),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).lineColor,
                                prefixIcon: Icon(
                                  Icons.search_sharp,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                textController?.clear();
                              });
                              setState(() => FFAppState().buscando = false);
                            },
                            child: Icon(
                              Icons.close,
                              color: Color(0xFF394247),
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        if (FFAppState().buscando)
                          Builder(
                            builder: (context) {
                              final citasbusqueda =
                                  simpleSearchResults.map((e) => e).toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: citasbusqueda.length,
                                itemBuilder: (context, citasbusquedaIndex) {
                                  final citasbusquedaItem =
                                      citasbusqueda[citasbusquedaIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 5, 10, 5),
                                    child: Container(
                                      width: 100,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 10, 0, 0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SelectionArea(
                                                        child: Text(
                                                      dateTimeFormat(
                                                          'yMMMd',
                                                          citasbusquedaItem
                                                              .fecha!),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    )),
                                                    SelectionArea(
                                                        child: Text(
                                                      'Nombre: ${citasbusquedaItem.nombre}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    )),
                                                    SelectionArea(
                                                        child: Text(
                                                      'Hora: ${citasbusquedaItem.hora}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    )),
                                                    SelectionArea(
                                                        child: Text(
                                                      'Servicio: ${citasbusquedaItem.servicio}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    )),
                                                    SelectionArea(
                                                        child: Text(
                                                      'Dueño: ${citasbusquedaItem.dueno}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 20, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    await citasbusquedaItem
                                                        .reference
                                                        .delete();
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              dateTimeFormat(
                                                                  'yMMMd',
                                                                  citasbusquedaItem
                                                                      .fecha!)),
                                                          content: Text(
                                                              'La  cita ha sido cancelada'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    setState(() {
                                                      textController?.clear();
                                                    });
                                                    setState(() => FFAppState()
                                                        .buscando = false);
                                                  },
                                                  text: 'Cancelar',
                                                  options: FFButtonOptions(
                                                    width: 100,
                                                    height: 25,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 20, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    final archivoCreateData =
                                                        createArchivoRecordData(
                                                      hora: citasbusquedaItem
                                                          .hora,
                                                      fecha: citasbusquedaItem
                                                          .fecha,
                                                      nombre: citasbusquedaItem
                                                          .nombre,
                                                      servicio:
                                                          citasbusquedaItem
                                                              .servicio,
                                                    );
                                                    await ArchivoRecord.createDoc(
                                                            citasbusquedaItem
                                                                .parentReference)
                                                        .set(archivoCreateData);
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              citasbusquedaItem
                                                                  .fecha!
                                                                  .toString()),
                                                          content: Text(
                                                              'La cita ha sido archivada'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    await citasbusquedaItem
                                                        .reference
                                                        .delete();
                                                  },
                                                  text: 'Archivar',
                                                  options: FFButtonOptions(
                                                    width: 100,
                                                    height: 25,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        if (!FFAppState().buscando)
                          StreamBuilder<List<CitasRecord>>(
                            stream: queryCitasRecord(
                              queryBuilder: (citasRecord) =>
                                  citasRecord.orderBy('fecha'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<CitasRecord>
                                  todoslosusuariosCitasRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    todoslosusuariosCitasRecordList.length,
                                itemBuilder: (context, todoslosusuariosIndex) {
                                  final todoslosusuariosCitasRecord =
                                      todoslosusuariosCitasRecordList[
                                          todoslosusuariosIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 5, 10, 5),
                                    child: Container(
                                      width: 100,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 10, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SelectionArea(
                                                      child: Text(
                                                    dateTimeFormat(
                                                        'yMMMd',
                                                        todoslosusuariosCitasRecord
                                                            .fecha!),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 22,
                                                        ),
                                                  )),
                                                  SelectionArea(
                                                      child: Text(
                                                    'Nombre: ${todoslosusuariosCitasRecord.nombre}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  )),
                                                  SelectionArea(
                                                      child: Text(
                                                    'Hora: ${todoslosusuariosCitasRecord.hora}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  )),
                                                  SelectionArea(
                                                      child: Text(
                                                    'Servicio: ${todoslosusuariosCitasRecord.servicio}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  )),
                                                  SelectionArea(
                                                      child: Text(
                                                    'Dueño: ${valueOrDefault<String>(
                                                      todoslosusuariosCitasRecord
                                                          .dueno,
                                                      'nohay',
                                                    )}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 20, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    await todoslosusuariosCitasRecord
                                                        .reference
                                                        .delete();
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              dateTimeFormat(
                                                                  'yMMMd',
                                                                  todoslosusuariosCitasRecord
                                                                      .fecha!)),
                                                          content: Text(
                                                              'La cita ha sido cancelada'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  text: 'Cancelar',
                                                  options: FFButtonOptions(
                                                    width: 100,
                                                    height: 25,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 20, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    final archivoCreateData =
                                                        createArchivoRecordData(
                                                      fecha:
                                                          todoslosusuariosCitasRecord
                                                              .fecha,
                                                      nombre:
                                                          todoslosusuariosCitasRecord
                                                              .nombre,
                                                      servicio:
                                                          todoslosusuariosCitasRecord
                                                              .servicio,
                                                      hora:
                                                          todoslosusuariosCitasRecord
                                                              .hora,
                                                      dueno:
                                                          todoslosusuariosCitasRecord
                                                              .dueno,
                                                    );
                                                    await ArchivoRecord.createDoc(
                                                            todoslosusuariosCitasRecord
                                                                .parentReference)
                                                        .set(archivoCreateData);
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              dateTimeFormat(
                                                                  'yMMMd',
                                                                  todoslosusuariosCitasRecord
                                                                      .fecha!)),
                                                          content: Text(
                                                              'Su cita ha sido archivada'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    await todoslosusuariosCitasRecord
                                                        .reference
                                                        .delete();
                                                    setState(() {
                                                      textController?.clear();
                                                    });
                                                    setState(() => FFAppState()
                                                        .buscando = false);
                                                  },
                                                  text: 'Archivar',
                                                  options: FFButtonOptions(
                                                    width: 100,
                                                    height: 25,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
