/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package ucr.ac.cr.sisong.model;

import java.util.ArrayList;


public class Album {
    
    private int idAlbum;
    private String albumTitle;
    private int releaseYear;
    private ArrayList<Song> arrayAlbumSongs;
    private ArrayList<Artist> arrayAlbumArtist;
    public static final String [] TITLE_ALBUM = {"Songs", "", "", ""};

    public Album(String albumTitle, int releaseYear, ArrayList<Song> arrayAlbumSongs, ArrayList<Artist> arrayAlbumArtist) {
        this.albumTitle = albumTitle;
        this.releaseYear = releaseYear;
        this.arrayAlbumSongs = arrayAlbumSongs;
        this.arrayAlbumArtist = arrayAlbumArtist;
    }



    public int getIdAlbum() {
        return idAlbum;
    }

    public void setIdAlbum(int idAlbum) {
        this.idAlbum = idAlbum;
    }
    
    public String getAlbumTitle() {
        return albumTitle;
    }

    public void setAlbumTitle(String albumTitle) {
        this.albumTitle = albumTitle;
    }

    public int getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
    }

    public ArrayList<Song> getArrayAlbumSongs() {
        return arrayAlbumSongs;
    }

    public void setArrayAlbumSongs(ArrayList<Song> arrayAlbumSongs) {
        this.arrayAlbumSongs = arrayAlbumSongs;
    }
    
    public void addToArrayAlbumSongs(Song song)
    {
        this.arrayAlbumSongs.add(song);
    }

    public ArrayList<Artist> getArrayAlbumArtist() {
        return arrayAlbumArtist;
    }

    public void setArrayAlbumArtist(ArrayList<Artist> arrayAlbumArtist) {
        this.arrayAlbumArtist = arrayAlbumArtist;
    }
    
    public void addToArrayAlbumArtists(Artist artist)
    {
        this.arrayAlbumArtist.add(artist);
    }
    
    public void printArrayAlbumArtist() {
    System.out.println("Array de artistas del álbum:");
    for (Artist artist : arrayAlbumArtist) {
        if (artist != null) {
            System.out.println(artist);
        }
    }
}

    
    
    @Override
    public String toString() {
        return "Album{" + "idAlbum=" + idAlbum + ", albumTitle=" + albumTitle + ", releaseYear=" + releaseYear + ", arrayAlbumSongs=" + arrayAlbumSongs + ", arrayAlbumArtist=" + arrayAlbumArtist + '}';
    }


    
    
    
    
    
}//End of class
