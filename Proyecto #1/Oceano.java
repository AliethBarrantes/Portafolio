/**
 * Clase llamada Oceano, para usar como mapa.
 * <p>
 * Esta clase representa el objeto Oceano.
 * </p>
 * 
 * @author: Camila Peña Barrante C35902 y Marcela Lopez Torres C34403.
 * @version 1.0.0, 02/11/2023
 * @see www.plantuml.com/plantuml/png/dL91pzCm3BttL-JOQV07gcaQ6oSEW42SfXsyn8i2YJqvoIGqxRypcbHjD0xewoN9iz-p_TnTJ20f1zzTGVy2Y-ghy6_KYTLcSs5lKBRRUwUUd_OGepem9M7_AQFbWhzdZK3y8sOGnyENyNKy7K_Bw873DISmBF2ISGRH75j-6_i7k-MISMQMK8xIQxXHcLEY1YAKGNql5rLW0J8S1lLjF5KteklbzFsgO04fJtVA0OK_U8J4ufufmrHd3LRGWkp7ZlhYog1cBzuflUplpEmHQ3NSs9bQY6CIa49vauAZc2HhxPWmViGwnpB3k7W5uTXVd2yk_LNrEL1z_MzPjLHjrj0JXxFWq_0aZkngA6V9_9ajoDJH23swRlxzQjdxOhkJJjrGTQS9rULOJAFxVLioJZ1blF6-8SupJBtChUmXWVVm6MxWxtL3uAW7iN4IE9wgH64_kXsIoS7_0G00
 * @sinse 1.0
 */

public class Oceano{
	private String barco;//Atributo que representara el estado del barco en el oceano
	
	//Constructor que inicializa el atributo
	Oceano(String barco){
		this.barco = barco;
	}
	
	//Metodo que obtiene el nombre que resive barco y lo devuelve, en este caso sera el estado
	public String getBarco(){
		return barco;
	}
	
	//Metodo para establecer un nuevo "estado" al barco
	public void setBarco(String nuevoBarco){
		this.barco = nuevoBarco;
	}
}
