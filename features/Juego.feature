Feature:    Como    jugador
            Quiero  salir del juego
            Para    dejar de jugar
Scenario:
            Given   Visito la pagina de inicio
            Then    deberia mostrar el boton "Juega contra la PC"

Scenario:
            Given   Visito la pagina de inicio
            Then    deberia mostrar el boton "Multijugador"
Scenario:
            Given   Visito la pagina del juego 
            Then    deberia mostrar el boton "Menu Principal"
Scenario:
            Given   Visito la pagina del juego 
            Then    deberia mostrar el boton "Reiniciar"
Scenario:
            Given   Visito la pagina del juego 
            Then    deberia mostrar el boton "11"
Scenario:
            Given   Visito la pagina del juego 
            Then    deberia mostrar el boton "12"
Scenario:
            Given   Visito la pagina del juego 
            Then    deberia mostrar el boton "13"

Scenario:
            Given   Visito la pagina del juego 
            Then    deberia mostrar el boton "21"
Scenario:
            Given   Visito la pagina del juego 
            Then    deberia mostrar el boton "22"
Scenario:
            Given   Visito la pagina del juego 
            Then    deberia mostrar el boton "23"
Scenario:
            Given   Visito la pagina del juego 
            Then    deberia mostrar el boton "31"
Scenario:
            Given   Visito la pagina del juego 
            Then    deberia mostrar el boton "32"
Scenario:
            Given   Visito la pagina del juego 
            Then    deberia mostrar el boton "33"
  
Scenario:
            Given   Visito la pagina del juego
            When    presiono el boton "Reiniciar"  
            Then    deberia mostrar el boton "11"
Scenario:
            Given   Visito la pagina del juego
            When    presiono el boton "Menu Principal"  
            Then    deberia mostrar el boton "Multijugador"
Scenario:
            Given   Visito la pagina del juego
            Then    deberia mostrar el mensaje "Turno Jugador: X"