unit UFrame1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FrameStand, UFrame2, MainFrU, EventBus,
  FMX.Objects;

type
  TFrame1 = class(TFrame)
    Layout1: TLayout;
    Button1: TButton;
    FrameStand1: TFrameStand;
    Text1: TText;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FFrame2: TFrameInfo<TFrame2>;
  protected
    function GetFrame2: TFrameInfo<TFrame2>;
    property aFrame: TFrameInfo<TFrame2> read GetFrame2;
  public
    { Public declarations }
    [Subscribe]
    procedure OnHide(AEvent: THideMenuEvent);
  end;

implementation

{$R *.fmx}

{ TFrame2 }

procedure TFrame1.Button1Click(Sender: TObject);
begin
  aFrame.Show();
  if not GlobalEventBus.IsRegistered(Self) then
    GlobalEventBus.RegisterSubscriber(Self);
end;

function TFrame1.GetFrame2: TFrameInfo<TFrame2>;
begin
  if not Assigned(FFrame2) then
  begin
    FFrame2 := FrameStand1.New<TFrame2>(Layout1);
  end;
  Result := FFrame2;
end;

procedure TFrame1.OnHide(AEvent: THideMenuEvent);
begin
  Button1.Visible := AEvent.aHide;
  AEvent.Free;
end;

end.
