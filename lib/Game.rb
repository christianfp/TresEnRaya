require 'matrix'
class Game
def StartDefault()
    @matriz=[[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]]
    @turno=1
    @Primero=nil
    @segundo=nil
    @multi=nil
    @ganador=nil
    @jugadorActual=""
end
def initialize
    
end
def devolverTurnoActual
    return @jugadorActual
end
def getSegundo()
    return @segundo
end
def setMulti(valor)
    @multi=valor    
end
def devolverPerdedor(posicion)
    if(devolverGanador(posicion)=="X")
        return "O"
    else
        return "X"
    end
end


def comprobarSiEsGanador(valor,caracter)
    fila=valor/10
    columna=valor%10
    fila=fila-1
    columna=columna-1

    caracter=triplicarCaracter(caracter)
    if(comprobarFila(fila)==caracter || comprobarColumna(columna)==caracter || comprobarDiagonalPrimaria==caracter || comprobarDiagonalSecundaria==caracter)
        return true
    else
        return false
    end
end
def devolverGanador(posicion)
    if(comprobarSiEsGanador(posicion,"X"))
        @ganador="X"
        return "X"
    elsif (comprobarSiEsGanador(posicion,"O"))
        @ganador="O"
        return "O"
    elsif(@turno==10)
        @ganador="Empate"
        return "Empate"
    else
        @ganador=nil
        return " "
    end
end


def triplicarCaracter(caracter)
    resultado=""
    for x in 0..2
        resultado=resultado + caracter
    end
    return resultado
end
def duplicarCaracter(caracter)
    resultado=""
    for x in 0..1
        resultado=resultado + caracter
    end
    return resultado
end
def setPrimero(valor)
    @Primero=valor
    @jugadorActual=valor
    if(valor=="X")
        @segundo="O"
    else

        @segundo="X"
    end
end
def anotarJugada(valor,caracter)
    
    fila=(valor/10)
    columna=(valor%10)
    fila=fila-1
    columna=columna-1

    respuesta=false
    if( @matriz[fila][columna] == nil)
        @matriz[fila][columna]=caracter;
        if( @matriz[fila][columna] == caracter)
            @turno=@turno+1  
            return true
        end
    end
    return respuesta
end
def anotarPorTurno (posicion)
    if (@ganador==" " || @ganador==nil)
        if(@turno %2 !=0)
            anotarJugada(posicion,@Primero)
            @jugadorActual=@segundo
        else
            anotarJugada(posicion,@segundo)
            @jugadorActual=@Primero
        end
    end
    
end
def getCasilla(posicion)
    fila=(posicion/10)
    columna=(posicion%10)
    fila=fila-1
    columna=columna-1
    return @matriz[fila][columna]
end
def comprobarFila(fila)
    sumar=""
    for x in 0..2
        if (@matriz[fila][x]!=nil)
            sumar = sumar + @matriz[fila][x]
            
        end

    end

    return sumar
end
def comprobarColumna(columna)
    sumar=""
        for x in 0..2
            if (@matriz[x][columna]!=nil)
                sumar = sumar + @matriz[x][columna]
                
            end
        end
   
    return sumar
end

def comprobarDiagonalPrimaria
    sumar=""
        for x in 0..2
            if (@matriz[x][x]!=nil)
                sumar = sumar + @matriz[x][x]
            end
        
        end
    return sumar
end

def comprobarDiagonalSecundaria
    sumar=""
    fil=0
    col=2
        for x in 0..2
            
            if (@matriz[fil][col]!=nil)
                sumar = sumar + @matriz[fil][col]
            end
        fil=fil+1
        col=col-1
        end
    return sumar
end


def mostrar
    sumar=""
    for x in 0..2
        for y in 0..2
            if(@matriz[x][y]==nil)
                sumar=sumar+" ";
            else
                sumar=sumar+ @matriz[x][y]
            end
            
        end
         puts "#{sumar}"
         sumar=""
    end
end

def mostrar23
    for x in 0..2
        for y in 0..2
            puts "hola!!"
         end
    end
