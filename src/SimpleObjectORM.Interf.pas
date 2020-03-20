unit SimpleObjectORM.Interf;

interface

uses
  Data.DB,
  SimpleMetadata.Interf;

type

  ISimpleObjectORM = interface
    ['{EE021326-F2E2-4C16-89FC-B456DCA44645}']
    function setDatabase(const value: TCustomConnection): ISimpleObjectORM;
    function metadata: ISimpleMetadata;
    { TODO -oWelliton -cAlto : Criar manager da biblioteca }
  end;

implementation

end.
