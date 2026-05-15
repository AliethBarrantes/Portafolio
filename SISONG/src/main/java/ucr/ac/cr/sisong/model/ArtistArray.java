/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ucr.ac.cr.sisong.model;

import java.util.ArrayList;

/**
 *
 * @author Dell E7490
 */
public class ArtistArray {
    
    private ArrayList<Artist> listArtists;
    
    public ArtistArray() {
        this.listArtists = new ArrayList<>();
        listArtists.add(new Artist(0,"Pedro","Costa Rica","Pop"));
    }
    
    //Metodo buscar 
    public Artist search(int idArtist){
        for (Artist artist : this.listArtists) {
            if (artist.getIdArtist() == idArtist) {
                return artist;
            }
        }
        return null;
    }
    
    //Metodo agregar
    public String add(Artist artist){
        if (artist != null) {
            //Verificar que no se repita el id 
            if (this.search(artist.getIdArtist()) == null) {
                //Agrega la cancion 
                this.listArtists.add(artist);
                return "Artist added succesfully!";
            }else{
                return "The artist is registred.";
            }
        }
        return "Error adding artist";
    }
    
    //Metodo para eliminar 
    public String delete(int idArtist){
        //Se le envia el idArtist al metodo search y el me devuelve el objeto y lo remuevo de la lista
        if (this.listArtists.remove(this.search(idArtist))) {
            //Esto pasa si el metodo search retorna un true
            return "Artist succesfully eliminated!";
        }
        return "Error when deleting artist";
    }
    
    //Metodo para modificar 
    public String edit(Artist artistEdit){
        //Recorre la lista 
        for (int i = 0; i < this.listArtists.size(); i++) {
            //Obtiene el objeto, compara el idArtist con el id del objeto que entro por parametro
            if (this.listArtists.get(i).getIdArtist()== artistEdit.getIdArtist()) {
                //Agarra el objeto que recibi por parametro y lo sustituye en esa posicion
                this.listArtists.set(i, artistEdit);
                 return "Artist succesfully modified!";
            }
        }
        //En caso de que no lo encuentre
         return "Error when modified artist";
    }
    
    public String toString(){
        String out = "List artists:\\n";
        for (Artist artist : listArtists) {
            out+=artist+"\n";
        }
        return out;
    }
    
    //Metodo que genera los id de forma automatica
    public int getIdLabel(){
        int id=0;
        if(this.listArtists.size()>0){
            //Obtenemos el ultimo id que este guardado en el ArrayList
            return this.listArtists.get(this.listArtists.size()-1).getIdArtist()+1;
        }
        return 1;
    }
    
    //Metodo que devuelve un arreglo con los ids almacenados
    public String[] getIdCombo(){
        //Es del tamano de la cantidad de objetos que tiene el arrayList 
        String[] idsList = new String[this.listArtists.size()];
        for (int i = 0; i < this.listArtists.size(); i++) {
           idsList[i] = this.listArtists.get(i).getIdArtist()+"-"+this.listArtists.get(i).getName();
        }
        return idsList;
    }
    
    //Se llama este metodo para pasarle los datos registrados a la tabla 
    public String [][] getMatrixArtists(){
        
        String [][] matrixArtists = new String[this.listArtists.size()][Artist.TITLE_ARTIST.length];
        for (int f = 0; f < matrixArtists.length; f++) {
            for (int c = 0; c < matrixArtists[0].length; c++) {
                matrixArtists[f][c] = this.listArtists.get(f).getDataArtist(c);
            }
        }
        return matrixArtists;
    }
    
    public ArrayList<Artist> getAlmbumArtists(ArrayList<Song> albumSongArray)
    {
        ArrayList<Artist> arrayTemp = new ArrayList<>();
        for (Song song : albumSongArray) 
        {
            Artist artistTemp = search(song.getArtistId());
            
            if (arrayTemp != null) 
            {
                arrayTemp.add(artistTemp);
            }
        }
        
        return arrayTemp;
    }
    
    
    
}
