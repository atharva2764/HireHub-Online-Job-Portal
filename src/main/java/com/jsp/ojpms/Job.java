package com.jsp.ojpms;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "jobs")
public class Job {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String title;
	private String description;
	private String location;
	private double salary;
	@ManyToOne(cascade = CascadeType.ALL)
	private User recuriter;

	public Job() {

		// TODO Auto-generated constructor stub
	}

	public Job(String title, String description, String location, double salary, User recuriter) {
		super();
		this.title = title;
		this.description = description;
		this.location = location;
		this.salary = salary;
		this.recuriter = recuriter;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public User getRecuriter() {
		return recuriter;
	}

	public void setRecuriter(User recuriter) {
		this.recuriter = recuriter;
	}

	@Override
	public String toString() {
		return "Job [id=" + id + ", title=" + title + ", description=" + description + ", location=" + location
				+ ", salary=" + salary + ", recuriter=" + recuriter + "]";
	}

}
