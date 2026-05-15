/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ucr.ac.cr.sisong.model;

/**
 *
 * @author Usuario
 */
public class Song {
    
    private int idSong;
    private String title;
    private double time;
    private String musicGenre;
    private int releaseYear;
    private int artistId;
    
    //Cualquier clase accede, no necesita instancia para llamarlo, no se puede modificar el contenido en otra clase, todas las constantes van en mayuscula
    public static final String [] TITLE_SONG = {"ID", "Title", "Duration", "Genre", "Release year"};
    
//    public Song() {
        
//    }

    public Song(int idSong, String title, double time, String musicGenre, int releaseYear) {
        this.idSong = idSong;
        this.title = title;
        this.time = time;
        this.musicGenre = musicGenre;
        this.releaseYear = releaseYear;
    }

    //Cuando reciba la posicion de la columna me devuelve lo que corresponda
    public String getDataSong(int colum){
        
        switch (colum) {
            case 0: 
                return String.valueOf(this.getIdSong());
            case 1: 
                return this.getTitle();
            case 2: 
                return String.valueOf(this.getTime());
            case 3: 
                return this.getMusicGenre();
            case 4: 
                return String.valueOf(this.getReleaseYear());
        }
        return "";
    }

    public int getArtistId() {
        return artistId;
    }

    public void setArtistId(int artistId) {
        this.artistId = artistId;
    }

    public int getIdSong() {
        return idSong;
    }

    public void setIdSong(int idSong) {
        this.idSong = idSong;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getTime() {
        return time;
    }

    public void setTime(double time) {
        this.time = time;
    }

    public String getMusicGenre() {
        return musicGenre;
    }

    public void setMusicGenre(String musicGenre) {
        this.musicGenre = musicGenre;
    }

    public int getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
    }

    @Override
    public String toString() {
        return "Song{" + "idSong=" + idSong + ", title=" + title + ", time=" + time + ", musicGenre=" + musicGenre + ", releaseYear=" + releaseYear + ", artistId=" + artistId + '}';
    }

    
    
}
