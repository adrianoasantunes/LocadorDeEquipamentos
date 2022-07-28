unit pdRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ComCtrls, DB;

type
  TfrmRelatorios = class(TForm)
    PageControl: TPageControl;
    TabRelAlocadosDevolvidos: TTabSheet;
    GroupBox2: TGroupBox;
    DBGridRelLocacoes: TDBGrid;
    GroupBox4: TGroupBox;
    SpeedBPesquisar: TSpeedButton;
    SpeedBLimpar: TSpeedButton;
    GroupBox5: TGroupBox;
    LookupComboFiltroEspecie: TDBLookupComboBox;
    GroupBox6: TGroupBox;
    RbFiltroDevolvidos: TRadioButton;
    RbFiltroAlocados: TRadioButton;
    RbFiltroTodos: TRadioButton;
    GroupBox7: TGroupBox;
    LookupComboFiltroColaborador: TDBLookupComboBox;
    dsColaboradorDual: TDataSource;
    dsEquipamentoDual: TDataSource;
    dsLocacaoRelatorios: TDataSource;
    procedure AjustarExibicaoDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure SpeedBPesquisarClick(Sender: TObject);
    procedure DBGridRelLocacoesColEnter(Sender: TObject);
    procedure SpeedBLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

uses pdDM1;

{$R *.dfm}

procedure TfrmRelatorios.DBGridRelLocacoesColEnter(Sender: TObject);
begin
  if DBGridRelLocacoes.SelectedIndex <> 0 then
     DBGridRelLocacoes.SelectedIndex := 0;
     DBGridRelLocacoes.Canvas.Font.Color := clRed ;
end;

procedure TfrmRelatorios.FormActivate(Sender: TObject);
begin
  AjustarExibicaoDBGrid;
  TabRelAlocadosDevolvidos.TabVisible := False;
  TabRelAlocadosDevolvidos.Visible := True;
  RbFiltroTodos.Checked := True;
  LookupComboFiltroEspecie.KeyValue := 0;
  LookupComboFiltroColaborador.KeyValue := 0;
  if not DBGridRelLocacoes.DataSource.DataSet.IsEmpty then
    SpeedBPesquisar.OnClick(Sender);
end;

procedure TfrmRelatorios.SpeedBLimparClick(Sender: TObject);
begin
  RbFiltroTodos.Checked := True;
  LookupComboFiltroEspecie.KeyValue := 0;
  LookupComboFiltroColaborador.KeyValue := 0;
  SpeedBPesquisar.OnClick(Sender);
end;

procedure TfrmRelatorios.SpeedBPesquisarClick(Sender: TObject);
var
  LFiltro : String;
begin
  with DM1 do
  begin
    tbLocacaoRelatorios.Refresh;
    tbLocacaoRelatorios.Filtered := True;
    LFiltro := '1 = 1';
    if RbFiltroAlocados.Checked then
      LFiltro := LFiltro +  ' AND (dtalocacao IS NOT NULL AND dtadevolucao IS NULL)';
    if RbFiltroDevolvidos.Checked then begin
      LFiltro := LFiltro +  ' AND (dtalocacao IS NOT NULL AND dtadevolucao IS NOT NULL)';
    end;
    if LookupComboFiltroEspecie.KeyValue <> 0 then
      LFiltro :=  LFiltro + (' AND seqespecie = ' +
       IntToStr(LookupComboFiltroEspecie.KeyValue));
    if LookupComboFiltroColaborador.KeyValue <> 0 then
      LFiltro :=  LFiltro + ' AND seqcolaborador = ' + IntToStr(LookupComboFiltroColaborador.KeyValue);
    tbLocacaoRelatorios.Filter := LFiltro;
  end;
  if DBGridRelLocacoes.DataSource.DataSet.IsEmpty then
    ShowMessage('Nenhum registro encontrado com os filtros selecionados!');
end;

procedure TfrmRelatorios.AjustarExibicaoDBGrid;
begin
  DBGridRelLocacoes.Columns[0].Width := 40;
  DBGridRelLocacoes.Columns[1].Width := 253;
  DBGridRelLocacoes.Columns[2].Visible := False;
  DBGridRelLocacoes.Columns[3].Width := 100;
  DBGridRelLocacoes.Columns[4].Visible := False;
  DBGridRelLocacoes.Columns[5].Width := 100;
  DBGridRelLocacoes.Columns[6].Width := 100;
  DBGridRelLocacoes.Columns[7].Visible := False;
  DBGridRelLocacoes.Columns[8].Width := 100;
end;

end.
