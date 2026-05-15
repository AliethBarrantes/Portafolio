/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ucr.ac.cr.sisong.controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import ucr.ac.cr.sisong.model.AlbumArray;
import ucr.ac.cr.sisong.model.ArtistArray;
import ucr.ac.cr.sisong.model.SongArray;
import ucr.ac.cr.sisong.view.GUIMain;

/**
 *
 * @author Dell E7490
 */
public class ControllerMain implements ActionListener{
    
    private GUIMain guiMain;
    private ControllerSong controllerSong;
    private SongArray songArray;
    private ControllerArtist controllerArtist;
    private ArtistArray artistArray;
    private ControllerAlbum controllerAlbum;
    private AlbumArray albumArray;
    private ControllerTablas controllerTables;
    
    
    public ControllerMain() {
        
       this.guiMain = new GUIMain();
       this.guiMain.listen(this);
       this.songArray = new SongArray("a");
       this.artistArray = new ArtistArray();
       this.guiMain.setVisible(true);
       this.albumArray = new AlbumArray();
       
    }
    
  

    public void actionPerformed(ActionEvent e) {
       switch (e.getActionCommand()) {
            case "Exit":
              System.exit(0);
              break;
              
              case "Songs":
                  this.controllerSong = new ControllerSong(songArray, artistArray);
               break;
               
               case "Artists":
                   this.controllerArtist = new ControllerArtist(artistArray);
               break;
               
               case "Albums":
                   this.controllerAlbum = new ControllerAlbum(songArray, albumArray, artistArray);
               break;
               
               case "Tables":
                   
                    this.controllerTables = new ControllerTablas(songArray);
               break;
               
         }
    }
}
