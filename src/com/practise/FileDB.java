package com.practise;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class FileDB {
	ArrayList<User> allUsers = null;
	Gson gson = new Gson();
	String file;
	public User users = new User();

	public FileDB(String file) {
		String json = "";
		this.file = file;
		try {
			json = readFile(file, Charset.defaultCharset());
		} catch (IOException e) {
			e.printStackTrace();
		}
		Type allUsersType = new TypeToken<Collection<User>>() {
		}.getType();
		Collection<User> allUsersCollection = gson.fromJson(json, allUsersType);
		allUsers = new ArrayList<User>(allUsersCollection);
		users.setAllUsers(allUsers);

	}

	public void addUser(User user) {
		this.allUsers.add(user);
		String json = gson.toJson(this.allUsers);
		try (PrintWriter out = new PrintWriter(this.file)) {
			out.println(json);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	public void deleteUser(String username) {
		try{
		int i=0;
		int del_this=-1;
		for(User u:this.allUsers){
			if(username.equals(u.getUsername())){
				del_this=i;
			}
			if(del_this>=0){
				this.allUsers.remove(del_this);
			String json = gson.toJson(this.allUsers);
			try (PrintWriter out = new PrintWriter(this.file)) {
				out.println(json);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
			}
			i++;
		}
		}
		catch(Exception e){
			
		}
		
	}

	public boolean checkLogin(String username, String password) {
		try {
			if (users.getUser(username).getPassword().equals(password)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	private static String readFile(String path, Charset encoding) throws IOException {
		byte[] encoded = Files.readAllBytes(Paths.get(path));
		return new String(encoded, encoding);
	}

//	 public static void main(String[] args) {
//	 FileDB f = new FileDB("C:\\Users\\ptikkise\\workspace\\HelloWorld\\src\\com\\practise\\emp_data.json");
//	 System.out.println(f.checkLogin("Carolina", "Garner@3119"));
////	 System.out.println(users.getCount());
////	 f.addUser(new User("username", "pass", "sdf", "sdef", "sdf", "sdf",
////	 "sef", 12));
////	 System.out.println(users.getCount());
////	 for(User user:users.filter("firstname", "Cleveland")){
////	 System.out.println("username:"+user.getUsername());
////	 }
////	
////	 System.out.println("****************************");
////	
////	 for(User user:users.sort("firstname")){
////	 System.out.println("FirstName:"+user.getFirstname());
////	 }
////	
////	 System.out.println("############################");
//	 }
}
