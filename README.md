# CEPDelphiClass
Busca Cep, e retorna os dados do endereço

Este projeto contém units para você integrar na sua aplição *Delphi*
Um Adaptador para conectar na internet, procurar um CEP e retornar os dados de um Município, Endereço, Bairro, DDD e outras informações.

## Como utilizar

Adicione no seu projeto os módulos `Adapter.CEP` e `Data.CEP`. Estes fontes são explicados em detalhes abaixo  
Em seguida, realize uma chamada à classe TAdapterCep que irá retornar os dados da localidade correspondente

## Adapter.CEP

Esta classe é responsável por converter um JSON no formato abaixo para uma classe do Tipo TCidade (Disponível na unit Adapter.Cep).
A classe foi implementada a partir da interface ICidade, o que dispensa um bloco de código específico para gerenciar o ciclo de vida com FreeAndNil.

``` json 
{
  "cep": "31501-128",
  "logradouro": "Vila Miradouro",
  "complemento": "",
  "bairro": "Bairro Fictício",
  "localidade": "Gerenópolis",
  "uf": "PA",
  "ibge": "3069901",
  "gia": "",
  "ddd": "30",
  "siafi": "5337"
}
```

``` delphi 
with TAdapterCep.GetCidade('31501128', DMCep) do
  begin
    If Codigo > 0 then
    Showmessage(format('Endereço encontrado %d, %s, %s, %s - %s. Bairro %s, %s %s', [codigo, uf, DDD, Logradouro, Complemento, Bairro, Localidade, UF]));
    Showmessage(format('Outras informações: Código IBGE %s, Código UF %d, CEP Formatado %s', [codigoIbge, Estado, CEP]));
  end;
  ```
## Data.CEP

Contém a classe TDMCep que implementa a interface ICidadeFactory.
Esta classe é basicamente um DataModule com alguns componentes REST Client, Request, Response que encapsulam o funcionamento HTTP
É enviada uma solicitação GET na url pública ViaCep.com que retorna um JSON 

## Como estender a aplicação

Crei o seu próprio Data Module ou repositório de modo a implementar a interface ICidadeFactory retornando uma instância de ICidade.

## Mais

Acesse uma lista de todas as [cidades](https://github.com/ricardodarocha/public/tree/main/ibge/cidades.json) e [estados](https://github.com/ricardodarocha/public/tree/main/ibge/estados.json) atualizados no formato json



