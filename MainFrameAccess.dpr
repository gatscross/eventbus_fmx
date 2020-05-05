program MainFrameAccess;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UFrame1 in 'UFrame1.pas' {Frame1: TFrame},
  UFrame2 in 'UFrame2.pas' {Frame2: TFrame},
  MainFrU in 'MainFrU.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
