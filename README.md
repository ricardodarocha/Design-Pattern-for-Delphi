# Design-Pattern-for-Delphi
Some class helpers to improve my software architecture inside GOF Patterns

# Iteration
With this class you can just implement one event, like a buttonclick, and then iterate for each row of the dataset 

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
