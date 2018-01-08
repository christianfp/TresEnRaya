require './lib/Game.rb'

describe Game do
    before (:each) do
       @game=Game.new
    end
    #matriz 11|12|13
    #       21|22|23
    #       31|32|33
    it "Si el jugador X lanza su turno en la posicion 11 del tablero deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(11,"X")
        expect(@game.getCasilla(11)).to eq "X"
    end
    it "Si el jugador O lanza su turno en la posicion 11 del tablero deberia devolver O" do
        @game.StartDefault()
        @game.anotarJugada(11,"O")
        expect(@game.getCasilla(11)).to eq "O"
    end
    it "Si el jugador 'X' lanza su turno en la posicion 11 y el jugador 'O' anoto en la posicion 12 del tablero deberia devolver false" do
        @game.StartDefault()
        @game.anotarJugada(11,"X")
        @game.anotarJugada(12,"O")
        expect(@game.comprobarSiEsGanador(13,"X")).to eq false
    end
    it "Si el jugador 'X' lanza su turno en la posicion 11 y el jugador 'O' anoto en la posicion 12, luego el jugador 'X' anoto en la posicion '13' del tablero deberia devolver false" do
        @game.StartDefault()
        @game.anotarJugada(11,"X")
        @game.anotarJugada(12,"O")
        @game.anotarJugada(13,"X")
        expect(@game.comprobarSiEsGanador(13,"X")).to eq false
    end
    it "Si el jugador 'X' anota en 11 y el jugador 'O' anoto en 12, luego el jugador X anoto en 13, luego 'O' anoto en 22 del tablero deberia devolver false" do
        @game.StartDefault()
        @game.anotarJugada(11,"X")
        @game.anotarJugada(12,"O")
        @game.anotarJugada(13,"X")
        @game.anotarJugada(22,"O")
        expect(@game.comprobarSiEsGanador(22,"O")).to eq false
    end
    it "Si el jugador 'X' anota en 11 y el jugador 'O' anoto en 12, luego el jugador X anoto en 13, luego 'O' anoto en 22 y 'X' anoto en 21 del tablero deberia devolver false" do
        @game.StartDefault()
        @game.anotarJugada(11,"X")
        @game.anotarJugada(12,"O")
        @game.anotarJugada(13,"X")
        @game.anotarJugada(22,"O")
        @game.anotarJugada(21,"X")
        expect(@game.comprobarSiEsGanador(21,"X")).to eq false
    end
    #Comprobar victoria en columnas
    it "Si el jugador 'X' anota en 11 y el jugador 'O' anoto en 12, luego el jugador X anoto en 13, luego 'O' anoto en 22 y 'X' anoto en 21, y 'O' anoto en 32 del tablero deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(11,"X")
        @game.anotarJugada(12,"O")
        @game.anotarJugada(13,"X")
        @game.anotarJugada(22,"O")
        @game.anotarJugada(21,"X")
        @game.anotarJugada(32,"O")
        expect(@game.comprobarSiEsGanador(32,"O")).to eq true
    end
    it "Si el jugador 'X' anota en 11 y el jugador 'O' anoto en 12, luego el jugador X anoto en 13, luego 'O' anoto en 22 y 'X' anoto en 21, y 'O' anoto en 32 del tablero deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(11,"X")
        @game.anotarJugada(13,"O")
        @game.anotarJugada(22,"X")
        @game.anotarJugada(23,"O")
        @game.anotarJugada(21,"X")
        @game.anotarJugada(33,"O")
        expect(@game.comprobarSiEsGanador(33,"O")).to eq true
    end

    it "Si el jugador 'X' anota en 11 y el jugador 'O' anoto en 12, luego el jugador X anoto en 13, luego 'O' anoto en 22 y 'X' anoto en 21, y 'O' anoto en 32 del tablero deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(13,"X")
        @game.anotarJugada(11,"O")
        @game.anotarJugada(22,"X")
        @game.anotarJugada(21,"O")
        @game.anotarJugada(33,"X")
        @game.anotarJugada(31,"O")
        expect(@game.comprobarSiEsGanador(31,"O")).to eq true
    end

    it "Si el jugador 'X' anota en 11 y el jugador 'O' anoto en 12, luego el jugador X anoto en 13, luego 'O' anoto en 22 y 'X' anoto en 21, y 'O' anoto en 32  y 'X' anota en 31 del tablero deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(11,"X")
        @game.anotarJugada(12,"O")
        @game.anotarJugada(13,"X")
        @game.anotarJugada(22,"O")
        @game.anotarJugada(21,"X")
        @game.anotarJugada(33,"O")
        @game.anotarJugada(31,"X")
        expect(@game.comprobarSiEsGanador(31,"X")).to eq true
    end
    it "Si el jugador 'X' anota en 11 y el jugador 'O' anoto en 12, luego el jugador X anoto en 13, luego 'O' anoto en 22 y 'X' anoto en 21, y 'O' anoto en 32 del tablero deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(11,"O")
        @game.anotarJugada(13,"X")
        @game.anotarJugada(22,"O")
        @game.anotarJugada(23,"X")
        @game.anotarJugada(21,"O")
        @game.anotarJugada(33,"X")
        expect(@game.comprobarSiEsGanador(33,"X")).to eq true
    end

    it "Si el jugador 'X' anota en 11 y el jugador 'O' anoto en 12, luego el jugador X anoto en 13, luego 'O' anoto en 22 y 'X' anoto en 21, y 'O' anoto en 32 del tablero deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(13,"O")
        @game.anotarJugada(11,"X")
        @game.anotarJugada(22,"O")
        @game.anotarJugada(21,"X")
        @game.anotarJugada(33,"O")
        @game.anotarJugada(31,"X")
        expect(@game.comprobarSiEsGanador(31,"X")).to eq true
    end
    #Comprobando victoria de X en filas
    it "Si el jugador 'X' anota en 11 y el jugador 'O' anoto en 21, luego el jugador X anoto en 12, luego 'O' anoto en 22 y 'X' anoto en 13 del tablero deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(11,"X")
        @game.anotarJugada(21,"O")
        @game.anotarJugada(12,"X")
        @game.anotarJugada(22,"O")
        @game.anotarJugada(13,"X")
    
        expect(@game.comprobarSiEsGanador(13,"X")).to eq true
    end
    it "Si 'X' anota en 21 el jugador 'O' en 11 'X' el jugador en 22 el jugador 'O' en 12 y el jugador 'X' en 23 deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(21,"X")
        @game.anotarJugada(11,"O")
        @game.anotarJugada(22,"X")
        @game.anotarJugada(12,"O")
        @game.anotarJugada(23,"X")
    
        expect(@game.comprobarSiEsGanador(23,"X")).to eq true
    end
    it "Si 'X' anota en 31 el jugador 'O' en 11 el jugador 'X' en 32 el jugador 'O' en 12 y el jugador 'X' en 33 deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(31,"X")
        @game.anotarJugada(11,"O")
        @game.anotarJugada(32,"X")
        @game.anotarJugada(12,"O")
        @game.anotarJugada(33,"X")
    
        expect(@game.comprobarSiEsGanador(33,"X")).to eq true
    end
    #Comprobando victoria de O en filas
    it "Si el jugador 'O' anota en 11 y el jugador 'X' anoto en 21, luego el jugador 'O' anoto en 12, luego 'X' anoto en 22 y 'O' anoto en 13 del tablero deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(11,"O")
        @game.anotarJugada(21,"X")
        @game.anotarJugada(12,"O")
        @game.anotarJugada(22,"X")
        @game.anotarJugada(13,"O")
    
        expect(@game.comprobarSiEsGanador(13,"O")).to eq true
    end
    it "Si 'O' anota en 21 el jugador 'X' en 11 'O' el jugador en 22 el jugador 'X' en 12 y el jugador 'O' en 23 deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(21,"O")
        @game.anotarJugada(11,"X")
        @game.anotarJugada(22,"O")
        @game.anotarJugada(12,"X")
        @game.anotarJugada(23,"O")
    
        expect(@game.comprobarSiEsGanador(23,"O")).to eq true
    end
    it "Si 'O' anota en 31 el jugador 'X' en 11 el jugador 'O' en 32 el jugador 'X' en 12 y el jugador 'O' en 33 deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(31,"O")
        @game.anotarJugada(11,"X")
        @game.anotarJugada(32,"O")
        @game.anotarJugada(12,"X")
        @game.anotarJugada(33,"O")
    
        expect(@game.comprobarSiEsGanador(33,"O")).to eq true
    end
    #COmprobando victprias de X en diagonales
    it "Si 'X' anota en 11 el jugador 'O' en 12 el jugador 'X' en 22 el jugador 'O' en 13 y el jugador 'X' en 33 deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(11,"X")
        @game.anotarJugada(12,"O")
        @game.anotarJugada(22,"X")
        @game.anotarJugada(13,"O")
        @game.anotarJugada(33,"X")
        expect(@game.comprobarSiEsGanador(33,"X")).to eq true
    end
    it "Si 'X' anota en 13 el jugador 'O' en 12 el jugador 'X' en 22 el jugador 'O' en 11 y el jugador 'X' en 31 deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(13,"X")
        @game.anotarJugada(12,"O")
        @game.anotarJugada(22,"X")
        @game.anotarJugada(11,"O")
        @game.anotarJugada(31,"X")
        expect(@game.comprobarSiEsGanador(31,"X")).to eq true
    end
     #Comprobando victorias de O en diagonales
     it "Si 'O' anota en 11 el jugador 'X' en 12 el jugador 'O' en 22 el jugador 'X' en 13 y el jugador 'O' en 33 deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(11,"O")
        @game.anotarJugada(12,"X")
        @game.anotarJugada(22,"O")
        @game.anotarJugada(13,"X")
        @game.anotarJugada(33,"O")
        expect(@game.comprobarSiEsGanador(33,"O")).to eq true
    end
    it "Si 'O' anota en 13 el jugador 'X' en 12 el jugador 'O' en 22 el jugador 'X' en 11 y el jugador 'O' en 31 deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(13,"O")
        @game.anotarJugada(12,"X")
        @game.anotarJugada(22,"O")
        @game.anotarJugada(11,"X")
        @game.anotarJugada(31,"O")
        expect(@game.comprobarSiEsGanador(31,"O")).to eq true
    end
    #comprobando empate
    it "Si 'X' anota en 11, el jugador 'O' anta en 22 el jugador 'X' anota  en 31, el jugador 'O'anota en 21 el jugador 'X' anota en 23 el jugador 'O' anota en 12 el jugador 'x' anota en 32, el jugador 'O' anota en 13, el jugador 'X'anota en 13 deberia devolver true" do
        @game.StartDefault()
        @game.anotarJugada(11,"X")
        @game.anotarJugada(22,"O")
        @game.anotarJugada(31,"X")
        @game.anotarJugada(21,"O")
        @game.anotarJugada(23,"X")
        @game.anotarJugada(12,"O")
        @game.anotarJugada(32,"X")
        @game.anotarJugada(33,"O")
        @game.anotarJugada(13,"X")
        expect(@game.devolverGanador(13)).to eq "Empate"
    end

    it "Si el jugador X anota en la posicion 11 deberia devolver la siguiente jugada igual a O"do
        @game.StartDefault()
        @game.setPrimero("X")
        @game.anotarPorTurno(11)
        expect(@game.devolverTurnoActual).to eq "O"
    end
    it "Si el jugador O anota en la posicion 11 deberia devolver la siguiente jugada igual a X"do
    @game.StartDefault()
    @game.setPrimero("O")
    @game.anotarPorTurno(11)
    expect(@game.devolverTurnoActual).to eq "X"
    end
    it "SI jugador X gana, deberia empezar el pederdor por tanto devolver turno actual igual a 'O'" do
        @game.StartDefault()
        @game.setPrimero("X")
        @game.anotarPorTurno(11)
        @game.anotarPorTurno(12)
        @game.anotarPorTurno(22)
        @game.anotarPorTurno(13)
        @game.anotarPorTurno(33)
        expect(@game.devolverTurnoActual).to eq "O"
    end
    it "SI jugador O gana, deberia empezar el pederdor por tanto devolver turno actual igual a 'X'" do
        @game.StartDefault()
        @game.setPrimero("O")
        @game.anotarPorTurno(11)
        @game.anotarPorTurno(12)
        @game.anotarPorTurno(22)
        @game.anotarPorTurno(13)
        @game.anotarPorTurno(33)
        expect(@game.devolverTurnoActual).to eq "X"
    end
end
