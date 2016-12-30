package com.practise;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class User implements Serializable{
	
	private static final long serialVersionUID = 6297385302078200511L;
	
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String mobile;
	private String address;
	private String email;
	private int age;
	private ArrayList<User> allUsers=new ArrayList<User>();
	
	
	public User(String username, String password, String firstname, String lastname, String mobile, String address,
			String email, int age) {
		super();
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.mobile = mobile;
		this.address = address;
		this.email = email;
		this.age = age;
	}
	
	public User(){
		super();
	}	

	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getFirstname() {
		return firstname;
	}


	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}


	public String getLastname() {
		return lastname;
	}


	public void setLastname(String lastname) {
		this.lastname = lastname;
	}


	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	@Override
	public String toString(){
		return "Name="+this.firstname+" "+this.lastname;
	}
	
	
	public ArrayList<User> getAllUsers() {
		return this.allUsers;
	}
	
	public void setAllUsers(ArrayList<User> allUsers){
		this.allUsers=allUsers;
	}
	
	public User getUser(String username) {
		for (User user : this.allUsers) {
			if (user.getUsername().equals(username)) {
				return user;
			}
		}
		return null;
	}


	public ArrayList<User> filter(String field,String key){
		ArrayList<User> filteredList=new ArrayList<User>();
		for (User user : this.allUsers) {
			switch (field) {
			case "firstname":
				if (user.getFirstname().equals(key)) {
					filteredList.add(user);
				}
				break;
			case "lastname":
				if (user.getLastname().equals(key)) {
					filteredList.add(user);
				}
				break;
			case "email":
				if (user.getEmail().equals(key)) {
					filteredList.add(user);
				}
				break;
			case "mobile":
				if (user.getMobile().equals(key)) {
					filteredList.add(user);
				}
				break;
			case "age":
				if (user.getAge()==Integer.valueOf(key)) {
					filteredList.add(user);
				}
				break;
			default:
				return new ArrayList<User>(this.allUsers);
			}
		}
		return filteredList;
	}
	
	public ArrayList<User> sort(final String field){
		ArrayList<User> filteredList=this.allUsers;


		Collections.sort(filteredList, new Comparator<User>() {
	        @Override public int compare(User u1, User u2) {
	            
	    			switch (field) {
	    			case "firstname":
	    				return u1.getFirstname().compareTo(u2.getFirstname());
	    			case "lastname":
	    				return u1.getLastname().compareTo(u2.getLastname());
	    			case "age":
	    				return u1.getAge()-u2.getAge();
	    			default:
	    				return 1;
	    			}
	        }

	    });
		
		return filteredList;
	}
	

	public int getCount() {
		return this.allUsers.size();
	}
	
	
}