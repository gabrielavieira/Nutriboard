package app_nutri

import grails.converters.JSON

class AlimentoController extends CRUDController{

    def entity = Alimento
    def query = {}

    def getAlimento(){
        Alimento alimento = Alimento.read(params.idAlimento)
        render alimento as JSON
    }
}
