unit uPattern.Delegator.Example;

interface

/// <summary>
///   To use delegate in ever Class you want, do you need to have an Instance of IBusinessDelegate first. Those is a class that implements
///   the real rule of business and that has the original context. The context is passed as Sender: TObject  
/// </summary>

uses
  System.SysUtils, uPattern.Delegator;

type

TMarketPlace = class
  Shop: IBusinessDelegate;  //O parceiro que integra com seu marketplace
  procedure ProcessOrder(Sender: TObject {Context});
end;

implementation

{ TMarketPlace }

procedure TMarketPlace.ProcessOrder(Sender: TObject {Context});
begin
  if Assigned(Shop) then
    Shop.ProcessOrder(Sender)
  else
    raise Exception.Create('I can''t do this by myself');
end;

end.
