unit Connector.FireDAC;

interface

uses
  Connector.Interf,
  ormbr.factory.interfaces, Data.DB;

type
  TConnectorFireDAC = class(TInterfacedObject, IConnectorDriver)
  private
    FComponentDB: TCustomConnection;
  public
    constructor Create(const componentDB: TCustomConnection);
    destructor Destroy; override;
    class function New(const componentDB: TCustomConnection): IConnectorDriver;
    function execute: IDBConnection;
  end;

implementation

uses
  ormbr.factory.firedac;

{ TConnectorDriver }

constructor TConnectorFireDAC.Create(const componentDB: TCustomConnection);
begin
  FComponentDB := componentDB;
end;

destructor TConnectorFireDAC.Destroy;
begin

  inherited;
end;

function TConnectorFireDAC.execute: IDBConnection;
begin
  Result := TFactoryFireDAC.Create(FComponentDB, dnFirebird);
end;

class function TConnectorFireDAC.New(const componentDB: TCustomConnection): IConnectorDriver;
begin
  Result := Self.Create(componentDB);
end;

end.
