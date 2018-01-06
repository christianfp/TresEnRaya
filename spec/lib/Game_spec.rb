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
    
    
end
