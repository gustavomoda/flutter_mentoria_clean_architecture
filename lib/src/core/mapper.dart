abstract class MapperEntity<E, M> {
  E toEntity(M model);
  List<E> toEntities(List<M> models) => models.map((e) => toEntity(e)).toList();
}

abstract class MapperModel<M, E> {
  M toModel(E entity);
  List<M> toModels(List<E> entities) => entities.map((m) => toModel(m)).toList();
}
