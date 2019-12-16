# Design-Pattern-for-Delphi
Some class helpers to improve my software architecture with GOF Patterns

# Pattern Adapter 
 Adapter is the idea of a class that changes the behavior of an object, then this object looks like another one.
In this case I adapt a TDataset to looks like a TProduct. I suggest you create the following circled structure:
```Delphi
unit uPattern.Adapter; //available for cloning
--------------------------------------------------------
unit myProgram.Models
uses uPattern.Adapter;
implementation
uses myProgram.Adapter;
-------------------------------------------------------
unit myProgram.Adapter  
uses uPattern.Adapter;
implementation
uses myProgram.Models;
```
Let me show you a completely functional demonstration
```Delphi
//1
unit myProgram.Models;
uses uPattern.Adapter;
Type
  TProduct = class(TDao)
    id: string;
    name: string;
    price: currency;
    constructor Create;
  end;
  implementation
  uses MyProgram.Adapter_WEB; //Implementation uses prevents circular reference
  constructor TProduct.Create...
  begin
  onReadData := MyProgram.Adapter_WEB.ReadProduct;
//2
unit myProgram.Adapter_WEB;
uses uPattern.Adapter, myProgram.Models;
Type
 TAdapter = class
   procedure ReadProduct (Source: TDataset; var Sender: TDao);
  ...
  implementation
  procedure TAdapter.ReadProduct(Source: TDataset; var Sender: TDao);
  begin
  with Sender as TProduct, Source do
  begin
    id := fieldbyname('produto.id').asString;
    name := fieldbyname('produto.nome').asString;
    price := fieldbyname('produto.preco').asCurrency;

```

# Pattern Iteration
With this pattern you can just implement one event, like a buttonclick that render a listview, and then iterate through each row of the dataset 

```Delphi
procedure loaddata(Sender: TObject);
begin
  with Sender as TDataset do
  begin
    ListView.addItem(fieldbyname('Name').asString,
      fieldbyname('Description').asString,
      fieldbyname('foto64').asString,   
      fieldbyname('imageindex').asInteger)
  end;
end;
```

```Delphi
procedure buttonclick(Sender: TObject);
begin
  Table1.Open;
  Listview1.clear;
  Table1.Iterate(loaddata);
end;
```
# Pattern Delegate
Delegates the rule to a partner that knows the real context and the real rule of business.
```
myMarketPlace.Create(Partner);
myMarketPlace.ProcessOrder; //I don't know how to process Order, but my partner does;
```
I just show how the pseudo class TMarketPlace takes advantage of Interface Delegation
```
type
TMarketPlace = class
Partner: IBusinessDelegate;
procedure ProcessOrder(Sender: TObject);
implementation
TMarketPlace.ProcessOrder(Sender: TObject);
begin
Partner.PrcessOrder(Sender); //Or Self if you want
end;

```

