// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CustomBlocBuilder<B extends StateStreamable<S>, S, TheSate extends S> extends CustomBlocBuilderBase<B, S, TheSate> {

//   const CustomBlocBuilder({
//     required this.builder,
//     required TheSate obj,
//     // Key? key,
//     // B? bloc,
//     bool Function(TheSate)? buildWhen,
//   }) : super(obj: obj, key: null, bloc: null, buildWhen: buildWhen);


//   final BlocWidgetBuilder<TheSate> builder;

//   @override
//   Widget build(BuildContext context, TheSate state) => builder(context, state);
// }


// abstract class CustomBlocBuilderBase<B extends StateStreamable<S>, S, TheSate extends S>
//     extends StatefulWidget {

//   const CustomBlocBuilderBase({Key? key, required this.obj, this.bloc, this.buildWhen,})
//       : super(key: key);

//   final B? bloc;
//   final TheSate obj;
//   final bool Function(TheSate)? buildWhen;

//   Widget build(BuildContext context, TheSate state);

//   @override
//   State<CustomBlocBuilderBase<B, S, TheSate>> createState() => _CustomBlocBuilderBaseState<B, S, TheSate>();
// }

// class _CustomBlocBuilderBaseState<B extends StateStreamable<S>, S, TheSate extends S>
//     extends State<CustomBlocBuilderBase<B, S, TheSate>> {
//   late B _bloc;
//   late S _state;
//   late TheSate _theSate;
//   B? oldBloc;
//   B? currentBloc;

//   @override
//   void initState() {
//     super.initState();
//     _bloc = widget.bloc ?? context.read<B>();
//     _state = _bloc.state;
//     if(_state is TheSate){
//       _theSate = _state as TheSate;
//     }else{
//      _theSate = widget.obj;
//     }
//   }

//   @override
//   void didUpdateWidget(CustomBlocBuilderBase<B, S, TheSate> oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     oldBloc = oldWidget.bloc ?? context.read<B>();
//     currentBloc = widget.bloc ?? oldBloc;
//     if (oldBloc != currentBloc) {
//       _bloc = currentBloc!;
//       _state = _bloc.state;
//     }
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final bloc = widget.bloc ?? context.read<B>();
//     if (_bloc != bloc) {
//       _bloc = bloc;
//       _state = _bloc.state;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.bloc == null) {
//       // Trigger a rebuild if the bloc reference has changed.
//       // See https://github.com/felangel/bloc/issues/2127.
//       context.select<B, bool>((bloc) => identical(_bloc, bloc));
//     }
//     return BlocListener<B, S>(
//       bloc: _bloc,
//       // listenWhen: (previous, current){
//       //   if (current is TheSate) {
//       //     if (previous is TheSate) {
//       //       if (previous != current) return widget.buildWhen!(current);
//       //       return false;
//       //     }
//       //     return widget.buildWhen!(current);
//       //   }
//       //   return false;
//       // },
//       listener: (context, state)
//       {
//         if(state is TheSate){
//           if(widget.buildWhen == null || widget.buildWhen!(state)){
//             setState((){
//               _state = state;
//               _theSate = state;
//             });
//           }
//         }
//       },
//       child: widget.build(context, _theSate),
//     );
//   }
// }
