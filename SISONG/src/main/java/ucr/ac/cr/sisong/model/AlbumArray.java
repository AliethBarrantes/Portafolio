/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package ucr.ac.cr.sisong.model;

import java.util.ArrayList;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;


public class AlbumArray {

    private Album album;
    private ArrayList<Album> listAlbums;
    private int idCount = 0;
    
    
    public AlbumArray() {
        this.listAlbums = new ArrayList<>();
    }
    
        //Metodo buscar 
    public Album search(int idAlbum){
        for (Album album : this.listAlbums) {
            if (album.getIdAlbum() == idAlbum) {
                return album;
            }
        }
        return null;
    }
    
    //Metodo agregar
    public String add(Album album){
        if (album != null) {
            //Verificar que no se repita el id 
                //Agrega la cancion 
                album.setIdAlbum(idCount);
                this.listAlbums.add(album);
                idCount++;
                return "Albuum added succesfully!";
        }
        return "Error adding album";
    }
  
    
    //Metodo para eliminar 
    public String delete(int idAlbum){
        //Se le envia el idAlbum al metodo search y el me devuelve el objeto y lo remuevo de la lista
        if (this.listAlbums.remove(this.search(idAlbum))) {
            //Esto pasa si el metodo search retorna un true
            return "Album succesfully eliminated!";
        }
        return "Error when deleting album";
    }
    
    public DefaultTableModel fillJtableRegisteredSongs(DefaultTableModel tableModel, ArrayList<Song> songArray) {
        // Agrega las columnas al modelo de tabla
        DefaultTableModel model = tableModel;
        model.setColumnIdentifiers(Album.TITLE_ALBUM);
        
        if (model.getRowCount() == 0) 
        {
            model.addRow(new String[] {""});
        }
        
        
        // Llena la tabla con los datos de las canciones
        int row = 0;
        int col = 0;
        for (Song song : songArray) {
            // Inserta el título de la canción en la columna 1 de la fila actual
            model.setValueAt(song.getTitle(), row, col);

            // Avanza a la siguiente columna
            col++;

            // Si hemos llegado al final de una fila, pasa a la siguiente fila
            if (col == model.getColumnCount()) {
                col = 0;
                row++;
                if (row == model.getRowCount()) {
                   model.addRow(new String[] {""});
                }
                
            }
        }

        return model;
    }
    
    
    
//    public String[][] getMatrixAlbumSongs(int id)
//    {
//        album = search(id);
//        
//        
//        
//        
//        if (album == null) 
//        {
//            System.out.println("ALBUM VACIO");
//            return null;
//        }
//        else
//        {
//            ArrayList<Song> arrayTemp = album.getArrayAlbumSongs();
//            String[][] matrix = new String[arrayTemp.size()][arrayTemp.size()]; 
//            
//            for (int i = 0; i < arrayTemp.size(); i++) 
//            {
//                for (int j = 0; j < 4; j++) {
//                    matrix[i][0] = arrayTemp.get(i).getTitle();
//                    System.out.println(arrayTemp.get(i)+"colocado en fila:"+i+" Columna:"+j);
//                }
//            }
//            
//            
//            
//            System.out.println(matrix[0][0]);
//            return matrix;
//        }
// 
//    }
    
    
    
}//End of class
