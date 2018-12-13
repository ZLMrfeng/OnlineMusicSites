package com.zl.bean;

public class Company {

    private int compay_Id;
    private String company_Name;
    private String company_Address;
    private String company_Email;
    private String company_Phone;

    public Company() {
    }

    public int getCompay_Id() {
        return compay_Id;
    }

    public void setCompay_Id(int compay_Id) {
        this.compay_Id = compay_Id;
    }

    public String getCompany_Name() {
        return company_Name;
    }

    public void setCompany_Name(String company_Name) {
        this.company_Name = company_Name;
    }

    public String getCompany_Address() {
        return company_Address;
    }

    public void setCompany_Address(String company_Address) {
        this.company_Address = company_Address;
    }

    public String getCompany_Email() {
        return company_Email;
    }

    public void setCompany_Email(String company_Email) {
        this.company_Email = company_Email;
    }

    public String getCompany_Phone() {
        return company_Phone;
    }

    public void setCompany_Phone(String company_Phone) {
        this.company_Phone = company_Phone;
    }

    @Override
    public String toString() {
        return "Company{" +
                "compay_Id=" + compay_Id +
                ", company_Name='" + company_Name + '\'' +
                ", company_Address='" + company_Address + '\'' +
                ", company_Email='" + company_Email + '\'' +
                ", company_Phone='" + company_Phone + '\'' +
                '}';
    }
}
