unit Adapter.Cep;

interface

type

{
  "cep": "36507-158",
  "logradouro": "Rua Major Carneiro",
  "complemento": "",
  "bairro": "Vila Franel",
  "localidade": "Ubá",
  "uf": "MG",
  "ibge": "3169901",
  "gia": "",
  "ddd": "32",
  "siafi": "5397"
}

  ICidade = interface
  ['{68C8DF58-38FD-4F23-9DEA-6596B6DF4E9A}']
    function getCodigo: Integer;
    function getCodigoIbge: string;
    function getCodigoEstado: Integer;
    function getUF: string;
    function getCep: string;
    function getDDD: string;
    function getLogradouro: string;
    function getComplemento: string;
    function getBairro: string;
    function getLocalidade: string;

    property Codigo: Integer read getCodigo;
    property CodigoIbge: string read getCodigoIbge;
    property Estado: Integer read getCodigoEstado;
    property UF: string read getUF;
    property Cep: string read getCep;
    property DDD: string read getDDD;
    property Logradouro: string read getLogradouro;
    property Complemento: string read getComplemento;
    property Bairro: string read getBairro;
    property Localidade: string read getLocalidade;
  end;

  ICidadeFactory = Interface
    ['{B4DC7CF5-B8B3-4C10-A3B1-102718AA6416}']
    function GetCidade(ACep: string): ICidade;
  End;

  TCidade = class(TInterfacedObject, ICidade)
    constructor Create(AJson: string);
  private
    FCodigoCidade: Integer;
    FCodigoIbge: string;
    FCodigoEstado: Integer;
    FUF: string;
    FCep: string;
    FDDD: string;
    FLogradouro: string;
    FComplemento: string;
    FBairro: string;
    FLocalidade: string;

    function getCodigo: Integer;
    function getCodigoIbge: string;
    function getCodigoEstado: Integer;
    function getUF: string;
    function getCep: string;
    function getDDD: string;
    function getLogradouro: string;
    function getComplemento: string;
    function getBairro: string;
    function getLocalidade: string;
  end;

  TAdapterCep = class
    class function GetCidade(ACep: string; Repository: ICidadeFactory): ICidade;
  end;

  //Using TAdapterCep.GetCidade('36507158');

implementation

uses
  System.Json,
  SysUtils;

{ TCidade }

constructor TCidade.Create(AJson: string);

{
  "cep": "36507-158",
  "logradouro": "Rua Major Carneiro",
  "complemento": "",
  "bairro": "Vila Franel",
  "localidade": "Ubá",
  "uf": "MG",
  "ibge": "3169901",
  "gia": "",
  "ddd": "32",
  "siafi": "5397"
}
var
  Objeto: TJSONValue;
begin
  Objeto :=  TJSonObject.ParseJSONValue(AJson);

  if Objeto.TryGetValue<string>('ibge', FCodigoIbge) then
  begin
    FCep            := Objeto.GetValue<string>('cep');
    FLogradouro     := Objeto.GetValue<string>('logradouro');
    FComplemento    := Objeto.GetValue<string>('complemento');
    FBairro         := Objeto.GetValue<string>('bairro');
    FLocalidade     := Objeto.GetValue<string>('localidade');
    FUF             := Objeto.GetValue<string>('uf');
    FDDD            := Objeto.GetValue<string>('ddd');
  end;

  FCodigoCidade   := StrToIntDef(FCodigoIbge, 0);
  if Length(FCodigoIbge) > 1 then
    FCodigoEstado   := StrToIntDef(Copy(FCodigoIbge,1,2), 0)
  else
    FCodigoEstado := 0;
end;

function TCidade.getBairro: string;
begin
  Result := FBairro;
end;

function TCidade.getCep: string;
begin
  Result := FCep;
end;

function TCidade.getCodigo: Integer;
begin
  Result := FCodigoCidade;
end;

function TCidade.getCodigoEstado: Integer;
begin
  Result := FCodigoEstado;
end;

function TCidade.getCodigoIbge: string;
begin
  Result := FCodigoIbge;
end;

function TCidade.getComplemento: string;
begin
  Result := FComplemento;
end;

function TCidade.getDDD: string;
begin
  Result := FDDD;
end;

function TCidade.getLocalidade: string;
begin
  Result := FLocalidade;
end;

function TCidade.getLogradouro: string;
begin
  Result := FLogradouro;
end;

function TCidade.getUF: string;
begin
  Result := FUF;
end;

{ TAdapterCep }

class function TAdapterCep.GetCidade(ACep: string; Repository: ICidadeFactory): ICidade;
begin
  Result := Repository.GetCidade(ACep);
end;
end.
