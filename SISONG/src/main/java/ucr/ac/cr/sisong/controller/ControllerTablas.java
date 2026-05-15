/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package ucr.ac.cr.sisong.controller;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import ucr.ac.cr.sisong.model.Song;
import ucr.ac.cr.sisong.model.SongArray;
import ucr.ac.cr.sisong.view.GUItablas;


public class ControllerTablas implements MouseListener, ListSelectionListener {

    private SongArray songArray;
    private GUItablas guiTablas;
    private SongArray songDetails;

    public ControllerTablas(SongArray songArray) 
    {
        songDetails = new SongArray();
        this.songArray = songArray;
        this.guiTablas = new GUItablas(songArray.getMatrixSongs(), this);
    }

    
    @Override
    public void mouseClicked(MouseEvent e) 
    {
        if (e.getClickCount() == 2) {
            int id = guiTablas.getSelectedTblDetalles();
            if (id != -1)
            {
                System.err.println(songDetails.delete(id));
                guiTablas.setTblDetalles(songDetails.getMatrixSongs());
                
            }
        }
    }

    @Override
    public void valueChanged(ListSelectionEvent e) 
    {
        
        if (!e.getValueIsAdjusting()) 
        {
            //Tabla de canciones
            if (e.getSource() == guiTablas.getTblCanciones().getSelectionModel())
            {
                int id = guiTablas.getSelectedTblCanciones();
                if (id != -1) {
                    
                    
                    Song songTemp = songArray.search(id);
                    
                   
                    System.err.println(songDetails.add(songTemp));
                    //System.err.println("ArrayDetails: "+songDetails.toString());

                   guiTablas.setTblDetalles(songDetails.getMatrixSongs());
                }
            }
            
       }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    @Override
    public void mousePressed(MouseEvent e) {
    }

    @Override
    public void mouseReleased(MouseEvent e) {
    }

    @Override
    public void mouseEntered(MouseEvent e) {
    }

    @Override
    public void mouseExited(MouseEvent e) {
    }


    
    
    
    
    
}
