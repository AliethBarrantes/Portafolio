/**
 * Clase llamada BatallaNaval, es la principal.
 * <p>
 * Esta clase representa la instancia que trae el juego y el merodo main .
 * </p>
 * 
 * @author: Camila Peña Barrante C35902 y Marcela Lopez Torres C34403.
 * @version 1.0.0, 02/11/2023
 * @see www.plantuml.com/plantuml/png/dL91pzCm3BttL-JOQV07gcaQ6oSEW42SfXsyn8i2YJqvoIGqxRypcbHjD0xewoN9iz-p_TnTJ20f1zzTGVy2Y-ghy6_KYTLcSs5lKBRRUwUUd_OGepem9M7_AQFbWhzdZK3y8sOGnyENyNKy7K_Bw873DISmBF2ISGRH75j-6_i7k-MISMQMK8xIQxXHcLEY1YAKGNql5rLW0J8S1lLjF5KteklbzFsgO04fJtVA0OK_U8J4ufufmrHd3LRGWkp7ZlhYog1cBzuflUplpEmHQ3NSs9bQY6CIa49vauAZc2HhxPWmViGwnpB3k7W5uTXVd2yk_LNrEL1z_MzPjLHjrj0JXxFWq_0aZkngA6V9_9ajoDJH23swRlxzQjdxOhkJJjrGTQS9rULOJAFxVLioJZ1blF6-8SupJBtChUmXWVVm6MxWxtL3uAW7iN4IE9wgH64_kXsIoS7_0G00
 * @sinse 1.0
 */
public class BatallaNaval{
	public static void main(String[] args){
		//Mensajes de bienvenida
		System.out.println("¡Bienvenidos al juego Batalla Naval!");
		System.out.println();
		
		//Instancia de la clase ControlJuego para comenzar el juego
		ControlJuego juego = new ControlJuego();
	}
}
