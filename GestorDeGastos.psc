Algoritmo GestorDeGastos
	// Utilizar Indices en arreglos/cadenas en base 0 en la configuracion del lenguaje
	Escribir ""
	Escribir '--��Bienvenido a tu Gestor de Gastos!!--'
	Escribir ""
	// Declaraci�n de variables
	Definir opcion Como Entero
	Definir pos Como Entero
	Definir totalGeneral Como Real
	Definir maximoDeGastos Como Entero
	maximoDeGastos <- 5
	Dimensionar cantidadGasto(maximoDeGastos)
	Dimensionar categoriaGasto(maximoDeGastos)
	Dimensionar descripcionGasto(maximoDeGastos)
	pos <- 0
	totalGeneral <- 0
	// Ciclo principal
	
	Repetir
		Escribir ""
		Escribir 'Men� Principal:'
		Escribir 'Gastos ingresados = ', pos, ' (m�ximo ', maximoDeGastos, ')'
		Escribir 'Seleccione una opci�n: '
		Escribir '1. Registrar un gasto'
		Escribir '2. Mostrar lista de gastos'
		Escribir '3. Eliminar un gasto'
		Escribir '4. Salir'
		Leer opcion
		Seg�n opcion Hacer
			1:
				Si (pos<maximoDeGastos) Entonces
					// Registro de gastos
					Escribir 'Ingrese la cantidad gastada: '
					Leer cantidadGasto[pos]
					Escribir 'Ingrese la categor�a del gasto: '
					Leer categoriaGasto[pos]
					Escribir 'Ingrese una descripci�n: '
					Leer descripcionGasto[pos]
					// Actualizar el total general, aumentar pos, notificar �xito.
					totalGeneral <- totalGeneral+cantidadGasto[pos]
					pos <- pos+1
					Escribir 'Gasto registrado exitosamente.'
				SiNo
					Escribir 'No se pueden ingresar m�s de ', maximoDeGastos, ' gastos. L�mite alcanzado.'
				FinSi
			2:
				// Mostrar lista de gastos
				Para i<-0 Hasta pos-1 Con Paso 1 Hacer
					Escribir categoriaGasto[i], ' - ', descripcionGasto[i], ' - Monto: ', cantidadGasto[i]
				FinPara
				Escribir 'Total General de Gastos: ', totalGeneral
			3:
				// Eliminar un gasto
				Si (pos>0) Entonces
					Escribir 'Seleccione el n�mero de gasto que desea eliminar:'
					Para i<-0 Hasta pos-1 Con Paso 1 Hacer
						Escribir i, '. ', categoriaGasto[i], ' - ', descripcionGasto[i], ' - Monto: ', cantidadGasto[i]
					FinPara
					Leer opcionEliminar
					Si (opcionEliminar>=0 Y opcionEliminar<pos) Entonces
						// Restar el gasto eliminado del total general y reducir pos
						totalGeneral <- totalGeneral-cantidadGasto[opcionEliminar]
						// Mover los elementos restantes en el arreglo para llenar el espacio vac�o
						Para i<-opcionEliminar Hasta maximoDeGastos-2 Con Paso 1 Hacer
							cantidadGasto[i] <- cantidadGasto[i+1]
							categoriaGasto[i] <- categoriaGasto[i+1]
							descripcionGasto[i] <- descripcionGasto[i+1]
						FinPara
						// Borrar la ultima posicion del arreglo
						cantidadGasto[i] <- 0
						categoriaGasto[i] <- ''
						descripcionGasto[i] <- ''
						pos <- pos-1
						Escribir 'Gasto eliminado exitosamente.'
					SiNo
						Escribir 'N�mero de gasto no v�lido. Intente nuevamente.'
					FinSi
				SiNo
					Escribir 'No hay gastos para eliminar.'
				FinSi
			4:
				Escribir 'Saliendo del programa.'
			De Otro Modo:
				Escribir 'Opci�n no v�lida. Por favor, seleccione nuevamente.'
		FinSeg�n
	Hasta Que (opcion=4)
FinAlgoritmo
