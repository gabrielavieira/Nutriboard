package app_nutri

import enums.StatusPeso

class AvaliacaoAntropometrica {

    Date data
    Float altura
    Float pesoAtual
    StatusPeso statusPeso

    BigDecimal ombro
    BigDecimal peitoral
    BigDecimal cintura
    BigDecimal abdomen
    BigDecimal quadril
    BigDecimal panturrilhaEsquerda
    BigDecimal panturrilhaDireita
    BigDecimal pescoco
    BigDecimal punho
    BigDecimal coxaDireita
    BigDecimal coxaEsquerda
    BigDecimal coxaProximalDireita
    BigDecimal coxaProximalEsquerda
    BigDecimal bracoRelaxadoDireito
    BigDecimal bracoRelaxadoEsquerdo
    BigDecimal bracoContraidoDireito
    BigDecimal bracoContraidoEsquerdo
    BigDecimal antebraco

    BigDecimal diametroOsseoPunho
    BigDecimal diametroOsseoFemur

    BigDecimal imc
    BigDecimal pesoIdeal
    BigDecimal massaGorda
    BigDecimal massaMagra
    BigDecimal aguaCorporal
    BigDecimal pesoOsseo
    BigDecimal pesoMuscular

    static belongsTo = [paciente: Paciente]

    static constraints = {
        ombro nullable: true
        peitoral nullable: true
        cintura nullable: true
        abdomen nullable: true
        quadril nullable: true
        panturrilhaEsquerda nullable: true
        panturrilhaDireita nullable: true
        pescoco nullable: true
        punho nullable: true
        coxaDireita nullable: true
        coxaEsquerda nullable: true
        coxaProximalDireita nullable: true
        coxaProximalEsquerda nullable: true
        bracoRelaxadoDireito nullable: true
        bracoRelaxadoEsquerdo nullable: true
        bracoContraidoDireito nullable: true
        bracoContraidoEsquerdo nullable: true
        antebraco nullable: true
        diametroOsseoPunho nullable: true
        diametroOsseoFemur nullable: true
        imc nullable: true
        massaGorda nullable: true
        massaMagra nullable: true
        aguaCorporal nullable: true
        pesoOsseo nullable: true
        pesoMuscular nullable: true
        pesoIdeal nullable: true
        statusPeso nullable: true
    }

}
