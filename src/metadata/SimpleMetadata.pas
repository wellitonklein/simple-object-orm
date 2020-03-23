unit SimpleMetadata;

interface

uses
  SimpleMetadata.Interf,
  ormbr.factory.interfaces,
  ormbr.ddl.commands;

type
  TSimpleMetadata = class(TInterfacedObject, ISimpleMetadata)
  private
    FConnection: IDBConnection;
    procedure saveAllLog(const ListDDL: TArray<TDDLCommand>);
  public
    constructor Create(const Connection: IDBConnection);
    destructor Destroy; override;
    class function New(const Connection: IDBConnection): ISimpleMetadata;
    function update(const saveLog: Boolean = False): ISimpleMetadata;
  end;

implementation

uses
  ormbr.database.interfaces,
  ormbr.modeldb.compare,
  ormbr.ddl.generator.firebird,
  ormbr.metadata.firebird,
  System.SysUtils;

{ TSimpleMetadata }

constructor TSimpleMetadata.Create(const Connection: IDBConnection);
begin
  FConnection := Connection;
end;

destructor TSimpleMetadata.Destroy;
begin

  inherited;
end;

class function TSimpleMetadata.New(const Connection: IDBConnection): ISimpleMetadata;
begin
  Result := Self.Create(Connection);
end;

procedure TSimpleMetadata.saveAllLog(const ListDDL: TArray<TDDLCommand>);
var
  cDDL: TDDLCommand;
begin
  for cDDL in ListDDL do
  begin
    { TODO -oWelliton -cAlto : Salvar log }
  end;
end;

function TSimpleMetadata.update(const saveLog: Boolean = False): ISimpleMetadata;
var
  LManager: IDatabaseCompare;
begin
  Result := Self;

  try
    LManager := TModelDbCompare.Create(FConnection);
    LManager.BuildDatabase;

    if (saveLog) then
    begin
      saveAllLog(LManager.GetCommandList);
    end;
  except on E: Exception do
    raise Exception.Create('Erro ao atualizar banco: ' + E.Message);
  end;
end;

end.
