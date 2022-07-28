program LocacaoEquipamentos;

uses
  Forms,
  pdPrincipal in 'pdPrincipal.pas' {frmPrincipal},
  pdDM1 in 'pdDM1.pas' {DM1: TDataModule},
  pdColaborador in 'pdColaborador.pas' {frmColaborador},
  pdEquipamento in 'pdEquipamento.pas' {frmEquipamentos},
  pdLocacao in 'pdLocacao.pas' {frmLocacao},
  pdRelatorio in 'pdRelatorio.pas' {frmRelatorios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Loca��o de Equipamentos';
  Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
