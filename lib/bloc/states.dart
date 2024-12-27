part of 'bloc.dart';

sealed class States{}

final class FetchingState extends States{}

final class FetchedState extends States{
  final num balance;
  final List<Model> transactions; 
  FetchedState({ required this.balance,required this.transactions});
}

final class ErrorState extends States{
  final String message;
  ErrorState({required this.message});
}