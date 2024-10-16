import armasYArmadura.*
import grupos.*

class GladiadorMirmillon {
    var vida = 100
    const property arma 
    var property armadura
    var property fuerza  

    method destreza() = 15   

    method atacar(unGladiador) {
        unGladiador.recibirAtaque(
            self.poderDeAtaque() - unGladiador.defensa())
    }

    method pelear(unGladiador) {
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }

    method poderDeAtaque() = arma.poderDeAtaque() + fuerza

    method defensa() = armadura.defensa(self) + self.destreza()

    method recibirAtaque(unValor){
        vida -= 0.max(unValor - self.defensa())
    }

    method puedePelear() = vida > 0

    method formarUnGrupo(unGladiador) {
        const nuevoGrupo = new Grupo(
            gladiadores = [self, unGladiador], 
            nombre = "mirmillolandia"
        )
        return nuevoGrupo
    }
}

class GladiadorDimachaerus{
    var vida = 100
    const property armas = [] 
    var property destreza  

    method fuerza() = 10 

    method atacar(unGladiador){
        unGladiador.recibirAtaque(
            self.poderDeAtaque() - unGladiador.defensa())
        destreza += 1
    }

    method pelear(unGladiador) {
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }

    method poderDeAtaque(){
        return
        self.fuerza() + armas.sum({a => a.poderDeAtaque()})
    }

    method defensa() = destreza / 2

    method recibirAtaque(unValor){
        vida -= 0.max(unValor - self.defensa())
    }

    method puedePelear() = vida > 0

    method formarUnGrupo(unGladiador) {
        const nuevoGrupo = new Grupo(
            gladiadores = [self, unGladiador], 
            nombre = "D-" + (self.poderDeAtaque() + unGladiador.poderDeAtaque())
        )
        return nuevoGrupo
    }
}