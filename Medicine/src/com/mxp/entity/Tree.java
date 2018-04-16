package com.mxp.entity;

public class Tree {

	private Long id;
	// private Tree tree;
	private String text;
	private String state;
	private String iconCls;
	private String url;
	private Long nid;

	public Tree() {
		// TODO Auto-generated constructor stub
	}

	public Tree(Long id, String text, String state, String iconCls, String url, Long nid) {
		super();
		this.id = id;
		this.text = text;
		this.state = state;
		this.iconCls = iconCls;
		this.url = url;
		this.nid = nid;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Long getNid() {
		return nid;
	}

	public void setNid(Long nid) {
		this.nid = nid;
	}

	// private Set<Tree> trees = new HashSet<Tree>();

}
