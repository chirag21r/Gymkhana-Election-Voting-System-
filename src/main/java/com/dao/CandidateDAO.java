package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Candidate;


public class CandidateDAO {
	
	
private Connection conn;
	
	public CandidateDAO(Connection conn) {
		this.conn = conn;
	}
	
	
	
	

	//view Candidates  (View votes of candidates)


	public List<Candidate> getCandidates(){
		List<Candidate> list = new ArrayList<Candidate>();
		
		Candidate cnd = new Candidate();
		
		try {
			String sql = "select * from Candidate";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				cnd = new Candidate();
				cnd.setId(rs.getInt("id"));
				cnd.setCandidate(rs.getString("candidate"));
				try { cnd.setVotes(rs.getInt("votes")); } catch(Exception ex) { cnd.setVotes(0); }
				try { cnd.setPost(rs.getString("post")); } catch(Exception ex) { cnd.setPost(""); }
				
				list.add(cnd);
				
			}
			
			
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
	
	
	
	// add Candidates (do votes for candidates)
	
			public int  addCandidate(String cnd) {
				
				
				
				
					int a =  0;
					try {
					
						
						String sql = "update Candidate set votes=(votes + 1) where candidate=?";
						PreparedStatement ps= conn.prepareStatement(sql);
						

						
						ps.setString(1, cnd);
						
						
						
						a  = ps.executeUpdate();
						 
						if( a > 0)
							a =1;
						
					
						
					}catch (Exception e) {
						System.out.println(e);
					}
				return a;
					
				}

			// update candidate name by id (admin)
			public int updateCandidate(int id, String name, String post) {
				int updated = 0;
				try {
					String sql = "update Candidate set candidate=?, post=? where id=?";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, name);
					ps.setString(2, post);
					ps.setInt(3, id);
					updated = ps.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return updated;
			}
			
	
	

	

		

	

}
