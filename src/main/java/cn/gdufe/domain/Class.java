package cn.gdufe.domain;

public class Class {
    private int id;
    private String college;
    private String specialty;
    private String  grade;
    private int studentNum;
    private int teacherNum;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public int getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(int studentNum) {
        this.studentNum = studentNum;
    }

    public int getTeacherNum() {
        return teacherNum;
    }

    public void setTeacherNum(int teacherNum) {
        this.teacherNum = teacherNum;
    }

    @Override
    public String toString() {
        return "Class{" +
                "id=" + id +
                ", college='" + college + '\'' +
                ", specialty='" + specialty + '\'' +
                ", grade='" + grade + '\'' +
                ", studentNum=" + studentNum +
                ", teacherNum=" + teacherNum +
                '}';
    }
}
