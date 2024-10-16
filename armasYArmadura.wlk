class ArmaDeFilo {
  var property filo
  const property longitud

  method poderDeAtaque() = filo * longitud
}

class ArmaContundente {
  const property peso 

  method poderDeAtaque() = peso
}

object casco {
  method defensa(unGladiadior) = 10
}

object escudo {
  method defensa(unGladiador) {
    return
    5 + unGladiador.destreza() * 0.1
  } 
}

