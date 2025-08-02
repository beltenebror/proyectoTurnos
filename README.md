Hemos creado una aplicación de turnos para un centro de salud, este seria su funcionamiento general:



1\. Creación de ciudadano (pantalla inicial)

La aplicación requiere al menos un ciudadano registrado para poder crear turnos.

Por ese motivo, al iniciar la aplicación, se muestra directamente la pantalla de creación de ciudadano.

En este formulario se solicitan dos datos obligatorios:



Nombre



Apellidos



Ambos campos deben ser texto y no pueden quedar vacíos.

Al pulsar el botón "Crear", se guarda el ciudadano en la base de datos y ya podemos pasar a la opción del menú agregar turno.



2\. Creación de turno

Una vez creado al menos un ciudadano, se puede acceder desde el menú a la opción "Agregar turno".



El formulario de turnos incluye los siguientes campos:



Fecha:

Solo permite seleccionar fechas a partir del día siguiente a la fecha actual.

Esto garantiza que no se asignen turnos en el mismo día.



Hora:

Se puede elegir un horario entre 08:30 y 14:00, en franjas de 15 minutos.

Este intervalo refleja el horario del centro de salud y el tiempo estimado para atender a un paciente.



Estado del turno:

Se crea siempre en estado "EN ESPERA", ya que un turno no puede comenzar marcado como atendido.



Ciudadano asociado:

Se muestra un desplegable con los ciudadanos previamente registrados, permitiendo asignar el turno a uno de ellos.



Descripción:

Campo de texto libre donde se indica el motivo de la cita o cualquier otra información relevante.



Al pulsar el botón "Agregar turno", el sistema guarda el turno en la base de datos.



3\. Listado de turnos

Desde el menú también se puede acceder a la pantalla de listado de turnos.



Este listado muestra todos los turnos registrados, ordenados por un código único autogenerado y progresivo, lo que permite visualizar los turnos según su orden de creación.



Funciones del listado:



Filtrado por fecha y por estado:

Se puede visualizar solo los turnos en una fecha concreta, o según su estado (en espera / atendido).



Modificar estado del turno:

Desde una columna de acciones, se puede actualizar el estado de un turno de "EN ESPERA" a "ATENDIDO".





