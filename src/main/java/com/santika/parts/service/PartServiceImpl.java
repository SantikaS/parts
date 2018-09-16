package com.santika.parts.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.santika.parts.dao.PartDao;
import com.santika.parts.model.PartEntity;
import com.santika.parts.model.PartsFilter;

import java.util.List;

@Service
public class PartServiceImpl implements PartService {
    private PartDao partDao;

    public void setPartDao(PartDao partDao) {
        this.partDao = partDao;
    }


    @Override
    @Transactional
    public void addPart(PartEntity partEntity) {
        partDao.addPart(partEntity);
    }

    @Override
    @Transactional
    public void updatePart(PartEntity partEntity) {

        partDao.updatePart(partEntity);
    }

    @Override
    @Transactional
    public void removePart(int id) {
        partDao.removePart(id);

    }

    @Override
    @Transactional
    public PartEntity getPartById(int id) {
        return partDao.getPartById(id);
    }

    @Override
    @Transactional
    public List<PartEntity> listParts(PartsFilter filter) {
        return partDao.listParts(filter);
    }

    @Override
    @Transactional
    public int partsCount(PartsFilter filter) {
        return partDao.partsCount(filter);
    }

    @Override
    @Transactional
    public int compsCount() {
        return partDao.compsCount();
    }

}
