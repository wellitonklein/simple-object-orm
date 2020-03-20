unit Connector.Driver.Factory.Interf;

interface

uses
  Connector.Interf,
  Data.DB;

type

  IConnectorDriverFactory = interface
    ['{A8816554-58FA-4124-A8FD-6D4DC558889E}']
    function fireDAC(const componentDB: TCustomConnection): IConnectorDriver;
  end;

implementation

end.
