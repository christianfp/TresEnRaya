require 'sinatra'
require './lib/Game.rb'
$game=Game.new
$game.StartDefault()  
$quienEmpieza="X"
$game.setPrimero($quienEmpieza)
$multi=false
get '/Juego' do
    $multi=false
    $game.setMulti($multi)
    erb :Juego
end
post '/Juego' do
    $multi=false
    $game.setMulti($multi)
        erb :Juego 
end
post '/Reiniciar' do
    $game.StartDefault
    $game.setPrimero($quienEmpieza)
        erb :Juego 
end 
get '/' do
    $game.StartDefault
    $game.setPrimero($quienEmpieza)
    erb :PantallaPrincipal
end
post '/' do
    $game.StartDefault
    $game.setPrimero($quienEmpieza)
    erb :PantallaPrincipal
end

post '/MenuPrincipal' do
    erb :PantallaPrincipal
end
get '/MenuPrincipal' do
    erb :PantallaPrincipal
end


post '/11' do
    $game.anotarPorTurno(11)
    @ganador=$game.devolverGanador(12)
    if ($multi && (@ganador==" " || @ganador==nil))
        pos=$game.computadora($game.getSegundo())
        @jugadorActual=$game.anotarPorTurno(pos)
    end
    @ganador=$game.devolverGanador(11)
    if (@ganador==" " && $multi)
        @ganador=$game.devolverGanador(pos)
    end
    if(@ganador!=" ")
        $quienEmpieza=$game.devolverPerdedor(11)
    end
    erb :Juego
end

post '/12' do
    $game.anotarPorTurno(12)
    @ganador=$game.devolverGanador(12)
    if ($multi && (@ganador==" " || @ganador==nil))
        pos=$game.computadora($game.getSegundo())
        $game.anotarPorTurno(pos)
    end
    @ganador=$game.devolverGanador(12)
    if (@ganador==" "  && $multi)
        @ganador=$game.devolverGanador(pos)
    end
    if(@ganador!=" ")
        $quienEmpieza=$game.devolverPerdedor(12)
    end
    erb :Juego
end
post '/13' do
    $game.anotarPorTurno(13)
    @ganador=$game.devolverGanador(13)
    if ($multi && (@ganador==" " || @ganador==nil))
        pos=$game.computadora($game.getSegundo())
        $game.anotarPorTurno(pos)
    end
    @ganador=$game.devolverGanador(13)
    if (@ganador==" " && $multi)
        @ganador=$game.devolverGanador(pos)
    end
    if(@ganador!=" ")
        $quienEmpieza=$game.devolverPerdedor(13)
    end
    erb :Juego
end
post '/21' do
    $game.anotarPorTurno(21)
    @ganador=$game.devolverGanador(21)
    if ($multi && (@ganador==" " || @ganador==nil))
        pos=$game.computadora($game.getSegundo())
        $game.anotarPorTurno(pos)
    end
    @ganador=$game.devolverGanador(21)
    if (@ganador==" "  && $multi)
        @ganador=$game.devolverGanador(pos)
    end
    if(@ganador!=" " )
        $quienEmpieza=$game.devolverPerdedor(21)
    end
    erb :Juego
end
post '/22' do
    $game.anotarPorTurno(22)
    @ganador=$game.devolverGanador(22)
    if ($multi && (@ganador==" " || @ganador==nil))
        pos=$game.computadora($game.getSegundo())
        $game.anotarPorTurno(pos)
    end
    @ganador=$game.devolverGanador(22)
    if (@ganador==" "  && $multi)
        @ganador=$game.devolverGanador(pos)
    end
    if(@ganador!=" ")
        $quienEmpieza=$game.devolverPerdedor(22)
    end
    erb :Juego
end
post '/23' do
    $game.anotarPorTurno(23)
    @ganador=$game.devolverGanador(23)
    if ($multi && (@ganador==" " || @ganador==nil))
        pos=$game.computadora($game.getSegundo())
        $game.anotarPorTurno(pos)
    end
    @ganador=$game.devolverGanador(23)
    if (@ganador==" "  && $multi)
        @ganador=$game.devolverGanador(pos)
    end
    if(@ganador!=" ")
        $quienEmpieza=$game.devolverPerdedor(23)
    end
    erb :Juego
end
post '/31' do
    $game.anotarPorTurno(31)
    @ganador=$game.devolverGanador(31)
    if ($multi && (@ganador==" " || @ganador==nil))
        pos=$game.computadora($game.getSegundo())
        $game.anotarPorTurno(pos)
    end
    @ganador=$game.devolverGanador(31)
    if (@ganador==" "  && $multi)
        @ganador=$game.devolverGanador(pos)
    end
    if(@ganador!=" ")
        $quienEmpieza=$game.devolverPerdedor(31)
    end
    erb :Juego
end
post '/32' do
    $game.anotarPorTurno(32)
    @ganador=$game.devolverGanador(32)
    if ($multi && (@ganador==" " || @ganador==nil))
        pos=$game.computadora($game.getSegundo())
        $game.anotarPorTurno(pos)
    end
    
    @ganador=$game.devolverGanador(32)
    if (@ganador==" "  && $multi)
        @ganador=$game.devolverGanador(pos)
    end
    if(@ganador!=" ")
        $quienEmpieza=$game.devolverPerdedor(32)
    end
    erb :Juego
end
post '/33' do
    $game.anotarPorTurno(33)
    @ganador=$game.devolverGanador(33)
    if ($multi && (@ganador==" " || @ganador==nil))
        pos=$game.computadora($game.getSegundo())
        $game.anotarPorTurno(pos)
    end
    @ganador=$game.devolverGanador(33)
    if (@ganador==" "  && $multi)
        @ganador=$game.devolverGanador(pos)
    end
    if(@ganador!=" ")
        $quienEmpieza=$game.devolverPerdedor(33)
    end
    erb :Juego
end

get '/Multiplayer' do
    $multi=true
    $game.setMulti($multi)
    erb :Juego
end