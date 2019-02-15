package com.kdodd.algorithm.models;

import java.util.Date;
import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import org.mindrot.jbcrypt.BCrypt;

@Entity
@Table(name="users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String username;
	private String email;
	private String password;
	private String userLevel;
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	@OneToMany(mappedBy="user", fetch = FetchType.EAGER)
	private List<Algorithm> algorithms;
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
	private List<Article> articles;
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
	private List<Comment> comments;
	 @ManyToMany(fetch = FetchType.LAZY)
	    @JoinTable(
	        name = "users_followers", 
	        joinColumns = @JoinColumn(name = "user_id"), 
	        inverseJoinColumns = @JoinColumn(name = "follower_id")
	    )
	    private List<User> followers;
	 @ManyToMany(fetch = FetchType.LAZY)
	    @JoinTable(
	        name = "users_followers", 
	        joinColumns = @JoinColumn(name = "follower_id"), 
	        inverseJoinColumns = @JoinColumn(name = "user_id")
	    )
	    private List<User> followed;
	    
	public User() {
		
	}
	public User(Map<String, String> body) {
		this.username = body.get("username");
		this.email = body.get("email");
		this.password = BCrypt.hashpw(body.get("password"), BCrypt.gensalt());
		this.userLevel = body.get("userLevel");
		
	}
	
	public List<User> getFollowers() {
		return followers;
	}
	public void setFollowers(List<User> followers) {
		this.followers = followers;
	}
	public List<User> getFollowed() {
		return followed;
	}
	public void setFollowed(List<User> followed) {
		this.followed = followed;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUserName() {
		return username;
	}
	public void setUserName(String userName) {
		this.username = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public List<Algorithm> getAlgorithms() {
		return algorithms;
	}
	public void setAlgorithms(List<Algorithm> algorithms) {
		this.algorithms = algorithms;
	}
	public List<Article> getArticles() {
		return articles;
	}
	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	
}
