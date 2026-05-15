/**
 * Clase llamada ControlJuego, en esta se implementa toda la logica.
 * <p>
 * Esta clase representa todos los metodos y variable que fueron implementados para realizar el juego.
 * </p>
 * 
 * @author: Camila Peña Barrante C35902 y Marcela Lopez Torres C34403.
 * @version 1.0.0, 02/11/2023
 * @see www.plantuml.com/plantuml/png/dL91pzCm3BttL-JOQV07gcaQ6oSEW42SfXsyn8i2YJqvoIGqxRypcbHjD0xewoN9iz-p_TnTJ20f1zzTGVy2Y-ghy6_KYTLcSs5lKBRRUwUUd_OGepem9M7_AQFbWhzdZK3y8sOGnyENyNKy7K_Bw873DISmBF2ISGRH75j-6_i7k-MISMQMK8xIQxXHcLEY1YAKGNql5rLW0J8S1lLjF5KteklbzFsgO04fJtVA0OK_U8J4ufufmrHd3LRGWkp7ZlhYog1cBzuflUplpEmHQ3NSs9bQY6CIa49vauAZc2HhxPWmViGwnpB3k7W5uTXVd2yk_LNrEL1z_MzPjLHjrj0JXxFWq_0aZkngA6V9_9ajoDJH23swRlxzQjdxOhkJJjrGTQS9rULOJAFxVLioJZ1blF6-8SupJBtChUmXWVVm6MxWxtL3uAW7iN4IE9wgH64_kXsIoS7_0G00
 * @sinse 1.0
 */
import java.util.Scanner;//Se importa el scanner para obtener valores.
import java.util.Random;//Se importa el random para los numeros aleatorios.

public class ControlJuego{
	
	/*Referecias de las matrices y vectores tipo objeto, donde las matrices van a representar al oceano y los vectores
	 van a guardar los barcos agregados.*/
	private static Oceano[][] oceanoUsuario;
	private static Oceano[][] oceanoComputadora;
	private static Oceano[] barcosUsuario;
	private static Oceano[] barcosComputadora;
	
	//Instancias de Scanner y Random
	private static Scanner scanner = new Scanner(System.in);
	private static Random random = new Random();
	
	//Variables que tienen de valor la cantidad de los barcos.
	private int barcosHundidosUsuario = 5, barcosHundidosComputadora = 5;
	
	//Constructor que iniciliza los arreglos.
	ControlJuego(){
		oceanoUsuario = new Oceano[10][10];
		oceanoComputadora = new Oceano[10][10];
		barcosUsuario = new Oceano[5];
		barcosComputadora = new Oceano[5];
		menu();//metodo que muestra el menu del juego.
	}
	
	/*Metodo 1: Este metodo muestra lo que es el menu del juego, donde en las opciones hace el llamado de del metodo jugar y 
	*el metodo que muestra las instruciones.*/
	public void menu(){
		int opcionMenu = 0;
		
		do{
			
			//Menu del juego
			System.out.println();
			System.out.println("Menu Principal:");
			System.out.println("1.Iniciar juego");
			System.out.println("2.Ver instrucciones");
			System.out.println("3.Salir");
			System.out.print("Selecciona una opcion:");
			opcionMenu = scanner.nextInt();//Uso del scaner para tomar la variable.
			System.out.println();
			
			switch(opcionMenu){
				case 1:
				   jugar();
				   break;
				   
				case 2:
				   instruccionesDelJuego();
			 	   break;
			 	   
				case 3:
				   scanner.close();//Cierra el programa.
				   break;
				   
				default:
				   	System.out.println("Esta opcion en invalida");
			}
		}while(opcionMenu != 3 );
	}
	
	/*Metodo 2: Metodo que devuelve un numero aleatorio, para los turnos de la computadora. Se utiliza random.nextInt(10-1) para 
	*que genere un numero aleatorio entre 0 y 9.*/
	public int numeroAleatorio(){
		int numero;
		numero = random.nextInt(10-1);//la variable numero toma un valor del numero aleatorio.
		return numero;//devuelve el numero aleatorio.
	}
	
