unit uPattern.Iterator;

interface

uses Classes, SysUtils, Data.Db, uRESTDWPoolerDB;
/// <author> Ricardo da Rocha ricardodarocha@outlook.com </author>
/// <summary> That idea was to translate the Iterator Design Pattern in most origial OOP as possible,
/// then I just create an Event to implement an easy Iterator for Dataset. The same idea can be applied for any iterable Objects  </summary>

// The burocratic Iterator
//TGenericIterator = class
//private
//		procedure first;
//		procedure next;
//		function eof: boolean;
//
//	public
//		class function Initialize(Object: TObject):TDatasetIterator<T>; //List, TDataset
//		procedure Iterate;
//		property onIterate: TNotifyEvent;
//end;

//The concept above would be really most simple in the follow:

Type
  TDatasetIterator = class Helper for Tdataset
  public
    procedure Iterate(ForEachRecord: TNotifyEvent);
  end;
  TRDWIterator = class Helper for TRestDwClientSQL
  public
    procedure Iterate(ForEachRecord: TNotifyEvent);
  end;

implementation

procedure TDatasetIterator.Iterate(ForEachRecord: TNotifyEvent);
begin
	First;
	while not eof do
  begin
		ForEachRecord(self);
    Next;
  end;
end;

procedure TRDWIterator.Iterate(ForEachRecord: TNotifyEvent);
begin
	First;
	while not eof do
  begin
		ForEachRecord(self);
    Next;
  end;
end;


//Usage
//
//procedure formshow(Sender: TObject);
//	TabelaClientes.Iterate(Button1CLick);
//
////The method Button1 draw a card and put its on a scrollBox manually for a current row in dataset


{todo: Next: Implement the iterator for generics.collections TList<T>}


/// TListIterator = classHelper for TList<T>
/// 	function Iterate(OnIterate: TNotifyEvent)
/// end;
///
/// implementation
///
/// function TDatasetIterator.Iterate(OnIterate: TNotifyEvent);
/// begin
/// 	first;
/// 	while not eof do
/// 		onIterate(self);
/// end;
/// -------------------------------------------------------------------------------
end.