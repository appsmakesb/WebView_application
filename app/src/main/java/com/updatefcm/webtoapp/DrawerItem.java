package com.updatefcm.webtoapp;

public class DrawerItem {

    private String name;
    private int icon;

    public DrawerItem(String name, int icon) {
        this.name = name;
        this.icon = icon;
    }

    public String getName() {
        return name;
    }

    public int getIcon() {
        return icon;
    }
}