	/*Metodo 3: Este metodo agrega los barcos a las matrices. Lleva como parametro la matriz a la que se le van a agregar los barcos y una
	*variable booleana para saber si se le estan agregando los barcos al oceano de la computadora, para que asi no le pida las cordenadas
	* al usuario sino que las genere con el metodo numeroAleatorio.*/
	public void agregarBarcos(Oceano[][] oceano, boolean computadora){
		int cantidadBarcos = 0, fila = 0, columna =0;
		
		do{//Se inicia un bucle para guardar los 5 barcos, el cual se va a a salir de este cuando se hayan agregado los 5 barcos.
			if(computadora){//Si si es el oceano de la computadora entonces:
				fila = numeroAleatorio();//Lama al metodo numeroAleatorio para dar un valor aleatorio a la fila.
				columna = numeroAleatorio();//Lama al metodo numeroAleatorio para dar un valor aleatorio a la columna.
			} else {//Si no es el oceano de la computadora, es el  del usuario, le pide las coordenada al usuario.
				System.out.print("Agregue la coordenada X:");//Solicita al usuario la fila.
			    fila = scanner.nextInt();
			    System.out.print("Agregue la coordenada Y:");//Solicita al usuario la columna.
			    columna = scanner.nextInt();
			}
			
			//Se verifica que las cordenadas esten en el rango.
			if(fila >= 0 && fila < 10 && columna >= 0 && columna < 10 ){
				if(oceano[fila][columna] == null){//Si el campo indicado por las coordenadas estan vacias:
					oceano[fila][columna] = new Oceano("B");//agrega un barco en este.
					if(computadora){//Si es la computadora: 
						barcosComputadora[cantidadBarcos] = new Oceano("B");//Agrega un barco en el vector de este .
					}else{//Si es el usuario: 
						barcosUsuario[cantidadBarcos] = new Oceano("B");//Agrega un barco en el vector de este.
					}
					cantidadBarcos++;//contador: Aumenta la cantidad de barcos, nunca se va a pasar de 5.
				}else{//Si el campo no esta vacio manda un mensaje indicando que ya hay un barco en el lugar y muestra las coordenadas repetidas.
					System.out.println("Las coordenadas X: " + fila + " y" + ", Y " + columna + " ya estan ocupadas por un barco");
				}
			}else{//Si no lo estan manda un mensaje diciendo que estas no existen.
				System.out.println("Estas coordenadas no existen");
			}
		}while(cantidadBarcos != 5);//Continua hasta que se hayan agregado 5 barcos.
		
		//Se actualizan los oceanos globales, dependiendo de cual entro por parametro.
		if (computadora){
			oceanoComputadora = oceano;
		}else{
			oceanoUsuario = oceano;
		}
	}
	
	//Metodo 4:Muestra el estado del oceano.
	public  void mostrarOceano(Oceano[][] oceano, boolean computadora) {
    for (int f = 0; f < 10; f++) {
        for (int c = 0; c < 10; c++) {
            if (oceano[f][c] != null) {//Si esa posicion en la matriz esta llena:
                if (computadora) {//Si es la computadora:
                    if (oceano[f][c].getBarco().equals("H")) {
                        System.out.print("H ");//Para mostrar el valor de H como tiro acertado.
                    }else if (oceano[f][c].getBarco().equals("X")) {
                        System.out.print("X ");//Muestra el valor de X como tiro fallido.
                    } else {
                        System.out.print("O ");//Si es B o O se muestra O para que el usuario no vea los barcos del computador.
                    }
                } else {
                    System.out.print(oceano[f][c].getBarco() + " ");//Si no es la computadora que se muestren todos los datos normal.
                }
            } else {
                System.out.print("O ");//La posicion esta vacia.
            }
        }
        System.out.println(); // Agregar un salto de línea al final de cada fila.
    }
}
	//Metodo 5: Este metodo muestra las instrucciones del juego.
	public void instruccionesDelJuego(){
		System.out.println();//Salto de linea para que no se vea todo tan pegado.
		System.out.println("Instrucciones del juego");
		System.out.println("1.Los 2 jugadores deben de colocar 5 barcos en sus oceanos, mediantes las coordenadas (X,Y).");
		System.out.println("2.Los jugadores se turnaran para realizar los disparos al oceano enemigo, se volvera a pedir las coordenadas para dichos disparos.");
		System.out.println("3.El juego terminara hasta que alguno de los 2 jugadores pierda sus 5 barcos");
		System.out.println();//Salto de linea para que no se vea todo tan pegado.

	}
	
