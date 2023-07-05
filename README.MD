# Guia Práctica RPGLE FREE FORMAT

## Que es RPG 

  RPG es un Lenguaje de Programación Desarrollado por IBM originalmente 
  para generar informes comerciales o de negocios. 
  Sus siglas en inglés significan Report Program Generator

### Acerca de Esta Guía Práctica

  La presente guia se estará realizando conforme el autor encuentre
  formas practicas de cada una de las funciones que el lenguaje RPG
  proporcione y conforme se encuentre con nuevas soluciones Aquí se estara marcando 
  cada una de ellas detallando el funcionamiento de cada una de ellas

## Declaración 

  - dcl-s: (declare scalar), se usa para declarar variables.  
  Ejemplo: dcl-s nombre char(40);  

  - dcl-c: (declare constant), se usa para declarar constantes.  
  Ejemplo: dcl-c tipodocume char(1);  

  - dcl-f: (declare file), utilizado para declarar Archivos.  

  - dcl-ds: (declare datastructure), utilizado para declarar estructuras de datos.  

  - Entre otras.
  
### *En el caso de variables y contantes podemos inicializarla con un valor*
*Ejemplo:* <br>
  ````
  dcl-s nombre char(40) inz('islender'); 
  dcl-c tipodocume char(1) inz('P');
  ````
### *En mi caso declaro los archivos de la siguiente forma:*
  ````
   dcl-f nombrearchivo DISK(*EXT) USAGE(*INPUT) 
                       EXTFILE('LIBRERIA/ARCHIVO') KEYED;
  ````
### *Ejemplo con un archivo llamado clientes que se encuentra en una libreria llamada data*                    
  ````
   dcl-f clientes DISK(*EXT) USAGE(*INPUT) 
                       EXTFILE('DATA/CLIENTES') KEYED;
  ````

## Explicación dcl-f 
  - **DISK** indica que el archivo está almacenado en un dispositivo de almacenamiento de disco.  

  - **DISK(*EXT)**</b> en la declaración de un archivo, significa que el archivo no está físicamente presente en la biblioteca del programa actual, sino que se encuentra en una ubicación externa. 
  Para acceder a un archivo externo, debes proporcionar la información necesaria en la palabra clave EXTFILE seguida de la biblioteca y el nombre del archivo externo.  

  - **USAGE** se utiliza en la declaración de archivos para especificar el propósito principal del archivo en el programa.  La palabra clave "USAGE" acepta diferentes valores para indicar el propósito y el tipo de acceso del archivo.  

  - **USAGE(*INPUT)** Indica que el archivo se utilizará principalmente para operaciones de lectura. Se utiliza cuando el programa necesita acceder a los datos del archivo para su procesamiento, pero no realizará modificaciones o adiciones en los registros.  

  - **USAGE(*OUTPUT)**  Indica que el archivo se utilizará principalmente para operaciones de escritura.se utiliza cuando el programa necesita generar y almacenar nuevos registros en el archivo.  

  - **USAGE(*UPDATE)**  Indica que el archivo se utilizará tanto para operaciones de lectura como de escritura. Se utiliza cuando el programa necesita leer, modificar o agregar registros en el archivo.  

  - **USAGE(*EXTEND)** Indica que el archivo se utilizará principalmente para agregar nuevos registros al final del archivo. Se utiliza cuando el programa solo necesita realizar operaciones de escritura para agregar nuevos registros sin modificar los registros existentes.  

  - **EXFILE(LIB/ARCHIVO)** se utiliza en la declaración de archivos para especificar el nombre y la ubicación del archivo externo al que se va a acceder. "EXTFILE" se utiliza junto con la palabra clave "DISK(*EXT)" para indicar que el archivo está ubicado fuera de la biblioteca actual del programa.  

  - **KEYED** se utiliza en la declaración de un archivo en RPGLE para indicar que el archivo está organizado de manera clave. La organización clave significa que los registros del archivo se organizan y almacenan en función de una clave única.   
  Al utilizar la palabra clave "KEYED" en la declaración del archivo, estás indicando al compilador que el archivo está diseñado para permitir búsquedas rápidas y eficientes basadas en la clave. Esto significa que puedes realizar operaciones de búsqueda, como SETLL (Set Lower Limit), CHAIN (Read Equal), READE (Read Equal), entre otras, utilizando el campo clave para ubicar rápidamente registros específicos en el archivo.

## RPGLE TIPOS DE DATOS MAS USADOS

  ### Dato tipo texto (caracter)
   - char: Una cadena con una longitud definida. dcl-s nombre char(40);  

   - varchar: Caracter Variable.  dcl-s nombre varchar(128); 

  ### Dato Tipo numerico

   - int: Entero. dcl-s contador int(1) inz(0); int(1) -> -128 a 127  

   - uns: Entero sin decimal. contador uns(1); sin numeros negativos  

   - packed: numérico que puede contener números decimales. dcl-s sueldo packed(5:2). -> ejmp 999,99  

   - zoned: numérico que puede contener números decimales.  
   
   ### Dato Tipo Fecha
   - date: Un tipo de datos que contiene fechas adecuadas. Como un calendario incorporado. Almacena solo la fecha con el formato predeterminado *ISO (AAAA-MM-DD).  dcl-s fecha date; hay *ISO, *USA ....
   investigar  


   - time: Un tipo de datos que almacena la hora en un formato adecuado. Se puede utilizar para realizar cálculos de tiempo. Hay muchos formatos diferentes con diferentes separadores, pero el predeterminado es *ISO (hh.mm.ss)


   - timestamp Una fecha y hora completas combinadas hasta 12 fracciones de segundo. Algo así como un sello en el tiempo, un momento exacto en el tiempo. Los milisegundos son opcionales pero por defecto tienen una precisión de 6 dígitos. (AAAA-MM-DD-hh:mm:ss.ffffff)

   ### Otros tipos de Datos

   - ind El equivalente de RPG de un booleano. Solo puede contener los valores '0' y '1', lo que indica si ha ocurrido algo o no. Está encendido o apagado. Verdadero o falso. dcl-s indicador ind inz(*on)

   - pointer Los punteros de base se utilizan para ubicar el almacenamiento de variables basadas

