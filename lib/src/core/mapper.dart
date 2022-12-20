abstract class MapperModelAsEntity<M, E> {
  E toEntity(M model);
  List<E> toEntities(List<M> models) => models.map((e) => toEntity(e)).toList();
}

abstract class MapperEntityAsModel<E, M> {
  M toModel(E model);
  List<M> toModels(List<E> models) => models.map((e) => toModel(e)).toList();
}

abstract class MapperAsObjectAnother<A, B> {
  B toObject(A a);
}
