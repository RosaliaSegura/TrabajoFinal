Algoritmo GestorDeGastos
    // Declaraci�n de variables
    Definir opcion Como Entero
    Definir pos Como Entero
    Definir totalGeneral Como Real
    Definir maximoDeGastos Como Entero
    maximoDeGastos <- 10
	
    Dimension cantidadGasto[maximoDeGastos]
    Dimension categoriaGasto[maximoDeGastos]
    Dimension descripcionGasto[maximoDeGastos]
    pos <- 0
    totalGeneral <- 0
	
    // Ciclo principal
    Repetir
        Escribir "Men� Principal:"
        Escribir "Gastos ingresados = ", pos, " (m�ximo ", maximoDeGastos, ")"
        Escribir "Seleccione una opci�n: "
        Escribir "1. Registrar un gasto"
        Escribir "2. Mostrar lista de gastos"
        Escribir "3. Eliminar un gasto"
        Escribir "4. Salir"
		
        Leer opcion
		
        Segun opcion Hacer
            Caso 1:
                Si (pos < maximoDeGastos) Entonces
                    // Registro de gastos
                    Escribir "Ingrese la cantidad gastada: "
                    Leer cantidadGasto[pos]
					
                    Escribir "Ingrese la categor�a del gasto: "
                    Leer categoriaGasto[pos]
					
                    Escribir "Ingrese una descripci�n: "
                    Leer descripcionGasto[pos]
					
                    // Actualizar el total general, aumentar pos, notificar �xito.
                    totalGeneral <- totalGeneral + cantidadGasto[pos]
                    pos <- pos + 1
                    Escribir "Gasto registrado exitosamente."
                Sino
                    Escribir "No se pueden ingresar m�s de ", maximoDeGastos, " gastos. L�mite alcanzado."
                Fin Si
				
            Caso 2:
                // Mostrar lista de gastos
                Para i <- 0 Hasta pos - 1 Con Paso 1 Hacer
                    Escribir categoriaGasto[i], " - ", descripcionGasto[i], " - Monto: ", cantidadGasto[i]
                Fin Para
                Escribir "Total General de Gastos: ", totalGeneral
				
            Caso 3:
                // Eliminar un gasto
                Si (pos > 0) Entonces
                    Escribir "Seleccione el n�mero de gasto que desea eliminar:"
                    Para i <- 0 Hasta pos - 1 Con Paso 1 Hacer
                        Escribir i, ". ", categoriaGasto[i], " - ", descripcionGasto[i], " - Monto: ", cantidadGasto[i]
                    Fin Para
					
                    Leer opcionEliminar
					
                    Si (opcionEliminar >= 0 Y opcionEliminar < pos) Entonces
						// Restar el gasto eliminado del total general y reducir pos
                        totalGeneral <- totalGeneral - cantidadGasto[opcionEliminar]
                        // Mover los elementos restantes en el arreglo para llenar el espacio vac�o
                        Para i <- opcionEliminar Hasta maximoDeGastos - 2 Con Paso 1 Hacer
                            cantidadGasto[i] <- cantidadGasto[i + 1]
                            categoriaGasto[i] <- categoriaGasto[i + 1]
                            descripcionGasto[i] <- descripcionGasto[i + 1]
                        Fin Para
						//Borrar la ultima posicion del arreglo
						cantidadGasto[i] <- 0
						categoriaGasto[i] <- ""
						descripcionGasto[i] <- ""
                        
                        pos <- pos - 1
                        Escribir "Gasto eliminado exitosamente."
                    Sino
                        Escribir "N�mero de gasto no v�lido. Intente nuevamente."
                    Fin Si
                Sino
                    Escribir "No hay gastos para eliminar."
                Fin Si
				
            Caso 4:
                Escribir "Saliendo del programa."
				
            De Otro Modo:
                Escribir "Opci�n no v�lida. Por favor, seleccione nuevamente."
        FinSegun
		
    Hasta que (opcion = 4)
FinAlgoritmo