## Funciones e Instrucciones Usados en RPGLE FREE

 - **READ archivo** dicha instrucción se utiliza para leer un registro de un archivo en un programa. Permite recuperar los valores de los campos del registro y almacenarlos en variables definidas en el programa.  

 - **%EOF(archivo)** es una función que se utiliza para verificar si se ha alcanzado el final de un archivo. La función %EOF devuelve un valor booleano (0 o 1) que indica si el puntero de lectura del archivo ha llegado al final o no. Devuelve false(0) si no es el fin y true si es el final (1)

 - **CHAIN clave archivo** se utiliza para buscar un registro específico en un archivo utilizando un valor de clave. La instrucción CHAIN se utiliza principalmente en archivos organizados de manera clave para ubicar rápidamente un registro basado en un valor de clave.  

 - **%FOUND** En RPGLE, %FOUND es una condición que se utiliza para verificar si una operación de búsqueda (CHAIN, SETLL, READ(E), etc.) ha encontrado un registro en un archivo. La condición %FOUND devuelve un valor booleano (0 o 1) que indica si se ha encontrado un registro que coincida con la operación de búsqueda o no. Si coincide devuelve true(1) de lo contrario false(0). *EL %FOUND TAMBIEN PUEDE USARSE DE LA SIGUIENTE MANERA %FOUND(archivobusqueda). este se usa en su mayoria acompañado de un condicional if.  

 - **%CHAR(VARIABLE A CONVERTIR):** Se utiliza para convertir un tipo de dato a caracter, es decir convierte por ejemplo para convertir un tipo de dato entero a caracter

# Condicionales
 
 Condicional IF

 IF condicion;<br>
   &nbsp; // ejecucion si se cumple la condicion<br>
 ENDIF;

 OTRA FORMA SERIA IF-ELSE STATEMENT

 IF condicion;<br>
   &nbsp; // Ejecucion si se cumple la condicion<br>
 ELSE;<br>
   &nbsp; // Ejecucion si no se cumple la condicion<br>
 ENDIF;

<br><br> 
 
# Ciclos en RPG

 ### Ciclo DOW

  El ciclo DOW (Do While) se utiliza para repetir un bloque de código mientras se cumpla una condición al inicio del ciclo. 

  ````
  // Ciclo DOW con una condición
  dcl-s contador Int(10) Inz(1);

  dow contador <= 5;
    // Realizar acciones dentro del ciclo
    dsply 'Contador: ' + %char(contador);
    // Incrementar el contador
    contador += 1;
  enddo;

  ````

  ### Ciclo DOW NOT

  El ciclo DOW NOT (Do While Not) se utiliza para repetir un bloque de código mientras NO se cumpla una condición al inicio del ciclo.

  ````
    // Ciclo DOW NOT con una condición
    dcl-s contador Int(10) Inz(1);
    dow not (contador > 5);
      // Realizar acciones dentro del ciclo
      dsply 'Contador: ' + %char(contador);
  
       // Incrementar el contador
       contador += 1;
    enddo;
  ````

  ## Otros Ciclos
   
   Proximamente .....  


# Nota   
 *En rpgle similar a python se usa la identacion para determinar que bloque de codigo pertenece ya sea a un ciclo, condicion, entre otro.*
<br><br>
<hr> 

## Ejemplo de uso de lo anteriormente expuesto

 ````
  0001.00 **free                                                                 
  0002.00   dcl-f clientes DISK(*EXT) USAGE(*INPUT)                              
  0003.00                  EXTFILE('LIBRERIA1/CLIENTES') KEYED;                 
  0004.00   dcl-f correocl DISK(*EXT) USAGE(*INPUT)                              
  0006.00   dcl-s contador packed(5:0) inz(0);                                   
  0005.00                  EXTFILE('LIBRERIA1/CORREOCL') KEYED;                 
  0007.00   dcl-s correocli char(40);                                            
  0008.00   // Leemos el Archivo Clientes                                        
  0009.00   READ clientes;                                                       
  0010.00   DOW NOT %EOF(clientes);                                              
  0011.00    IF NOT %EOF(clientes);                                              
  0012.00     contador+=1;
  0013.00     // Buscamos el correo que se referencie                                                 
  0014.00     CHAIN DOCUMENTO correocl;                                          
  0015.00     IF %FOUND(correocl);                                               
  0016.00      correocli = CORREO;                                               
  0017.00     ELSE;                                                              
  0018.00      correocli = 'Sin correo';                 
  0019.00     ENDIF;                                     
  0020.00     DSPLY '-----------------------';           
  0021.00     DSPLY ('Cliente: ' + NOMBRE);              
  0022.00     DSPLY ('Correo: ' + correocli);            
  0023.00     DSPLY '-----------------------';           
  0024.00    ENDIF;                                      
  0025.00    READ clientes;                              
  0026.00   ENDDO;                                       
  0027.00   RETURN;    
 ````
