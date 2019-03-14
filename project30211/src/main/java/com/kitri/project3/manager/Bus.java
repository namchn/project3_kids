package com.kitri.project3.manager;

public class Bus {
	private int bus_num;
	private String x;
	private String y;
	
	public Bus() {}

	public Bus(int bus_num, String x, String y) {
		this.bus_num = bus_num;
		this.x = x;
		this.y = y;
	}

	public int getBus_num() {
		return bus_num;
	}

	public void setBus_num(int bus_num) {
		this.bus_num = bus_num;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	@Override
	public String toString() {
		return "Bus [bus_num=" + bus_num + ", x=" + x + ", y=" + y + "]";
	}
}
