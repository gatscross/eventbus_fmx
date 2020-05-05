unit MainFrU;

interface

uses
  EventBus;

type
  THideMenuEvent = class(TObject)
  private
    FHide: boolean;
    procedure SetHide(const Value: boolean);
  public
    constructor Create(const aHide: Boolean);
    property aHide: boolean read FHide write SetHide;
  end;

implementation

uses
  System.Classes;

{ THideMenuEvent }

constructor THideMenuEvent.Create(const aHide: Boolean);
begin
  FHide := aHide;
end;

procedure THideMenuEvent.SetHide(const Value: boolean);
begin
  FHide := Value;
end;

end.
