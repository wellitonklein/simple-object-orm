unit SimpleObjectORM;

interface

uses
  SimpleObjectORM.Interf,
  Data.DB,
  SimpleMetadata.Interf,
  ormbr.factory.interfaces,
  SimpleManager.Interf,
  SimpleCriteria.Interf;

type
  TSimpleObjectORM<T: class, constructor> = class(TInterfacedObject, ISimpleObjectORM)
  private
    FDatabase: TCustomConnection;
    FConnector: IDBConnection;
    FManager: ISimpleManager;
    FCriteria: ISimpleCriteria;
    function getConnector: IDBConnection;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ISimpleObjectORM;
    function setDatabase(const value: TCustomConnection): ISimpleObjectORM;
    function metadata: ISimpleMetadata;
    function manager: ISimpleManager;
    function criteria: ISimpleCriteria;
  end;

implementation

uses
  SimpleMetadata,
  Connector,
  SimpleManager,
  SimpleCriteria;

{ TSimpleObjectORM }

constructor TSimpleObjectORM<T>.Create;
begin

end;

function TSimpleObjectORM<T>.criteria: ISimpleCriteria;
begin
  if (not Assigned(FCriteria)) then
  begin
    FCriteria := TSimpleCriteria.New(getConnector);
  end;

  Result := FCriteria;
end;

destructor TSimpleObjectORM<T>.Destroy;
begin

  inherited;
end;

function TSimpleObjectORM<T>.getConnector: IDBConnection;
begin
  if (not Assigned(FConnector)) then
  begin
    FConnector := TConnector.New(FDatabase).fireDAC;
  end;

  Result := FConnector;
end;

function TSimpleObjectORM<T>.manager: ISimpleManager;
begin
  if (not Assigned(FManager)) then
  begin
    FManager := TSimpleManager<T>.New(getConnector);
  end;

  Result := FManager;
end;

function TSimpleObjectORM<T>.metadata: ISimpleMetadata;
begin
  Result := TSimpleMetadata.New(getConnector);
end;

class function TSimpleObjectORM<T>.New: ISimpleObjectORM;
begin
  Result := Self.Create;
end;

function TSimpleObjectORM<T>.setDatabase(
  const value: TCustomConnection): ISimpleObjectORM;
begin
  Result := Self;
  FDatabase := value;
end;

end.
