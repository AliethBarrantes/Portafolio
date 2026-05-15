/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ucr.ac.cr.sisong.controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import ucr.ac.cr.sisong.model.ArtistArray;
import ucr.ac.cr.sisong.model.SongArray;
import ucr.ac.cr.sisong.view.ButtonsPanel;
import ucr.ac.cr.sisong.view.DataPanelSong;
import ucr.ac.cr.sisong.view.GUISong;
import ucr.ac.cr.sisong.model.Song;
import ucr.ac.cr.sisong.view.GUIReport;

/**
 *
 * @author Usuario
 */
public class ControllerSong implements ActionListener, MouseListener{

       private GUISong guiSong;
       private DataPanelSong dataPanelSong;
       private ButtonsPanel buttonsPanel;
       private SongArray songArray;
       private Song song;
       private GUIReport guiReport = new GUIReport();
       private ArtistArray artistArray;

    //Crea la instancia de la ventana 
    public ControllerSong(SongArray songArray, ArtistArray artistArray) {
       this.guiSong = new GUISong();
       this.artistArray = artistArray;
       this.dataPanelSong = this.guiSong.getDataPanelSong();
       this.buttonsPanel = this.guiSong.getButtonPanel();
       this.buttonsPanel.listen(this);
       this.dataPanelSong.listenCombo(this);
       this.songArray = songArray;
       this.dataPanelSong.setLbIdSong(this.songArray.getIdLabel());
       this.dataPanelSong.addGenre();
       this.guiSong.setVisible(true);
       
    }
      
    @Override
    public void actionPerformed(ActionEvent e) {
        switch (e.getActionCommand()) {
            case "Add":
                //Cancion es igual al metodo obtener cancion 
                this.song = this.dataPanelSong.getSong();
                
                //Si cancion es diferente a null
                if(this.song!=null){
                    //Y si la validacion de los datos es verdadero
                    if (this.validationData(song)) {
                     if(!guiSong.getDataPanelSong().getTxtArtistString().isEmpty()){
                         if(artistArray.search(guiSong.getDataPanelSong().getTxtArtist()) != null)
                         {
                            //Entonces envia como mensaje una cancion que esta en el songArray
                            song.setArtistId(this.dataPanelSong.getTxtArtist());
                            GUISong.setMessage(this.songArray.add(song));
                            this.dataPanelSong.setCbSong(this.songArray.getIdCombo());
                            //Cada vez que agreguemos una cancion se va poner activo para seleccionar(esto en el ultimo comboBox)
                            this.dataPanelSong.setEditCbCombo(true);
                            this.dataPanelSong.clean();
                            this.dataPanelSong.setLbIdSong(this.songArray.getIdLabel());
                            
                            System.out.println("ADDED SONG:"+song);
                         }
                         else
                         {
                             GUISong.setMessage("Artist id not found");
                         }
                     }
                     else
                     {
                         GUISong.setMessage("The artist id field is empty");
                     }

                    }
                }
                
                break;
                
            case "Edit":
                this.song = this.dataPanelSong.getSong();
                if(this.song!=null){
                    if (this.validationData(song)) {
                        String message = this.songArray.edit(song);
                        GUISong.setMessage(message);
                        this.dataPanelSong.setCbSong(this.songArray.getIdCombo());
                        //Cada vez que agreguemos una cancion se va poner activo para seleccionar(esto en el ultimo comboBox)
                        this.dataPanelSong.setEditCbCombo(true);
                        this.dataPanelSong.clean();
                    }
                }
                break;
                
            case "Delete":
                String selectedId = this.dataPanelSong.getCbSong();
                if(!selectedId.equalsIgnoreCase("Selected option")){
                    int idDelete = Integer.parseInt(selectedId.substring(0, selectedId.indexOf("-")));
                    String deleteMessage = this.songArray.delete(idDelete);
                    GUISong.setMessage(deleteMessage);
                    this.dataPanelSong.setCbSong(this.songArray.getIdCombo());
                    this.dataPanelSong.setEditCbCombo(true);
                    this.dataPanelSong.clean();
                    this.dataPanelSong.setLbIdSong(this.songArray.getIdLabel());
                }
                break;
                
            case "Report":
                //GUISong.setMessage(this.songArray.toString());
                this.guiReport = new GUIReport();
                guiReport.setDataTable(this.songArray.getMatrixSongs(), Song.TITLE_SONG);
                guiReport.listenMouse(this);
                guiReport.setVisible(true);
                break;
            
            case "songCombo":
                String id = this.dataPanelSong.getCbSong();
                if(!id.equalsIgnoreCase("Selected option")){
                    //Busca en el arreglo el id que me devuelve el combo, me duevuleve lo que hay antes del -
                    this.song = this.songArray.search(Integer.parseInt(id.substring(0,id.indexOf("-"))));
                    this.dataPanelSong.setSong(song);
                }
                break;
    
            case "Exit":
                this.guiSong.dispose();
                
    
        }
    }
    
    public boolean validationData(Song songValidate){
        if (songValidate.getTitle().isEmpty()) {
            GUISong.setMessage("The title field is empty!");
            return false;
        }else if(songValidate.getTime() == 0.1){
            GUISong.setMessage("The duration field is empty!");
            return false;
        }else if(songValidate.getMusicGenre().equals("Selected option")) {
            GUISong.setMessage("The genre field is empty!");
            return false; 
        }
        else{
            return true;
        }
    } 

    @Override
    //Cuando se le de click a la fila, va aagrra los datos de esa fila en el dataPanelSong
    public void mouseClicked(MouseEvent e) {
        this.dataPanelSong.setSong(new Song(Integer.parseInt(this.guiReport.getDataRow()[0]),
            this.guiReport.getDataRow()[1], 
            Double.parseDouble(this.guiReport.getDataRow()[2]),
            this.guiReport.getDataRow()[3],
            Integer.parseInt(this.guiReport.getDataRow()[4])));
        this.guiReport.dispose();
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
