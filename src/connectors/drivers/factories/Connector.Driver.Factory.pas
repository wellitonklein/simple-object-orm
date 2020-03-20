unit Connector.Driver.Factory;

interface

uses
  Connector.Driver.Factory.Interf, Connector.Interf, Data.DB;

type
  TConnectorDriverFactory = class(TInterfacedObject, IConnectorDriverFactory)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IConnectorDriverFactory;
    function fireDAC(const componentDB: TCustomConnection): IConnectorDriver;
  end;

implementation

uses
  Connector.FireDAC;

{ TConnectorDriverFactory }

constructor TConnectorDriverFactory.Create;
begin

end;

destructor TConnectorDriverFactory.Destroy;
begin

  inherited;
end;

function TConnectorDriverFactory.fireDAC(
  const componentDB: TCustomConnection): IConnectorDriver;
begin
  Result := TConnectorFireDAC.New(componentDB);
end;

class function TConnectorDriverFactory.New: IConnectorDriverFactory;
begin
  Result := Self.Create;
end;

end.
