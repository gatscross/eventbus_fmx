unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FrameStand, unit3, MainFrU, EventBus;

type
  TFrame2 = class(TFrame)
    Layout1: TLayout;
    Button1: TButton;
    FrameStand1: TFrameStand;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FFrame2: TFrameInfo<TFrame3>;
  protected
    function GetUnit3: TFrameInfo<TFrame3>;
    property aFrame: TFrameInfo<TFrame3> read GetUnit3;
  public
    { Public declarations }
    [Subscribe]
    procedure OnHide(AEvent: THideMenuEvent);
  end;

implementation

{$R *.fmx}

{ TFrame2 }

procedure TFrame2.Button1Click(Sender: TObject);
begin
  aFrame.Show();
  if not GlobalEventBus.IsRegistered(Self) then
    GlobalEventBus.RegisterSubscriber(Self);
end;

function TFrame2.GetUnit3: TFrameInfo<TFrame3>;
begin
  if not Assigned(FFrame2) then
  begin
    FFrame2 := FrameStand1.New<TFrame3>(Layout1);
  end;
  Result := FFrame2;
end;

procedure TFrame2.OnHide(AEvent: THideMenuEvent);
begin
  Button1.Visible := AEvent.aHide;
  AEvent.Free;
end;

end.
