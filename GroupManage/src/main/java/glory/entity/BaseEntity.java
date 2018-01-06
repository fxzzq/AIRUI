package glory.entity;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

public class BaseEntity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1679678105511847175L;

	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
