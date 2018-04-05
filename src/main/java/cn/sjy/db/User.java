package cn.sjy.db;

import java.io.Serializable;

import cn.sjy.utils.Authority;

public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    private String id;
    private String password;
    private Authority authority;

    public Authority getAuthority() {
	return authority;
    }

    public void setAuthority(Authority authority) {
	this.authority = authority;
    }

    public String getId() {
	return id;
    }

    public void setId(String id) {
	this.id = id;
    }

    public String getPassword() {
	return password;
    }

    public void setPassword(String password) {
	this.password = password;
    }
}
