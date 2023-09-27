package VO;

public class UserVO {
	private String user_ID;
	private String user_PW;
	private String phone_Num;
	private String corp_Name;
	
	
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	
	public String getUser_PW() {
		return user_PW;
	}
	public void setUser_PW(String user_PW) {
		this.user_PW = user_PW;
	}
	public String getPhone_Num() {
		return phone_Num;
	}
	public void setPhone_Num(String phone_Num) {
		this.phone_Num = phone_Num;
	}
	public String getCorp_Name() {
		return corp_Name;
	}
	public void setCorp_Name(String corp_Name) {
		this.corp_Name = corp_Name;
	}

	@Override
	public String toString() {
	    return "UserVO [user_ID=" + user_ID + ", user_PW=" + user_PW + ", phone_Num=" + phone_Num + ", corp_Name=" + corp_Name + "]";
	}
}
