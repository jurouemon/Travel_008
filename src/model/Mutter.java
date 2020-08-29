package model;

import java.io.Serializable;

// 評価に関する情報を持つJavaBeans
public class Mutter implements Serializable {
	private String userName;	// ユーザー名
	private String text;		// コメント内容
	private int star;		// 評価点

	public Mutter() {}
	public Mutter(String userName, String text, int star) {
		this.userName = userName;
		this.text = text;
		this.star = star;
	}
	public String getUserName() { return userName; }
	public String getText() { return text; }
	public int getStar() { return star; }
}
