package app_nutri

import enums.GrupoAlimentar

class Alimento {

    String descricao
    BigDecimal porcao
    BigDecimal valorCalorico
    GrupoAlimentar grupoAlimentar

    BigDecimal proteinas
    BigDecimal gordurasTotais
    BigDecimal carboidratos

    BigDecimal acucar
    BigDecimal colesterol
    BigDecimal fibraAlimentar
    BigDecimal gorduraPoliInsaturada
    BigDecimal gordurasTrans
    BigDecimal magnesio
    BigDecimal potassio
    BigDecimal sodio
    BigDecimal vitaminaB1
    BigDecimal vitaminaB3
    BigDecimal vitaminaB9
    BigDecimal vitaminaC
    BigDecimal vitaminaE
    BigDecimal calcio
    BigDecimal ferro
    BigDecimal gorduraMonoinsaturada
    BigDecimal gorduraSaturada
    BigDecimal fosforo
    BigDecimal manganes
    BigDecimal selenio
    BigDecimal vitaminaA
    BigDecimal vitaminaB2
    BigDecimal vitaminaD
    BigDecimal zinco

    static constraints = {
        proteinas nullable: true
        gordurasTotais nullable: true
        carboidratos nullable: true
        acucar nullable: true
        colesterol nullable: true
        fibraAlimentar nullable: true
        gorduraPoliInsaturada nullable: true
        gordurasTrans nullable: true
        magnesio nullable: true
        potassio nullable: true
        sodio nullable: true
        vitaminaB1 nullable: true
        vitaminaB3 nullable: true
        vitaminaB9 nullable: true
        vitaminaC nullable: true
        vitaminaE nullable: true
        calcio nullable: true
        ferro nullable: true
        gorduraMonoinsaturada nullable: true
        gorduraSaturada nullable: true
        fosforo nullable: true
        manganes nullable: true
        selenio nullable: true
        vitaminaA nullable: true
        vitaminaB2 nullable: true
        vitaminaD nullable: true
        zinco nullable: true
    }

}
