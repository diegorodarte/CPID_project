# disque_denuncia

Primary key:
numero_denuncia

Columns:
- numero_denuncia - Número interno da denúncia gerado pelo sistema.
- id_denuncia - ID único da denúncia no banco de dados.
- data_denuncia - Data e hora da denúncia registrada no formato DATETIME GTM-3.
- data_difusao - Data e hora da difusão da denúncia registrada no formato DATETIME GTM-3.
- tipo_logradouro - Tipo do logradouro (rua, avenida, etc.).
- logradouro - Nome do logradouro
- numero_logradouro - Número do logradouro.
- complemento_logradouro - Complemento do logradouro (apartamento, bloco, etc.)
- bairro_logradouro - Bairro onde está localizado o logradouro.
- subbairro_logradouro - Subbairro ou região menor dentro do bairro.
- cep_logradouro - CEP do logradouro.
- referencia_logradouro - Referência adicional do logradouro.
- municipio - Município onde está localizado o logradouro.
- estado - Estado onde está localizado o logradouro.
- latitude - Latitude da localização da denúncia.
- longitude - Longtiude da localização da denúncia.
- xpotos - Array de informações sobre XPTOs (tags) associados à denúncia.
    - id - ID do XPOT.
    - nome - nome do XPOT.
- orgaos - Array de órgãos associados à denúncia.
    - id - ID do órgão.
    - nome - Nome do órgão.
    - tipo - Tipo do órgão.
- assuntos - Array de assuntos associados à denúncia.
    - id_classe - ID da classe do assunto.
    - nome - Descrição da classe do assunto.
    - tipos - Array de tipos associados à classe da denúncia.
        - id_tipo - ID do tipo de assunto.
        - tipo - Descrição do tipo de assunto.
        - assunto_principal - Indicador do assunto principal.
- relato - Descrição do relato da denúncia.
- envolvidos - Array de pessoas envolvidas na denúncia.
    - id - Identificador único do registro no banco de dados. NÃO É IDENTIFICADOR ÚNICO PARA O ENVOLVIDO.
    - nome - Nome do envolvido.
    - vulgo - Vulgo do envolvido.
    - sexo - Sexo do envolvido.
    - idade - Idade do envolvido.
    - pele - Descrição da pele do envolvido.
    - estatura - Estatura do envolvido.
    - porte - Porte do envolvido.
    - cabelos - Cor dos cabelos do envolvido.
    - olhos - Cor dos olhos do envolvido.
    - outras_caracteristicas - Outras características do envolvido.
- status_denuncia - Status atual da denúncia.
- timestamp_insercao - Timestamp da inserção do registro no banco de dados.