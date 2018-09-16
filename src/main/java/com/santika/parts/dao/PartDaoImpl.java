package com.santika.parts.dao;

import com.santika.parts.model.PartEntity;
import com.santika.parts.model.PartsFilter;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

public class PartDaoImpl implements PartDao {

    private static final Logger logger = LoggerFactory.getLogger(PartDaoImpl.class);
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Override
    public void addPart(PartEntity partEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(partEntity);
        logger.info("Part added. Part : " + partEntity);
    }

    @Override
    public void updatePart(PartEntity partEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.update(partEntity);
        logger.info("Part updated. Part : " + partEntity);
    }

    @Override
    public void removePart(int id) {
        Session session = sessionFactory.getCurrentSession();
        PartEntity partEntity = session.load(PartEntity.class, id);
        if (partEntity != null) {
            session.delete(partEntity);
            logger.info("Part removed. Part : " + partEntity);
        } else {
            logger.info("Removing cancelled: part not found. Part id : " + id);
        }
    }

    @Override
    public PartEntity getPartById(int id) {
        Session session = sessionFactory.getCurrentSession();
        PartEntity partEntity = session.load(PartEntity.class, id);
        if (partEntity != null) {
            logger.info("Getting part by ID = " + id + ". Part : " + partEntity);
        } else {
            logger.info("Part not found by ID. Part id : " + id);
        }
        return partEntity;
    }

    @Override
    public List<PartEntity> listParts(PartsFilter filter) {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<PartEntity> cQuery = builder.createQuery(PartEntity.class);
        Root<PartEntity> root = cQuery.from(PartEntity.class);

        cQuery.select(root).where(getExpression(filter, builder, root));
        int length = filter.getPartsPerPage();
        int start = (filter.getPage() - 1) * length;
        List<PartEntity> partsList = session.createQuery(cQuery).
                setFirstResult(start).
                setMaxResults(length).getResultList();

        if (partsList.size() > 0)
            for (PartEntity partEntity : partsList)
                logger.info("PartsListEntity: " + partEntity);
        else
            logger.info("PartsList is empty.");
        return partsList;
    }

    private Expression<Boolean> getExpression(PartsFilter filter, CriteriaBuilder builder, Root<PartEntity> root) {
        Expression<Boolean> expression = builder.ge(root.get("id"), 0);


        if (filter.getNeed()==null)
            filter.setNeed("all");
        //Set default users per page value.
        if (filter.getPartsPerPage() < 1)
            filter.setPartsPerPage(10);

        //Set default page value.
        if (filter.getPage() < 1)
            filter.setPage(1);

        if (filter.getName() != null && !filter.getName().trim().equals(""))
            expression = builder.and(expression, builder.like(root.get("name"), "%" + filter.getName() + "%"));

        if (filter.getNeed().equals("true"))
            expression = builder.and(expression, builder.equal(root.get("need"), true));

        if (filter.getNeed().equals("false"))
            expression = builder.and(expression, builder.equal(root.get("need"), false));


        return expression;
    }

    @Override
    public int partsCount(PartsFilter filter) {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Long> cquery = builder.createQuery(Long.class);
        Root<PartEntity> root = cquery.from(PartEntity.class);
        cquery.select(builder.count(root)).where(getExpression(filter, builder, root));
        return (session.createQuery(cquery).getSingleResult()).intValue();
    }

    @Override
    public int compsCount() {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<PartEntity> cQuery = builder.createQuery(PartEntity.class);
        cQuery.from(PartEntity.class);
        List<PartEntity> partsList = session.createQuery(cQuery).getResultList();
        return leastNumber(partsList);

    }
    private int leastNumber(List<PartEntity> parts){
        int c=0;

        for (PartEntity part:parts) {
            if (part!=null && part.isNeed()&& c==0){
                    c=part.getNumber();
                    continue;
                }
            if (part!=null && part.isNeed() && part.getNumber()<c){
                c=part.getNumber();
            }
        }
        return c;
    }
}
