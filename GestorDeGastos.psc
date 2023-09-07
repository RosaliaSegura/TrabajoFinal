Algoritmo GestorDeGastos
	// Utilizar Indices en arreglos/cadenas en base 0 en la configuracion del lenguaje
	Escribir ""
	Escribir '--¡¡Bienvenido a tu Gestor de Gastos!!--'
	Escribir ""
	// Declaración de variables
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
		Escribir 'Menú Principal:'
		Escribir 'Gastos ingresados = ', pos, ' (máximo ', maximoDeGastos, ')'
		Escribir 'Seleccione una opción: '
		Escribir '1. Registrar un gasto'
		Escribir '2. Mostrar lista de gastos'
		Escribir '3. Eliminar un gasto'
		Escribir '4. Salir'
		Leer opcion
		Según opcion Hacer
			1:
				Si (pos<maximoDeGastos) Entonces
					// Registro de gastos
					Escribir 'Ingrese la cantidad gastada: '
					Leer cantidadGasto[pos]
					Escribir 'Ingrese la categoría del gasto: '
					Leer categoriaGasto[pos]
					Escribir 'Ingrese una descripción: '
					Leer descripcionGasto[pos]
					// Actualizar el total general, aumentar pos, notificar éxito.
					totalGeneral <- totalGeneral+cantidadGasto[pos]
					pos <- pos+1
					Escribir 'Gasto registrado exitosamente.'
				SiNo
					Escribir 'No se pueden ingresar más de ', maximoDeGastos, ' gastos. Límite alcanzado.'
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
					Escribir 'Seleccione el número de gasto que desea eliminar:'
					Para i<-0 Hasta pos-1 Con Paso 1 Hacer
						Escribir i, '. ', categoriaGasto[i], ' - ', descripcionGasto[i], ' - Monto: ', cantidadGasto[i]
					FinPara
					Leer opcionEliminar
					Si (opcionEliminar>=0 Y opcionEliminar<pos) Entonces
						// Restar el gasto eliminado del total general y reducir pos
						totalGeneral <- totalGeneral-cantidadGasto[opcionEliminar]
						// Mover los elementos restantes en el arreglo para llenar el espacio vacío
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
						Escribir 'Número de gasto no válido. Intente nuevamente.'
					FinSi
				SiNo
					Escribir 'No hay gastos para eliminar.'
				FinSi
			4:
				Escribir 'Saliendo del programa.'
			De Otro Modo:
				Escribir 'Opción no válida. Por favor, seleccione nuevamente.'
		FinSegún
	Hasta Que (opcion=4)
FinAlgoritmo
