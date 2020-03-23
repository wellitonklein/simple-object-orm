unit SimpleManager;

interface

uses
  SimpleManager.Interf,
  ormbr.factory.interfaces,
  ormbr.manager.objectset;

type
  TSimpleManager<T: class, constructor> = class(TInterfacedObject, ISimpleManager)
  private
    FManager: TManagerObjectSet;
  public
    constructor Create(const conn: IDBConnection);
    destructor Destroy; override;
    class function New(const conn: IDBConnection): ISimpleManager;
    function manager: TManagerObjectSet;
  end;

implementation

uses
  ormbr.dml.generator.firebird;

{ TSimpleManager }

constructor TSimpleManager<T>.Create(const conn: IDBConnection);
begin
  FManager := TManagerObjectSet.Create(conn);
end;

destructor TSimpleManager<T>.Destroy;
begin

  inherited;
end;

function TSimpleManager<T>.manager: TManagerObjectSet;
begin
  Result := FManager;
end;

class function TSimpleManager<T>.New(const conn: IDBConnection): ISimpleManager;
begin
  Result := Self.Create(conn);
end;

end.
