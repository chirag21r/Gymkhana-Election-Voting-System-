package com.entity;

public class Candidate {
	
	private int id;
	private String candidate;
	private int votes;
	private String post;
	
	public Candidate() {
		
	}

	public Candidate(int id, String candidate, int votes, String post) {
		this.id = id;
		this.candidate = candidate;
		this.votes = votes;
		this.post = post;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCandidate() {
		return candidate;
	}

	public void setCandidate(String candidate) {
		this.candidate = candidate;
	}

	public int getVotes() {
		return votes;
	}

	public void setVotes(int votes) {
		this.votes = votes;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	@Override
	public String toString() {
		return "Candidate [id=" + id + ", candidate=" + candidate + ", votes=" + votes + ", post=" + post + "]";
	}
	
	
	
	

}
