import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/cupertino_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerSub = TextEditingController();

  List<RowItem> rowItems = [];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Lista de tarefas'),
        trailing: CupertinoButton(
          onPressed: () {
            showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('nova tarefa'),
                      content: Card(
                        elevation: 0.0,
                        child: Column(
                          children: [
                            CupertinoTextField(
                              controller: _controller,
                              placeholder: 'Título da tarefa',
                            ),
                            CupertinoTextField(
                              controller: _controllerSub,
                              placeholder: 'Subtítulo da tarefa',
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () {
                            setState(() {
                              rowItems.add(RowItem(
                                title: _controller.text,
                                subtitle: _controllerSub.text,
                              ));
                              _controller.text = '';
                              _controllerSub.text = '';
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('Salvar'),
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          isDestructiveAction: true,
                          child: const Text('Cancelar'),
                        ),
                      ],
                    ));
          },
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.add),
        ),
      ),
      child: ListView.builder(
          itemCount: rowItems.length,
          itemBuilder: (context, index) => rowItems[index]),
    );
  }
}

class RowItem extends StatefulWidget {
  RowItem(
      {super.key,
      required this.title,
      this.subtitle = '',
      this.isDone = false});

  String title;
  String subtitle;
  bool isDone;

  @override
  State<RowItem> createState() => _RowItemState();
}

class _RowItemState extends State<RowItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            widget.isDone = !widget.isDone;
          });
        },
        child: CupertinoListTiles(
          title: Text(widget.title),
          subtitle: Text(widget.subtitle),
          trailing: widget.isDone
              ? const Icon(
                  CupertinoIcons.check_mark,
                )
              : null,
        )

        // ListTile do Material removido e criado novo componente para Cupertino
        // ListTile(
        //   title: Text(widget.title),
        //   trailing: widget.isDone ? const Icon(CupertinoIcons.check_mark) : null,
        );
  }
}
