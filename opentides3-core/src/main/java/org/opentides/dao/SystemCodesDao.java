/* 
 * SystemCodesDao.java
 */
package org.opentides.dao;

import java.util.List;

import org.opentides.bean.SystemCodes;

/**
 * This is the dao interface for SystemCodes.
 * Scaffold generated by opentides3 on Jan 16, 2013 12:40:25. 
 * @author opentides
 */
public interface SystemCodesDao extends BaseEntityDao<SystemCodes, Long> {

	/**
	 * Return List of SystemCodes by Category.
	 * @param category
	 * @return
	 */
	public List<SystemCodes> findSystemCodesByCategory(String category);
	
	/**
	 * Returns all the available categories.
	 * @return
	 */
	public List<SystemCodes> getAllCategories();
	
	/**
	 * Return SystemCode entity by key.
	 * @param key
	 * @return
	 */
	public SystemCodes loadBySystemCodesByKey(String key);
			
	/** 
     * Selects all available categories except for the
     * specified ones 
     */
	public List<SystemCodes> getAllCategoriesExcept(String ... categories);
	
	/**
	 * Counts the existing system codes with the same key 
	 * (but different object).
	 * @param code
	 * @return
	 */
	public long countDuplicate(SystemCodes code);
}