unit SimpleManager.Interf;

interface

uses
  ormbr.manager.objectset;

type
  ISimpleManager = interface;

  ISimpleManager = interface
    ['{E2EA841B-5FB6-4A22-A6D4-D0376B49D704}']
    function objectData: TManagerObjectSet;
  end;

implementation

end.
