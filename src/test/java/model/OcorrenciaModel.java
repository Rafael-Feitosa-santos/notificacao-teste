package model;

import com.google.gson.annotations.Expose;
import lombok.Data;

@Data
public class OcorrenciaModel {

    @Expose
    private int ocorrenciaId;
    @Expose
    private String dataOcorrencia;
    @Expose
    private String gravidade;
    @Expose
    private String endereco;
    @Expose
    private String vitima;
    @Expose
    private String status;

}
