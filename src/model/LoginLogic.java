package model;

public class LoginLogic {
	// 登録者情報を設定
	String[] name = { "湊", "綾部", "菅原" };
	String[] idName = { "minato", "ayabe", "sugawara" };
	String[] pass = { "0001", "0002", "0003" };

	public boolean execute(User user) {
		for (int i = 0; i < idName.length; i++) {
			if (user.getIDname().equals(idName[i]) && user.getPass().equals(pass[i])) {
				return true;
			}
		}
		return false;
	}
	public String chkName(String id) {
		for (int i = 0; i < name.length; i++) {
			if (id.equals(idName[i])) {
				return name[i];
			}
		}
		return null;
	}
}
