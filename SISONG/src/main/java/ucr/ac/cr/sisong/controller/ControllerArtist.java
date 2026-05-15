/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ucr.ac.cr.sisong.controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import ucr.ac.cr.sisong.model.Artist;
import ucr.ac.cr.sisong.model.ArtistArray;
import ucr.ac.cr.sisong.view.ButtonsPanel;
import ucr.ac.cr.sisong.view.DataPanelArtist;
import ucr.ac.cr.sisong.view.GUIArtist;
import ucr.ac.cr.sisong.view.GUIReport;

/**
 *
 * @author Dell E7490
 */
public class ControllerArtist implements ActionListener, MouseListener{
    
    private GUIArtist guiArtist;
    private DataPanelArtist dataPanelArtist;
    private ButtonsPanel buttonsPanel;
    private ArtistArray artistArray;
    private Artist artist;
    private GUIReport guiReport = new GUIReport();

    //Crea la instancia de la ventana 
    public ControllerArtist(ArtistArray artistArray) {
       this.guiArtist = new GUIArtist();
       this.dataPanelArtist = this.guiArtist.getDataPanelArtist();
       this.buttonsPanel = this.guiArtist.getButtonPanel();
       this.buttonsPanel.listen(this);
       this.dataPanelArtist.listenCombo(this);
       this.artistArray = artistArray;
       this.dataPanelArtist.setLbIdArtist(this.artistArray.getIdLabel());
       this.dataPanelArtist.addGenre();
       this.guiArtist.setVisible(true);
    }
    @Override
    public void actionPerformed(ActionEvent e) {
    
        switch (e.getActionCommand()) {
            case "Add":
                
               
                
                this.artist = this.dataPanelArtist.getArtist();
                if(this.artist!=null){
                    if (this.validationData(artist)) {
                        GUIArtist.setMessage(this.artistArray.add(artist));
                        this.dataPanelArtist.setCbArtist(this.artistArray.getIdCombo());
                        //Cada vez que agreguemos una cancion se va poner activo para seleccionar(esto en el ultimo comboBox)
                        this.dataPanelArtist.setEditCbCombo(true);
                        this.dataPanelArtist.clean();
                        this.dataPanelArtist.setLbIdArtist(this.artistArray.getIdLabel());
                    }
                }
                
                break;
                
            case "Edit":
                this.artist = this.dataPanelArtist.getArtist();
                if(this.artist!=null){
                    if (this.validationData(artist)) {
                        String message = this.artistArray.edit(artist);
                        GUIArtist.setMessage(message);
                        this.dataPanelArtist.setCbArtist(this.artistArray.getIdCombo());
                        //Cada vez que agreguemos una cancion se va poner activo para seleccionar(esto en el ultimo comboBox)
                        this.dataPanelArtist.setEditCbCombo(true);
                        this.dataPanelArtist.clean();
                    }
                }
                break;
                
            case "Delete":
                String selectedId = this.dataPanelArtist.getCbArtist();
                if(!selectedId.equalsIgnoreCase("Selected option")){
                    int idDelete = Integer.parseInt(selectedId.substring(0, selectedId.indexOf("-")));
                    String deleteMessage = this.artistArray.delete(idDelete);
                    GUIArtist.setMessage(deleteMessage);
                    this.dataPanelArtist.setCbArtist(this.artistArray.getIdCombo());
                    this.dataPanelArtist.setEditCbCombo(true);
                    this.dataPanelArtist.clean();
                    this.dataPanelArtist.setLbIdArtist(this.artistArray.getIdLabel());
                }
                break;
                
            case "Report":
                //GUISong.setMessage(this.songArray.toString());
                this.guiReport = new GUIReport();
                guiReport.setDataTable(this.artistArray.getMatrixArtists(), Artist.TITLE_ARTIST);
                guiReport.listenMouse(this);
                guiReport.setVisible(true);
                break;
            
            case "artistCombo":
                String id = this.dataPanelArtist.getCbArtist();
                if(!id.equalsIgnoreCase("Selected option")){
                    //Busca en el arreglo el id que me devuelve el combo, me duevuleve lo que hay antes del -
                    this.artist = this.artistArray.search(Integer.parseInt(id.substring(0,id.indexOf("-"))));
                    this.dataPanelArtist.setArtist(artist);
                }
                break;
    
            case "Exit":
                guiArtist.dispose();
                break;
    
        }
    }
    
    public boolean validationData(Artist artistValidate){
        
        System.out.println(artistValidate);
        
        if (artistValidate.getName().isEmpty()) {
            GUIArtist.setMessage("The name field is empty!");
            return false;
        }else if(artistValidate.getCountry().equals("Selected option")) {
            GUIArtist.setMessage("The country field is empty!");
            return false; 
        }else if(artistValidate.getMusicGenre().equals("Selected option")) {
            GUIArtist.setMessage("The genre field is empty!");
            return false;
        }else{
            return true; 
        }
    } 
    
    @Override
    public void mouseClicked(MouseEvent e) {
        this.dataPanelArtist.setArtist(new Artist(Integer.parseInt(this.guiReport.getDataRow()[0]),
            this.guiReport.getDataRow()[1], 
            this.guiReport.getDataRow()[2],
            this.guiReport.getDataRow()[3]));
        this.guiReport.dispose();
    }

    @Override
    public void mousePressed(MouseEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void mouseReleased(MouseEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void mouseEntered(MouseEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void mouseExited(MouseEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
