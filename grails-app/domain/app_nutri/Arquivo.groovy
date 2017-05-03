package app_nutri

class Arquivo {

    byte[] arquivo
    String nomeArquivo
    String tipoArquivo
    Long tamanho

    static constraints = {
        arquivo nullable: false, maxSize: 20 * 1024 * 1024
    }

    static mapping = {
        id generator:'sequence',params:[sequence:'arquivo_seq']
    }

    String getContentType(){
        Map<String, String> contentTypes = new HashMap<String, String>()
        contentTypes.put('.jpg', 'image/jpeg')
        contentTypes.put('.png', 'image/png')
        contentTypes.put('.gif', 'image/gif')
        contentTypes.put('.application/pdf', 'Aplication/PDF')

        return contentTypes.get(this.tipoArquivo)
    }

}
