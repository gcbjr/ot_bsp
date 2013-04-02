package org.opentides.bean.impl;

import java.util.List;

import org.opentides.bean.Comment;

public interface Commentable {
	
	public List<Comment> getComments();
	public void setComments(List<Comment> comments);

}