	/*Metodo 6:Este metodo verifica si lo que entra es la computadora o usario para hacer un analisis a cada uno diferente, va cambiando
	 los valores conforme a los tiros aceptados y fallados, lleva un controlador que se va reduciendo de los barcos.*/
	public void disparos(int fila,int columna,Oceano[][] oceano,  boolean computadora ){
		while(true){
			if(fila >= 0 && fila < 10 && columna >= 0 &&  columna<10){//Verifica que la fila y columna esten dentro del tamaño de la matriz.
				if(oceano[fila][columna] == null){//Si no existe un barco en esa posicion:
					oceano[fila][columna]= new Oceano( "X");//Agrega la x de fallido a la matriz.
					System.out.println("Fallaste el disparo!");
					System.out.println();//Salto de linea para que no se vea todo tan pegado.
		    	}else if(oceano[fila][columna].getBarco().equals("X")){//Si ya existe la x,y coloca la misma posicion.
					System.out.println("Fallaste, ya habias usado esta coordenada");
					System.out.println();//Salto de linea para que no se vea todo tan pegado.
				} else if(oceano[fila][columna].getBarco().equals("H")){//Si ya habia usado las mismas coordenadas pero habia acertado:
					System.out.println("¡Fallaste!, ya habias usado esta coordenada");
					System.out.println();//Salto de linea para que no se vea todo tan pegado.
				}else if(oceano[fila][columna].getBarco().equals("B")){//Si en esas posiciones si existe un barco:
					oceano[fila][columna].setBarco("H");//Declara un tiro acertado.
					
					if(computadora){//Si es computadora quien juega.
						System.out.println("¡Le han dado a uno de tus barcos!");
						System.out.println();//Salto de linea para que no se vea todo tan pegado.
						barcosHundidosUsuario--; //Disminuimos los barcos del usuario, ya que ella juega con la matriz de el, cada vez que le pegue a un barco, sera el del usuario.
						barcosUsuario[barcosHundidosUsuario] = null; //Libero esa posicion en el arreglo, pues es un barco menos.
					}else{
						System.out.println("¡Acertaste!");
						System.out.println();//Salto de linea para que no se vea todo tan pegado.
						barcosHundidosComputadora--;//Disminuyen los barcos del computador.
						barcosComputadora[barcosHundidosComputadora] = null;//Libera esa posicion en el arreglo.
					}
				}
				
				//Actualiza las matrices globales.
				if(computadora){//Si es la computadora:
					oceanoUsuario = oceano;
					
				}else{//Si es el usuario:
					oceanoComputadora = oceano;
					
				}
				
				System.out.println("Oceano del jugador:");//Si es el oceano del jugador:
				mostrarOceano(oceanoUsuario,false);//despues de declarar la matriz, paso el falso para decir que es la matriz del usuario.
				System.out.println();
				System.out.println("Oceano de la computadora:");
				mostrarOceano(oceanoComputadora,true);//Para mostrar la matriz del computador y sus valores.
				break;
				 
			}else{
				//Esto solo funciona para el usuario, ya que el random sigue un patron y todos esos numeros si existen dentro de la matriz.
				System.out.println("Esas coordenadas no existen");
				System.out.print("Agregar nuevamente la coordenada X:");
				fila = scanner.nextInt();
				System.out.print("Agregar nuevamente la coordenada Y:");
				columna = scanner.nextInt();
			}
		}
	}
	//Metodo 7: Barcos hundidos, muestra un mensaje de felicitacion, una vez hundido todos los barcos.
	public String barcosHundidos( String nombre){
		System.out.println();
		  return("¡Felicidasdes "+ nombre+ "!, has hundido los barcos de tus contrincantes");
	}
	
	/*Metodo 8: Jugar, funciona a partir de los otros metodos que son llamados,el juego termina una vez hayan acabado con todos los barcos, 
	 * entonces este valor le colocara el 1, lo que representa que uno de los dos bandos gano.*/
	public void jugar(){
		int terminarJuego = 0;//Se inicializa con 0 para que despues tome el valor de salida.
		int cordenadaX,cordenadaY;
		
		System.out.println("Iniciando el juego...");//Mensaje.
		System.out.println("Agregando barcos del usuario");//Agrega los barcos por el metodo agregarBarco.
		agregarBarcos(oceanoUsuario,false);//Entra el valor de falso, ya que no es computadora.
		System.out.println();//Salto de linea para que no se vea todo tan pegado.
		System.out.println("Barcos del jugador");	    
	    mostrarOceano(oceanoUsuario,false);//Muestra el oceano una vez
		

        System.out.println();
	    System.out.println("Agregando barcos de la computadora");//Agrega los barcos por el metodo agregarBarco.
	    agregarBarcos(oceanoComputadora,true);//Entra el true porque es computadora.
	    System.out.println();//Salto de linea para que no se vea todo tan pegado.
	    System.out.println("Barcos de la computadora");	   
	    mostrarOceano(oceanoComputadora,true);//Muestra el oceano una vez.
	   
		
		do{
			
		   System.out.println();//Salto de linea para que no se vea todo tan pegado.
		   System.out.println("Turno del Jugador");//Mensaje para jugar.
		   System.out.println();
		   System.out.print("Ingresar coordenada X (0-9):");//ingreso de coordenadas.
		   cordenadaX = scanner.nextInt();
		   System.out.print("Ingresar coordenada Y (0-9):");
		   cordenadaY = scanner.nextInt();//Salto de linea para que no se vea todo tan pegado.
		   disparos(cordenadaX,cordenadaY,oceanoComputadora,false);//Se ejecuta a partir del metodo disparos.
		   
		   System.out.println();//Salto de linea para que no se vea todo tan pegado.
		   System.out.println("Turno de la Computadora");//Mensaje jugada computador.
		   cordenadaX = numeroAleatorio();//Se ejecuta a partir del metodo numeroAleatorio.
		   cordenadaY = numeroAleatorio();
		   disparos(cordenadaX,cordenadaY,oceanoUsuario,true);//Se ejecuta a partir del metodo disparos.
			
			//Verfica si ya estan los 5 barcos hundidos.
			if(barcosHundidosUsuario == 0){
				System.out.println(barcosHundidos("Computadora"));
				terminarJuego=1;//Valor para controlar el juego y darlo por terminado.
			}
			
			if(barcosHundidosComputadora == 0){
				System.out.println(barcosHundidos("Usuario"));
				terminarJuego=1;//Valor para controlar el juego y darlo por terminado.
			}
			
		}while(terminarJuego!=1);
		
	}
}
