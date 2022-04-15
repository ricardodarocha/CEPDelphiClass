unit Data.Cep;

interface

uses
  System.Classes,
  REST.Types,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Adapter.Cep;

type
  TDMCep = class(TDataModule, ICidadeFactory)
    Client: TRESTClient;
    Request: TRESTRequest;
    res: TRESTResponse;
  private
    { Private declarations }
  public

    function GetCidade(ACep: string): ICidade;
  end;

var
  DMCep: TDMCep;

implementation

uses
  SysUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMCep }

function TDMCep.GetCidade(ACep: string): ICidade;
  const
    CidadeEmpty = '{"uf": "", "ibge": "0"}';
begin
  Request.Resource := Format('%s/json', [ACep]);
  Request.Execute;

  if res.StatusCode = 200 then
    Result := TCidade.Create(Res.Content)
  else
    Result := TCidade.Create(CidadeEmpty)

end;

end.
