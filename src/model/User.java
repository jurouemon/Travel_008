package model;

import java.io.Serializable;

public class User implements Serializable {
	private String idName;	// ユーザー名
	private String pass;	// パスワード
	private String name;

	public User() {}
	public User(String idName, String pass) {
		this.idName = idName;
		this.pass = pass;
	}
	public String getIDname() { return idName; }
	public String getPass() { return pass; }
	public void setName(String name) { this.name = name; }
	public String getName() { return name; }
}
