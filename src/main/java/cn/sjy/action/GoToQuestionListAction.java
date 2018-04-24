package cn.sjy.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.opensymphony.xwork2.ActionContext;

import cn.sjy.db.Problem;
import cn.sjy.utils.HibernateUtil;

public class GoToQuestionListAction {
    public String execute() throws Exception {
	// 获取全部的问题列表信息传递给questionList.jsp。
	ActionContext actionContext = ActionContext.getContext();
	HttpServletRequest httpServletRequest = (HttpServletRequest) actionContext
		.get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);

	Session session = HibernateUtil.getSession();
	Transaction tx = session.beginTransaction();

	Query query = session.createQuery("from Problem");
	List<Problem> list = query.list();
	int problemNum = list.size();
	httpServletRequest.setAttribute("problemNum", problemNum);
	for (int i = 0; i < problemNum; i++) {
	    httpServletRequest.setAttribute("problem" + i, list.get(i));
	}

	tx.commit();
	session.close();

	return "success";
    }
}