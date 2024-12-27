part of 'bloc.dart';

sealed class Events{
  const Events();
}

class FetchData extends Events{
  const FetchData();
}