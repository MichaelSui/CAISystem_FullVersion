package cn.sjy.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.junit.Test;

import cn.sjy.db.CodeScore;
import cn.sjy.db.Notice;
import cn.sjy.db.Problem;
import cn.sjy.db.Question;
import cn.sjy.db.QuestionExample;
import cn.sjy.db.Reply;
import cn.sjy.db.User;
import cn.sjy.utils.FileUtils;
import cn.sjy.utils.HibernateUtil;

public class Demo {
    @Test
    public void test1() {
	Session session = HibernateUtil.getSession();
	Transaction tx = session.beginTransaction();

	Query query = session.createQuery("from User");
	List<User> list = query.list();
	for (User user : list) {
	    System.out.println(user.toString());
	}

	tx.commit();
	session.close();
    }

    @Test
    public void test2() {
	Session session = HibernateUtil.getSession();
	Transaction tx = session.beginTransaction();

	Query query = session.createQuery("from Question");
	List<Question> list = query.list();
	for (Question question : list) {
	    System.out.println(question.toString());
	}

	tx.commit();
	session.close();
    }

    @Test
    public void test3() {
	// String directory = "C:\\Users\\Michael\\Documents\\docker";
	// String fileName = "HelloWorld.cpp";
	// String content = "HelloWorld!";
	// System.out.println(FileUtils.writeFile(directory, fileName, content));
    }

    @Test
    public void test4() {
	Session session = HibernateUtil.getSession();
	Transaction tx = session.beginTransaction();

	Query query = session.createQuery("from QuestionExample");
	List<QuestionExample> list = query.list();
	for (QuestionExample questionExample : list) {
	    System.out.println(questionExample.getQuestionId());
	    System.out.println(questionExample.getExampleId());
	    System.out.println(questionExample.getInput());
	    System.out.println(questionExample.getOutput());
	}

	tx.commit();
	session.close();
    }

    @Test
    public void test5() {
	String directory = "C:\\Users\\Michael\\Documents\\docker\\question0";
	String fileName = "root";
	FileUtils.deleteAllFile(directory, fileName);
    }

    @Test
    public void test6() {
	Session session = HibernateUtil.getSession();
	Transaction tx = session.beginTransaction();

	Query query = session.createQuery("from CodeScore");
	List<CodeScore> list = query.list();

	tx.commit();
	session.close();
    }

    @Test
    public void test7() {
	Session session = HibernateUtil.getSession();
	Transaction tx = session.beginTransaction();

	Query query = session.createQuery("from Problem");
	List<Problem> list = query.list();

	tx.commit();
	session.close();
    }

    @Test
    public void test8() {
	Session session = HibernateUtil.getSession();
	Transaction tx = session.beginTransaction();

	Query query = session.createQuery("from Reply");
	List<Reply> list = query.list();

	tx.commit();
	session.close();
    }

    @Test
    public void test9() {
	Session session = HibernateUtil.getSession();
	Transaction tx = session.beginTransaction();

	Query query = session.createQuery("from Information");
	List<Reply> list = query.list();

	tx.commit();
	session.close();
    }

    @Test
    public void test10() {
	Session session = HibernateUtil.getSession();
	Transaction tx = session.beginTransaction();

	Query query = session.createQuery("from Notice");
	List<Reply> list = query.list();

	tx.commit();
	session.close();
    }

    @Test
    public void test11() {
	Session session = HibernateUtil.getSession();
	Transaction tx = session.beginTransaction();

	Notice n = new Notice();
	n.setDate(new Date());
	n.setContent("dsda dad asd ad sad a d as d asdasdad a d a d asd sa sdasdassda.");
	session.save(n);

	tx.commit();
	session.close();
    }

    @Test
    public void test12() {
	Session session = HibernateUtil.getSession();
	Transaction tx = session.beginTransaction();

	String hql = "delete from Question q where q.id = :id";
	Query query = session.createQuery(hql);
	query.setParameter("id", 100);
	query.executeUpdate();

	tx.commit();
	session.close();
    }

    @Test
    public void test13() {
	FileUtils.openDirectory("c:\\");
    }

    @Test
    public void test14() throws Exception {
	String str1 = "1321";
	System.out.println(cn.sjy.action.AddUsersAction.isNumeric(str1));
	String str2 = "0001";
	System.out.println(cn.sjy.action.AddUsersAction.isNumeric(str2));
	String str3 = "182a";
	System.out.println(cn.sjy.action.AddUsersAction.isNumeric(str3));
	String str4 = "a1002";
	System.out.println(cn.sjy.action.AddUsersAction.isNumeric(str4));
	String str5 = "adasda";
	System.out.println(cn.sjy.action.AddUsersAction.isNumeric(str5));
    }

    @Test
    public void test15() throws Exception {
	String str = "2018-05-11 11:50:16.936";
	Timestamp ts = Timestamp.valueOf(str);
	System.out.println(ts);
    }

    @Test
    public void test16() throws Exception {
	String realpath = "C:\\Users\\Michael\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\CAISystem\\files\\dockerFiles";
	String dockerMountPath = realpath;
	dockerMountPath = dockerMountPath.replaceAll(":", "");
	dockerMountPath = dockerMountPath.replaceAll("\\\\", "/");
	dockerMountPath = "/" + dockerMountPath;
	System.out.println(dockerMountPath);
    }
}
