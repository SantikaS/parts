package com.santika.parts.dao;

import com.santika.parts.model.PartEntity;
import com.santika.parts.model.PartsFilter;

import java.util.List;

public interface PartDao {
    void addPart(PartEntity partEntity);

    void updatePart(PartEntity partEntity);

    void removePart(int id);

    PartEntity getPartById(int id);

    List<PartEntity> listParts(PartsFilter filter);

    int partsCount(PartsFilter filter);

    int compsCount();
}