end
def computadora(ficha)
    contrario=""
    if(ficha=="X")
        contrario="O"
    else
        contrario="X"
    end
    matPosiblesJugadas=[[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]]
    for x in 0..2
        for y in 0..2
            if(@matriz[x][y]!=nil)
                matPosiblesJugadas[x][y] = -1
            end
         end
    end
    mejorJugada=-1
    jugadaAux=""
    mejorJugadaMatrizAux=-1
    if(@turno==2)
        mejorJugada=primerTurnoComputadora(ficha)
    else
        for i in 0..2
            for j in 0..2
                if(matPosiblesJugadas[i][j] != -1)
                    if(comprobarFila(i)=="" || comprobarFila(i)=="XO" || comprobarFila(i)=="OX" || comprobarFila(i) == contrario)
                        matPosiblesJugadas[i][j]=0
                    end
                    if(comprobarFila(i)==ficha)
                        matPosiblesJugadas[i][j]=1
                    end
                    if(comprobarFila(i)==duplicarCaracter(contrario))
                        matPosiblesJugadas[i][j]=3
                    end
                    if(comprobarFila(i)==duplicarCaracter(ficha))
                        matPosiblesJugadas[i][j]=4
                    end


                    #comprobando columnas
                    if(comprobarColumna(j)=="" || comprobarColumna(j)=="XO" || comprobarColumna(j)=="OX" || comprobarColumna(j)==contrario)
                        matPosiblesJugadas[i][j]=0
                    end
                    if(comprobarColumna(j)==ficha)
                        matPosiblesJugadas[i][j]=1
                    end
                    if(comprobarColumna(j)==duplicarCaracter(contrario))
                        matPosiblesJugadas[i][j]=3
                    end
                    if(comprobarColumna(j)==duplicarCaracter(ficha))
                        matPosiblesJugadas[i][j]=4
                    end
                    #diagonales
                    if((i+j)%2==0)
                        #diagonal primaria
                        if(comprobarDiagonalPrimaria=="" || comprobarDiagonalPrimaria=="XO" || comprobarDiagonalPrimaria=="OX" || comprobarDiagonalPrimaria==contrario)
                        matPosiblesJugadas[i][j]=0
                        end
                        if(comprobarDiagonalPrimaria==ficha)
                            matPosiblesJugadas[i][j]=1
                        end
                        if(comprobarDiagonalPrimaria==duplicarCaracter(contrario))
                            matPosiblesJugadas[i][j]=3
                        end
                        if(comprobarDiagonalPrimaria==duplicarCaracter(ficha))
                            matPosiblesJugadas[i][j]=4
                        end
                        #diagonal secundaria
                        if(comprobarDiagonalSecundaria=="" || comprobarDiagonalSecundaria=="XO" || comprobarDiagonalSecundaria=="OX" || comprobarDiagonalSecundaria==contrario)
                        matPosiblesJugadas[i][j]=0
                        end
                        if(comprobarDiagonalSecundaria==ficha)
                            matPosiblesJugadas[i][j]=1
                        end
                        if(comprobarDiagonalSecundaria==duplicarCaracter(contrario))
                            matPosiblesJugadas[i][j]=3
                        end
                        if(comprobarDiagonalSecundaria==duplicarCaracter(ficha))
                            matPosiblesJugadas[i][j]=4
                        end
                    end
                end
            end
        end
        xAux=0
        yAux=0
        total=0
        for x in 0..2
            for y in 0..2
                #puts "#{matPosiblesJugadas[x][y]}"
                
                if(matPosiblesJugadas[x][y]>mejorJugadaMatrizAux)
                    xAux=x+1
                    yAux=y+1
                    total=(xAux*10)+yAux
                    mejorJugadaMatrizAux=matPosiblesJugadas[x][y]
                    mejorJugada=total
                    puts "#{xAux} , #{yAux} "
                end
            end
        end
    end
    return mejorJugada
end

def primerTurnoComputadora(ficha)
    respuesta=0
    if(@matriz[1][1]!=nil)
        respuesta=33    #escoge la ultima casilla
    end
    if(@matriz[0][0]!=nil || @matriz[0][2]!=nil || @matriz[2][0]!=nil || @matriz[2][2]!=nil)
        respuesta=22       #escoge la del medio
    end
    if(@matriz[1][0]!=nil || @matriz[1][2]!=nil || @matriz[0][1]!=nil || @matriz[2][1]!=nil)
        if (@matriz[1][0]!=nil)
            respuesta=31
        end
        if (@matriz[1][2]!=nil)
            respuesta=33
        end
        if (@matriz[0][1]!=nil)
            respuesta=11
        end
        if (@matriz[2][1]!=nil)
            respuesta=33
        end
    end
    return respuesta
end
def getGanador
    return @ganador 
end

end
