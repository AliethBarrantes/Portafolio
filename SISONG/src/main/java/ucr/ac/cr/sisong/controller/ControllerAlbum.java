/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ucr.ac.cr.sisong.controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseListener;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import ucr.ac.cr.sisong.model.Album;
import ucr.ac.cr.sisong.model.AlbumArray;
import ucr.ac.cr.sisong.model.ArtistArray;
import ucr.ac.cr.sisong.model.Song;
import ucr.ac.cr.sisong.model.SongArray;
import ucr.ac.cr.sisong.view.GUIAlbums;

/**
 *
 * @author Dell E7490
 */
public class ControllerAlbum implements ActionListener, ListSelectionListener{
    private GUIAlbums guiAlbums;
    private SongArray songArray;
    private Song song;
    private AlbumArray albumArray;
    private ArrayList<Song> arrayTemporal;
    private ArtistArray artistArray;

    public ControllerAlbum(SongArray songArray, AlbumArray albumArray, ArtistArray artistArray) {
        this.guiAlbums = new GUIAlbums();
        this.songArray = songArray;
        this.artistArray = artistArray;
        this.guiAlbums.setTblRegisteredSongs();
        this.guiAlbums.setVisible(true);
        this.guiAlbums.setListener(this);
        this.albumArray = albumArray;
        guiAlbums.listenListTable(this);
        ArrayList<Song> arrayTemporal = new ArrayList<>();
    }
    
    
    @Override
    public void actionPerformed(ActionEvent e) {
        
        switch (e.getActionCommand()) {
            case "Add album":
                
                if (arrayTemporal == null) 
                {
                    JOptionPane.showMessageDialog(guiAlbums, "the album needs at least one song");
                }
                else if (guiAlbums.getTxtAlbumTitle().isEmpty())
                {
                    JOptionPane.showMessageDialog(guiAlbums, "the album needs a title");
                }
                else 
                {
                     System.out.println(arrayTemporal.get(0));
                     Album album = new Album(guiAlbums.getTxtAlbumTitle(), guiAlbums.getSpReleaseDate(), arrayTemporal, artistArray.getAlmbumArtists(arrayTemporal));
                     albumArray.add(album);
                     arrayTemporal = null;
                     album.printArrayAlbumArtist();
                     JOptionPane.showMessageDialog(guiAlbums, "The album was succesfully added");
                     guiAlbums.clear();
                     
                }
                
            break;
                
            case "Search and add":
                
                if (arrayTemporal == null)
                {
                    arrayTemporal = new ArrayList<>();
                }
                
                
                //Revisamos que el text field del titulo no este vacio
                if (guiAlbums.getTitleTxt().isEmpty()) 
                {
                    JOptionPane.showMessageDialog(guiAlbums, "You must enter a title");
                }
                else
                {
                    Song song = songArray.searchByName(guiAlbums.getTitleTxt());
                    
                    if (song == null) 
                    {
                        JOptionPane.showMessageDialog(guiAlbums, "The song was not found");
                    }
                    else
                    {
                        arrayTemporal.add(song);
                        
                        guiAlbums.addTblRegistredSongs(albumArray.fillJtableRegisteredSongs(guiAlbums.getModelTblRegistredSongs(), arrayTemporal));
                        
                    }
                }
                
            break;
            
            
            case "Close":
                
                guiAlbums.dispose();
                
            break;
                
            default:
                throw new AssertionError();
        }
        
    }    

    @Override
    public void valueChanged(ListSelectionEvent e) {
        if (!e.getValueIsAdjusting()) { 

            if (!guiAlbums.getTblRegistredSongs().getSelectionModel().isSelectionEmpty()) { // Verifica si se ha seleccionado una fila
                int row = guiAlbums.getSelectedRow();
                System.out.println("FILA SELECCIONADA: " + row);
                int col = guiAlbums.getSelectedCol();
                System.out.println("COLUMNA SELECCIONADA: " + col);

                System.out.println("Cancion seleccionada: " + guiAlbums.getSelectedSong(row, col));

                Song song = songArray.searchByName(guiAlbums.getSelectedSong(row, col));

                if (song == null) {
                    System.out.println("Cancion no encontrada");
                } else {
                    guiAlbums.setTblAlbum(song);
                }
            }
        }
    }

    
}
