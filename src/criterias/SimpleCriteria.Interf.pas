unit SimpleCriteria.Interf;

interface

uses
  ormbr.criteria,
  ormbr.factory.interfaces;

type

  ISimpleCriteria = interface
    ['{5C8A1C75-17CE-4DBE-901E-AFDA4D0AEF1E}']
    function build: ICriteria;
    function results: IDBResultSet;
  end;

implementation

end.
