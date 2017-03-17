package app_nutri

import grails.web.servlet.mvc.GrailsParameterMap

class CRUDController {

    def index() {
        def model = list()
        model
    }

    def beforeList(){}

    def list = {
        beforeList()

        def criteria = entity.createCriteria()
        def entities = criteria.list(query)
        def model = [entityInstanceList: entities, filters: params]

        model = editaModelDoList( model )

        params.put( 'manterFlash', false )

        returnList(model)
    }

    def novo() {
        def model = [entityInstance: entity.newInstance(params)]
        render( template: "form", model: model )
    }

    def getInstanceEntity() {
        def entityInstance
        if( params.id ){
            entityInstance = entity.get(params.id)
            entityInstance.properties = params
        } else {
            entityInstance = entity.newInstance( params )
        }

        return entityInstance
    }

    def beforeSave(entityInstance,model){}

    def save() {
        def model = [:]
        def entityInstance
        boolean edit = params.id ? true:false
        entityInstance = getInstanceEntity()

        beforeSave( entityInstance, model )
        if( entityInstance.errors.getErrorCount() < 1 && entityInstance.validate() )
        {
            if (entityInstance.save(flush: true)) {
                afterSave(entityInstance,model);
                if(edit){
                    flash.message = message(code: 'default.updated.message')
                }else{
                    flash.message = message(code: 'default.created.message')
                }
            }else{
                if(edit){
                    flash.error = message(code: 'default.dont.updated.message')
                }else{
                    flash.error = message(code: 'default.dont.created.message')
                }
            }
        }

        println entityInstance.errors
        model = editaModelDoSave( model )

        returnSave( edit, entityInstance, model)
    }

    def edit() {
        def entityInstance = entity.get(params.id)
        def model = [entityInstance: entityInstance]

        model = editaModelDoEdit( model )

        render(template: "form", layout: "ajax", model: model )
    }

    def returnSave(boolean edit, def entityInstance, LinkedHashMap model) {
        if (!edit || !entityInstance.validate()) {
            entityInstance = entity.newInstance()
        }
        model.put('entityInstance', entityInstance)

        render(template: "form", model: model)
    }

    def returnList(LinkedHashMap<String, GrailsParameterMap> model) {
        if (request.xhr) {
            render(template: "grid", layout: "ajax", model: model)
        } else {
            model
        }
    }

    def editaModelDoSave( def model ) {
        return model
    }

    def editaModelDoList( def model )
    {
        return model
    }

    def editaModelDoEdit( def model )
    {
        return model
    }

    def afterSave(entityInstance,model){}
}
