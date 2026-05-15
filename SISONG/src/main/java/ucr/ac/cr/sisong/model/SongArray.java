/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ucr.ac.cr.sisong.model;
import java.util.ArrayList;
/**
 *
 * @author Usuario
 */
public class SongArray {
    
    private ArrayList<Song> listSongs;
    private ArrayList<Song> listSongSelected;

    public SongArray() {
        this.listSongs = new ArrayList<>();
        this.listSongSelected = new ArrayList<>();

        
    }

    public SongArray(String a) {
        this.listSongs = listSongs;
        this.listSongSelected = listSongSelected;
        this.listSongs = new ArrayList<>();
        this.listSongSelected = new ArrayList<>();
        Song songTemp1 = new Song(1,"Hola Mundo",2.00,"Pop",2004);
        Song songTemp2 = new Song(2,"Mundo",1.00,"Rock",2004);
        Song songTemp3 = new Song(3,"undo",3.00,"Clasica",2004);
        listSongs.add(songTemp1);
        listSongs.add(songTemp2);
        listSongs.add(songTemp3);
    }
    
    
    
    
    public void addSongSelected(Song song){
        
        this.listSongSelected.add(song);
        
    }
    
    //Metodo buscar 
    public Song search(int idSong){
        for (Song song : this.listSongs) {
            if (song.getIdSong() == idSong) {
                return song;
            }
        }
        return null;
    }
    
    public Song searchByName(String titulo){
        for (Song song : this.listSongs) {
            if (song.getTitle().equalsIgnoreCase(titulo)) {
                return song;
            }
        }
        return null;
    }
    
    
    
    
    
    
    //Metodo agregar
    public String add(Song song){
        if (song != null) {
            //Verificar que no se repita el id 
            if (!listSongs.contains(song)) {
                //Agrega la cancion 
                this.listSongs.add(song);
                return "Song added succesfully!";
            }else{
                return "The song is registred.";
            }
            
//            5+5 == "Hola"
//            contains
            
        }
        return "Error adding song";
    }
    
    //Metodo para eliminar 
    public String delete(int idSong){
        //Se le envia el idSong al metodo search y el me devuelve el objeto y lo remuevo de la lista
        if (this.listSongs.remove(this.search(idSong))) {
            //Esto pasa si el metodo search retorna un true
            return "Song succesfully eliminated!";
        }
        return "Error when deleting song";
    }
    
    //Metodo para modificar 
    public String edit(Song songEdit){
        //Recorre la lista 
        for (int i = 0; i < this.listSongs.size(); i++) {
            //Obtiene el objeto, compara el idSong con el id del objeto que entro por parametro
            if (this.listSongs.get(i).getIdSong() == songEdit.getIdSong()) {
                //Agarra el objeto que recibi por parametro y lo sustituye en esa posicion
                this.listSongs.set(i, songEdit);
                 return "Song succesfully modified!";
            }
        }
        //En caso de que no lo encuentre
         return "Error when modified song";
    }
    
    public String toString(){
        String out = "List songs:\\n";
        for (Song song : listSongs) {
            out+=song+"\n";
        }
        return out;
    }
    
    //Metodo que genera los id de forma automatica
    public int getIdLabel(){
        int id=0;
        if(this.listSongs.size()>0){
            //Obtenemos el ultimo id que este guardado en el ArrayList
            return this.listSongs.get(this.listSongs.size()-1).getIdSong()+1;
        }
        return 1;
    }
    
    //Metodo que devuelve un arreglo con los ids almacenados
    public String[] getIdCombo(){
        //Es del tamano de la cantidad de objetos que tiene el arrayList 
        String[] idsList = new String[this.listSongs.size()];
        for (int i = 0; i < this.listSongs.size(); i++) {
           idsList[i] = this.listSongs.get(i).getIdSong()+"-"+this.listSongs.get(i).getTitle();
        }
        return idsList;
    }
    
    //Se llama este metodo para pasarle los datos registrados a la tabla 
    public String [][] getMatrixSongs(){
        
        String [][] matrixSongs = new String[this.listSongs.size()][Song.TITLE_SONG.length];
        for (int f = 0; f < matrixSongs.length; f++) 
        {
            for (int c = 0; c < matrixSongs[0].length; c++) 
            {
                matrixSongs[f][c] = this.listSongs.get(f).getDataSong(c);
            }
        }
        return matrixSongs;
    }
    
    public String [][] getMatrixSongsSelected(){
        
        String [][] matrixSongs = new String[this.listSongSelected.size()][Song.TITLE_SONG.length];
        for (int f = 0; f < matrixSongs.length; f++) {
            for (int c = 0; c < matrixSongs[0].length; c++) {
                matrixSongs[f][c] = this.listSongSelected.get(f).getDataSong(c);
            }
        }
        return matrixSongs;
    }

    public String update(Song song) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String upadte(Song song) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String upadteSong(Song song) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
