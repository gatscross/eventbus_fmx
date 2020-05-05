unit UFrame2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FrameStand, FMX.Layouts, MainFrU, EventBus,
  FMX.Objects;

type
  TFrame2 = class(TFrame)
    Button1: TButton;
    FrameStand1: TFrameStand;
    Layout1: TLayout;
    Button2: TButton;
    Text1: TText;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

function HideButton(const Value: Boolean): THideMenuEvent;
begin
  Result := THideMenuEvent.Create(Value);
end;

procedure TFrame2.Button1Click(Sender: TObject);
begin
  GlobalEventBus.Post(HideButton(False));
end;

procedure TFrame2.Button2Click(Sender: TObject);
begin
  GlobalEventBus.Post(HideButton(True));
end;

end.
