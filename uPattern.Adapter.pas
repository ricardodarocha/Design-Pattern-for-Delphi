unit uPattern.Adapter;

/// <author> Ricardo da Rocha ricardodarocha@outlook.com </author>
/// <summary> Adapter has the idea of to change the behavior for look like another entity
//  Int this example I pass a simple translator to map properties between two completelly diferent objects classes </summary>


interface

  uses Classes, data.Db;

Type

  TDao = class;

  TSincDatabaseEvent = procedure(Source: TDataset; var Sender: TDao) of object;

  TDAO = class
    /// <summary>
    ///   Crie adaptadores em units separadas e mapeie os modelos para o seu ERP.
    ///   Ver Clientar.Adapter.ERPExemplo
    /// </summary>
    /// <remarks>
    ///   Desta forma fica fácil e completamente descentralizado o código que converte os dados
    ///   de uma SQL qualquer para o seu banco de dados.
    ///
    ///   Para usá-la apenas adiciona a unit que você criou, e no evento OnCreate de cada modelo você
    ///   atribui   OnReadData := Adapter.ReadModeloT;
    /// </remarks>
    OnReadData: TSincDatabaseEvent;
    /// <summary>
    ///   Lê um registro de cada vez
    /// </summary>
    procedure Assign(Dataset: TDataset);
  End;


implementation

procedure TDAO.Assign(Dataset: TDataset);
begin
  if Assigned(OnReadData) then
    OnReadData(Dataset, Self);
end;

end.
