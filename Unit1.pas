unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FrameStand, UFrame1;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    FrameStand1: TFrameStand;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FFrame1: TFrameInfo<TFrame1>;
  protected
    function GetFrame1: TFrameInfo<TFrame1>;
    property aFrame: TFrameInfo<TFrame1> read GetFrame1;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{ TForm1 }

procedure TForm1.FormShow(Sender: TObject);
begin
  aFrame.Show();
end;

function TForm1.GetFrame1: TFrameInfo<TFrame1>;
begin
  if not Assigned(FFrame1) then
    FFrame1 := FrameStand1.New<TFrame1>(Layout1);
  Result := FFrame1;
end;

end.
