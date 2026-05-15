/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ucr.ac.cr.sisong.model;

/**
 *
 * @author Dell E7490
 */
public class Artist {
    
    private int idArtist;
    private String name;
    private String country;
    private String musicGenre;

    //Cualquier clase accede, no necesita instancia para llamarlo, no se puede modificar el contenido en otra clase, todas las constantes van en mayuscula
    public static final String [] TITLE_ARTIST = {"ID", "Name", "Country", "Genre"};
    
    public Artist() {
    }

    public Artist(int idArtist, String name, String country, String musicGenre) {
        this.idArtist = idArtist;
        this.name = name;
        this.country = country;
        this.musicGenre = musicGenre;
        
    }

    
     //Cuando reciba la posicion de la columna me devuelve lo que corresponda
    public String getDataArtist(int colum){
        
        switch (colum) {
            case 0: 
                return String.valueOf(this.getIdArtist());
            case 1: 
                return this.getName();
            case 2: 
                return this.getCountry();
            case 3: 
                return this.getMusicGenre();
        }
        return "";
    }

    public int getIdArtist() {
        return idArtist;
    }

    public void setIdArtist(int idArtist) {
        this.idArtist = idArtist;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getMusicGenre() {
        return musicGenre;
    }

    public void setMusicGenre(String musicGenre) {
        this.musicGenre = musicGenre;
    }

    @Override
    public String toString() {
        return "Artist{" + "idArtist=" + idArtist + ", name=" + name + ", country=" + country + ", musicGenre=" + musicGenre + '}';
    }

   
    
}
