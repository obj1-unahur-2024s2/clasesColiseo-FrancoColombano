import gladiadores.*
import armasYArmadura.*

class Grupo {
    const property gladiadores = []
    const property nombre 
    var cantPeleas = 0

    method aumentarCantPeleas(){
        cantPeleas += 1
    }
    
    method agregarGladiador(unGladiador){
        gladiadores.add(unGladiador)
    }

    method quitarGladiador(unGladiador) {
        gladiadores.remove(unGladiador)
    }

    method combatir(unGrupo) {
        self.aumentarCantPeleas()
        unGrupo.aumentarCantPeleas()
        (1..3).forEach({
            round => self.campeon().pelear(unGrupo.campeon())
        })
    }  

    method campeon() {
        const puedenPelear = gladiadores.filter({g => g.puedePelear()})
        return
        if(puedenPelear.isEmpty())
            self.error("No hay gladiadores para pelear")
        puedenPelear.max({g => g.fuerza()})
    }
}
