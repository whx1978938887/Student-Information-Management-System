package cn.gdufe.domain;

public class Class {
    private int id;
    private String classId;
    private String year;
    private String specialty;
    private String college;
    private String number;
    private String proportion;
    private String headteacher;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getProportion() {
        return proportion;
    }

    public void setProportion(String proportion) {
        this.proportion = proportion;
    }

    public String getHeadteacher() {
        return headteacher;
    }

    public void setHeadteacher(String headteacher) {
        this.headteacher = headteacher;
    }

    @Override
    public String toString() {
        return "Class{" +
                "id=" + id +
                ", classId='" + classId + '\'' +
                ", year='" + year + '\'' +
                ", specialty='" + specialty + '\'' +
                ", college='" + college + '\'' +
                ", number='" + number + '\'' +
                ", proportion='" + proportion + '\'' +
                ", headteacher='" + headteacher + '\'' +
                '}';
    }
}
