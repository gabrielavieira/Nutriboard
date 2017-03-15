package app_nutri

class PacienteController {

    def index() {
        def model = [:]

        render(view: "index", model: model)
    }

    def novo(){
        print params
        def model = [entityInstance: Paciente.newInstance(params)]
        render(view: "index", model: model)
    }
}
