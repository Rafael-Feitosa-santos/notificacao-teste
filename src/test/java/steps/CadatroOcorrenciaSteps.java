package steps;

import com.networknt.schema.ValidationMessage;
import io.cucumber.java.pt.Dado;
import io.cucumber.java.pt.E;
import io.cucumber.java.pt.Então;
import io.cucumber.java.pt.Quando;
import model.ErrorMessageModel;
import org.junit.Assert;
import services.CadastroOcorrenciaService;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class CadatroOcorrenciaSteps {

    CadastroOcorrenciaService cadastroOcorrenciaService = new CadastroOcorrenciaService();

    @Dado("que eu tenha os seguintes dados da ocorrencia:")
    public void queEuTenhaOsSeguintesDadosDaEntrega(List<Map<String, String>> rows) {
        for (Map<String, String> columns : rows) {
            cadastroOcorrenciaService.setFieldsDelivery(columns.get("campo"), columns.get("valor"));
        }
    }

    @Quando("eu enviar a requisição para o endpoint {string} de cadastro de ocorrencia")
    public void euEnviarARequisiçãoParaOEndpointDeCadastroDeEntregas(String endPoint) {
        cadastroOcorrenciaService.createDelivery(endPoint);
    }

    @Então("o status code da resposta deve ser {int}")
    public void oStatusCodeDaRespostaDeveSer(int statusCode) {
        Assert.assertEquals(statusCode, cadastroOcorrenciaService.response.statusCode());
    }

    @E("o corpo de resposta de erro da api deve retornar a mensagem {string}")
    public void oCorpoDeRespostaDeErroDaApiDeveRetornarAMensagem(String message) {
        ErrorMessageModel errorMessageModel = cadastroOcorrenciaService.gson.fromJson(
                cadastroOcorrenciaService.response.jsonPath().prettify(), ErrorMessageModel.class);
        Assert.assertEquals(message, errorMessageModel.getMessage());
    }

    @Dado("que eu recupere o ID da ocorrencia criada no contexto")
    public void queEuRecupereOIDDaEntregaCriadaNoContexto() {
        cadastroOcorrenciaService.retrieveIdDelivery();
    }

    @Quando("eu enviar a requisição com o ID para o endpoint {string} de deleção de ocorrencia")
    public void euEnviarARequisiçãoComOIDParaOEndpointDeDeleçãoDeEntrega(String endPoint) {
        cadastroOcorrenciaService.deleteDelivery(endPoint);
    }

    @E("que o arquivo de contrato esperado é o {string}")
    public void queOArquivoDeContratoEsperadoÉO(String contract) throws IOException {
        cadastroOcorrenciaService.setContract(contract);
    }

    @Então("a resposta da requisição deve estar em conformidade com o contrato selecionado")
    public void aRespostaDaRequisiçãoDeveEstarEmConformidadeComOContratoSelecionado() throws IOException {
        Set<ValidationMessage> validateResponse = cadastroOcorrenciaService.validateResponseAgainstSchema();
        Assert.assertTrue("O contrato está inválido. Erros encontratos" + validateResponse, validateResponse.isEmpty());
    }
}
