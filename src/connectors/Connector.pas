unit Connector;

interface

uses
  Connector.Interf,
  ormbr.factory.interfaces,
  Data.DB;

type
  TConnector = class(TInterfacedObject, IConnector)
  private
    FComponentDB: TCustomConnection;
  public
    constructor Create(const componentDB: TCustomConnection);
    destructor Destroy; override;
    class function New(const componentDB: TCustomConnection): IConnector;
    function fireDAC: IDBConnection;
  end;

implementation

uses
  Connector.Driver.Factory;

{ TConnector }

constructor TConnector.Create(const componentDB: TCustomConnection);
begin
  FComponentDB := componentDB;
end;

destructor TConnector.Destroy;
begin

  inherited;
end;

function TConnector.fireDAC: IDBConnection;
begin
  Result := TConnectorDriverFactory.New.fireDAC(FComponentDB).execute;
end;

class function TConnector.New(const componentDB: TCustomConnection): IConnector;
begin
  Result := Self.Create(componentDB);
end;

end.
