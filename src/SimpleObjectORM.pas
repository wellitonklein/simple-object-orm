unit SimpleObjectORM;

interface

uses
  SimpleObjectORM.Interf,
  Data.DB,
  SimpleMetadata.Interf,
  ormbr.factory.interfaces;

type
  TSimpleObjectORM = class(TInterfacedObject, ISimpleObjectORM)
  private
    FDatabase: TCustomConnection;
    FConnector: IDBConnection;
    function getConnector: IDBConnection;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ISimpleObjectORM;
    function setDatabase(const value: TCustomConnection): ISimpleObjectORM;
    function metadata: ISimpleMetadata;
  end;

implementation

uses
  SimpleMetadata, Connector;

{ TSimpleObjectORM }

constructor TSimpleObjectORM.Create;
begin

end;

destructor TSimpleObjectORM.Destroy;
begin

  inherited;
end;

function TSimpleObjectORM.getConnector: IDBConnection;
begin
  if (not Assigned(FConnector)) then
  begin
    FConnector := TConnector.New(FDatabase).fireDAC;
  end;

  Result := FConnector;
end;

function TSimpleObjectORM.metadata: ISimpleMetadata;
begin
  Result := TSimpleMetadata.New(getConnector);
end;

class function TSimpleObjectORM.New: ISimpleObjectORM;
begin
  Result := Self.Create;
end;

function TSimpleObjectORM.setDatabase(
  const value: TCustomConnection): ISimpleObjectORM;
begin
  Result := Self;
  FDatabase := value;
end;

end.
