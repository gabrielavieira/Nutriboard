package app_nutri

class AvaliacaoAntropometrica {

    String descricao
    Date data
    Float altura
    Float pesoAtual

    BigDecimal ombro
    BigDecimal peitoral
    BigDecimal cintura
    BigDecimal abdomen
    BigDecimal quadril
    BigDecimal parturrilhaEsquerda
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

    static constraints = {
        ombro nullable: true
        peitoral nullable: true
        cintura nullable: true
        abdomen nullable: true
        quadril nullable: true
        parturrilhaEsquerda nullable: true
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
    }

}
