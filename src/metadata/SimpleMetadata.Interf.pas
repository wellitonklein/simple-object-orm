unit SimpleMetadata.Interf;

interface

type

  ISimpleMetadata = interface
    ['{DCC7EE6D-60CE-486A-BD86-782DE0B00089}']
    function update(const saveLog: Boolean = False): ISimpleMetadata;
  end;

implementation

end.
