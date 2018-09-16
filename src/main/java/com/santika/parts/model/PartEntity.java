package com.santika.parts.model;


import javax.persistence.*;


@Entity
@Table(name = "part")
public class PartEntity
{
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Basic
    @Column(name = "name", nullable = false, length = 100)
    private String name;

    @Basic
    @Column(name = "need", nullable = false)
    private boolean need;

    @Basic
    @Column(name = "number", nullable = false)
    private int number;


    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public boolean isNeed() {
        return need;
    }

    public void setNeed(boolean need) {
        this.need = need;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Override
    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PartEntity that = (PartEntity) o;

        if (id != that.id) return false;
        if (number != that.number) return false;
        if (need != that.need) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        return true;
    }

    @Override
    public int hashCode()
    {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + number;
        result = 31 * result + (need ? 1 : 0);
        return result;
    }

    @Override
    public String toString() {
        return "PartEntity{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", need=" + need +
                ", number=" + number +
                '}';
    }
}
