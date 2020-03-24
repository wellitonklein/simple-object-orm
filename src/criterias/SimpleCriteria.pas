unit SimpleCriteria;

interface

uses
  SimpleCriteria.Interf,
  ormbr.criteria,
  ormbr.factory.interfaces,
  ormbr.criteria.resultset;

type
  TSimpleCriteria = class(TInterfacedObject, ISimpleCriteria)
  private
    FCriteria: ICriteria;
    FResults: ICriteriaSet;
  public
    constructor Create(const conn: IDBConnection);
    destructor Destroy; override;
    class function New(const conn: IDBConnection): ISimpleCriteria;
    function build: ICriteria;
    function results: IDBResultSet;
  end;

implementation

{ TSimpleCriteria }

function TSimpleCriteria.build: ICriteria;
begin
  FCriteria.ClearAll;
  Result := FCriteria;
end;

constructor TSimpleCriteria.Create(const conn: IDBConnection);
begin
  FCriteria := CreateCriteria;
  FResults := TCriteria.New.SetConnection(conn);
end;

destructor TSimpleCriteria.Destroy;
begin

  inherited;
end;

class function TSimpleCriteria.New(const conn: IDBConnection): ISimpleCriteria;
begin
  Result := Self.Create(conn);
end;

function TSimpleCriteria.results: IDBResultSet;
begin
  Result := FResults.SQL(FCriteria.AsString).AsResultSet;
end;

end.
