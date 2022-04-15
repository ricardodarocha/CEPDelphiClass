object DMCep: TDMCep
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Client: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://viacep.com.br/ws'
    Params = <>
    Left = 64
    Top = 32
  end
  object Request: TRESTRequest
    Client = Client
    Params = <>
    Resource = '36507158/json'
    Response = res
    Left = 64
    Top = 88
  end
  object res: TRESTResponse
    ContentType = 'application/json'
    Left = 120
    Top = 64
  end
end
