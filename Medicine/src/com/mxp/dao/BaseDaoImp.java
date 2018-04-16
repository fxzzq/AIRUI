package com.mxp.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.jdbc.Work;

@SuppressWarnings({ "rawtypes", "unchecked" })
public class BaseDaoImp<T> implements BaseDao<T> {

	protected SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	protected Session session;

	private Query query;

	public T findByID(Class c, Serializable id) throws Exception {

		session = sessionFactory.getCurrentSession();
		return (T) session.get(c, id);
	}

	public List<T> findList(String hql) throws Exception {
		session = sessionFactory.getCurrentSession();
		query = session.createQuery(hql);
		return query.list();
	}

	public List<T> findList(String hql, Map<String, Object> map) throws Exception {

		session = sessionFactory.getCurrentSession();
		List<T> list = null;
		query = session.createQuery(hql);
		if (map != null && !map.isEmpty()) {
			query.setProperties(map);
			list = query.list();
		}
		return list;
	}

	public List<T> findList(String hql, int page, int count) throws Exception {
		session = sessionFactory.getCurrentSession();
		query = session.createQuery(hql);
		query.setMaxResults(count);
		query.setFirstResult((page - 1) * count);
		return query.list();
	}

	public List<T> findList(String hql, Map<String, Object> map, int page, int count) throws Exception {
		session = sessionFactory.getCurrentSession();
		List<T> list = null;
		query = session.createQuery(hql);
		if (map != null && !map.isEmpty()) {
			query.setProperties(map);
			query.setMaxResults(count);
			query.setFirstResult((page - 1) * count);
			list = query.list();
		}
		return list;
	}

	public Object findUnique(String hql, Map<String, Object> map) throws Exception {
		session = sessionFactory.getCurrentSession();
		query = session.createQuery(hql);
		Object obj = null;
		if (map != null && !map.isEmpty()) {
			query.setProperties(map);
			obj = query.uniqueResult();
		}
		return obj;
	}

	public Object findUnique(String hql) throws Exception {
		session = sessionFactory.getCurrentSession();
		query = session.createQuery(hql);
		return query.uniqueResult();
	}

	public void save(T t) throws Exception {
		sessionFactory.getCurrentSession().save(t);
	}

	public void delete(T t) throws Exception {
		sessionFactory.getCurrentSession().delete(t);
	}

	public void update(T t) throws Exception {
		sessionFactory.getCurrentSession().update(t);
	}

	public void update(T t, Object[] obj) throws Exception {
		session = sessionFactory.getCurrentSession();
		for (Object o : obj) {
			session.evict(o);// 清空对象
		}
		session.update(t);
	}

	public void excute(final String hql) throws Exception {
		session = sessionFactory.getCurrentSession();

		session.doWork(new Work() {

			public void execute(Connection conn) throws SQLException {
				PreparedStatement pst = conn.prepareStatement(hql);
				pst.execute();
			}
		});
	}

}
