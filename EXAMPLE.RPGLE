
0001.00 **free                                                                 
0002.00   dcl-f clientes DISK(*EXT) USAGE(*INPUT)                              
0003.00                  EXTFILE('LIBRERIA1/CLIENTES') KEYED;                 
0004.00   dcl-f correocl DISK(*EXT) USAGE(*INPUT)                              
0005.00                  EXTFILE('LIBRERIA1/CORREOCL') KEYED;                 
0006.00   dcl-s contador packed(5:0) inz(0);                                   
0007.00   dcl-s correocli char(40);                                            
0008.00   // Leemos el Archivo Clientes                                        
0009.00   READ clientes;                                                       
0010.00   DOW NOT %EOF(clientes);                                              
0011.00    IF NOT %EOF(clientes);                                              
0012.00     contador+=1;
0013.00     // Buscamos el correo por que referencie al documento                                                
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