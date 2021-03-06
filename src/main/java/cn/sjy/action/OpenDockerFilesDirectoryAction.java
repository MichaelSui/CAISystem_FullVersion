package cn.sjy.action;

import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

import cn.sjy.utils.FileUtils;

public class OpenDockerFilesDirectoryAction {
    public String execute() throws Exception {
	try {
	    // 打开程序所在的目录。
	    String path = ServletActionContext.getServletContext().getRealPath("/files/dockerFiles");
	    FileUtils.openDirectory(path);

	    return "success";
	} catch (Exception e) {
	    e.printStackTrace();

	    ActionContext actionContext = ActionContext.getContext();
	    Map<String, Object> httpSession = actionContext.getSession();
	    httpSession.put("errorMsg", "OpenDockerFilesAction抛出了异常");
	    return "error";
	}
    }
}
