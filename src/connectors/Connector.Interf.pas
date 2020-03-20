unit Connector.Interf;

interface

uses
  ormbr.factory.interfaces;

type
  IConnector = interface;

  IConnector = interface
    ['{7CB5A0C1-C2B0-42C6-8FB1-D04A0165C573}']
    function fireDAC: IDBConnection;
  end;

  IConnectorDriver = interface
    ['{15BA927C-3D35-4635-A098-7B38DFD3DE9C}']
    function execute: IDBConnection;
  end;

implementation

end.
