unit pdLocacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, Grids, DBGrids, StdCtrls, ComCtrls, DBCtrls;

type
  TfrmLocacao = class(TForm)
    PageControl: TPageControl;
    TabDataGridAlocar: TTabSheet;
    TabAlocarDevolver: TTabSheet;
    GroupBox2: TGroupBox;
    DBGridLocacao: TDBGrid;
    GroupBox1: TGroupBox;
    SpeedBAlocar: TSpeedButton;
    dsLocacao: TDataSource;
    GroupBoxCadColaborador: TGroupBox;
    LabSeqcolaborador: TLabel;
    Label1: TLabel;
    LabDataDevolucao: TLabel;
    LabDataLocacao: TLabel;
    DtpDataDevolucao: TDateTimePicker;
    GroupBoxOptCadColab: TGroupBox;
    SpeedBCancelar: TSpeedButton;
    SpeedBSalvar: TSpeedButton;
    DtpDataLocacao: TDateTimePicker;
    LookupComboColaborador: TDBLookupComboBox;
    Label2: TLabel;
    dsColaborador: TDataSource;
    dsEquipamento: TDataSource;
    dsEquipamentosIndisponiveis: TDataSource;
    TabDataGrideDevolucao: TTabSheet;
    GroupBox3: TGroupBox;
    DBGridDevolucao: TDBGrid;
    GroupBox4: TGroupBox;
    SpeedBDevolver: TSpeedButton;
    dsEquipamentosDisponiveis: TDataSource;
    LabEquipamentoSelecionado: TLabel;
    dsColaboradorDual: TDataSource;
    procedure LimpaCampos;
    procedure AjustarExibicaoDBGrid;
    function ValidaDados:Boolean;
    procedure FormActivate(Sender: TObject);
    procedure SpeedBAlocarClick(Sender: TObject);
    procedure DBGridLocacaoColEnter(Sender: TObject);
    procedure SpeedBCancelarClick(Sender: TObject);
    procedure SpeedBSalvarClick(Sender: TObject);
    procedure DBGridDevolucaoColEnter(Sender: TObject);
    procedure SpeedBDevolverClick(Sender: TObject);
    procedure TesteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocacao: TfrmLocacao;

implementation

uses pdDM1;

{$R *.dfm}

type
  TAcao = (Alocar, Devolver);

var
  acao: TAcao;

procedure TfrmLocacao.DBGridDevolucaoColEnter(Sender: TObject);
begin
  if DBGridDevolucao.SelectedIndex <> 0 then
     DBGridDevolucao.SelectedIndex := 0;
end;

procedure TfrmLocacao.DBGridLocacaoColEnter(Sender: TObject);
begin
  if DBGridLocacao.SelectedIndex <> 0 then
     DBGridLocacao.SelectedIndex := 0; 
end;

procedure TfrmLocacao.FormActivate(Sender: TObject);
begin
  TabDataGrideDevolucao.TabVisible := False;
  TabAlocarDevolver.TabVisible := False;
  DM1.tbEquipamentosDisponiveis.Refresh;
  DM1.tbEquipamentosIndisponiveis.Refresh;
  AjustarExibicaoDBGrid;
end;

procedure TfrmLocacao.SpeedBAlocarClick(Sender: TObject);
begin
  TabDataGridAlocar.Visible := False;
  TabAlocarDevolver.Visible := True;
  LabDataDevolucao.Visible := False;
  DtpDataDevolucao.Visible := False;
  LimpaCampos;
  DM1.tbEquipamentosDisponiveis.Refresh;
  DM1.tbColaboradorDual.Refresh;
  LookupComboColaborador.SetFocus;
  LabEquipamentoSelecionado.Caption := DM1.tbEquipamentosDisponiveisnome.Value;
  acao := Alocar;
end;

procedure TfrmLocacao.SpeedBCancelarClick(Sender: TObject);
begin
  ShowMessage('Opera��o Cancelada!');
  if acao = Alocar then begin 
    TabAlocarDevolver.Visible := False;
    TabDataGridAlocar.Visible := True;
  end else begin
    TabAlocarDevolver.Visible := False; 
    TabDataGrideDevolucao.Visible := True;
  end;
end;

procedure TfrmLocacao.SpeedBDevolverClick(Sender: TObject);
begin
  TabDataGridAlocar.Visible := False;
  TabDataGrideDevolucao.Visible := False;
  TabAlocarDevolver.Visible := True;
  LabDataDevolucao.Visible := True;
  DtpDataDevolucao.Visible := True;
  LookupComboColaborador.Enabled := False;
  LimpaCampos;
  with DM1 do
  begin
    tbEquipamentosIndisponiveis.Refresh;
    tbColaboradorDual.Refresh;
    LookupComboColaborador.KeyValue := tbEquipamentosIndisponiveisseqcolaborador.Value;
    LabEquipamentoSelecionado.Caption := tbEquipamentosIndisponiveisnomequipamento.Value;
    DtpDataLocacao.Date := tbEquipamentosIndisponiveisdtalocacao.Value;
  end;
  DtpDataDevolucao.Date := Now();
  acao := Devolver;
end;

procedure TfrmLocacao.SpeedBSalvarClick(Sender: TObject);
begin
  if ValidaDados then begin
    ShowMessage('Opera��o N�o Conclu�da!');
  end else begin
    with DM1 do
    begin
      if acao = Alocar then begin
        try
          tbLocacao.Append;
          tbLocacaoseqcolaborador.Value := LookupComboColaborador.KeyValue;
          tbLocacaoseqequipamento.Value := tbEquipamentosDisponiveisseqequipamento.Value;
          tbLocacaodtalocacao.Value := Now();
          tbLocacaodtadevolucao.Clear;
          tbLocacao.Post;
          tbLocacao.ApplyUpdates;
          tbEquipamentosDisponiveis.Refresh;
          tbEquipamentosIndisponiveis.Refresh;
          TabAlocarDevolver.Visible := False;
          TabDataGridAlocar.Visible := True;
          ShowMessage('Opera��o Salva!');
        except
          on E: Exception do begin
            ShowMessage('O equipamento ''' + tbEquipamentosDisponiveisnome.Value +
             ''' n�o pode ser devolvido e alocado no mesmo dia pelo colaborador ''' +
              LookupComboColaborador.Text + '''!');
          end;
        end;
      end else if (tbLocacao.Locate('seqcolaborador;seqequipamento;dtalocacao',
       VarArrayOf([ IntToStr(tbEquipamentosIndisponiveisseqcolaborador.Value),
       IntToStr(tbEquipamentosIndisponiveisseqequipamento.Value),
       FormatDateTime('yyyy-mm-dd',tbEquipamentosIndisponiveisdtalocacao.Value)]),
       [loCaseInsensitive])) then begin
        tbLocacao.Edit;
        tbLocacaodtadevolucao.Value := Now();
        tbLocacao.Post;
        tbLocacao.ApplyUpdates;
        tbEquipamentosIndisponiveis.Refresh;
        tbEquipamentosDisponiveis.Refresh;
        TabAlocarDevolver.Visible := False;
        TabDataGrideDevolucao.Visible := True;
        ShowMessage('Opera��o Salva!');
      end;
      LimpaCampos;
    end;
  end;
end;

procedure TfrmLocacao.TesteClick(Sender: TObject);
begin
  ShowMessage(DBGridLocacao.SelectedField.Value);
end;

procedure TfrmLocacao.LimpaCampos;
begin
  LookupComboColaborador.KeyValue := 0;
  LabEquipamentoSelecionado.Caption := '';
  DtpDataLocacao.Date := Now();
  DtpDataDevolucao.Date := Now();
end;

function TfrmLocacao.ValidaDados:Boolean;
begin
  if LookupComboColaborador.KeyValue = 0 then begin
    ShowMessage('Opera��o com colaborador selecionado ''Todos'' n�o permitida, informe o colaborador!');
    LookupComboColaborador.SetFocus();
  end else begin
    Result := False;
  end;
end;

procedure TfrmLocacao.AjustarExibicaoDBGrid;
begin
  DBGridDevolucao.Columns[0].Visible := False;
  DBGridDevolucao.Columns[1].Width := 275;
  DBGridDevolucao.Columns[2].Visible := False;
  DBGridDevolucao.Columns[3].Width := 275;
  DBGridDevolucao.Columns[4].Visible := False;
  DBGridDevolucao.Columns[5].Width := 120;
  DBGridDevolucao.Columns[6].Visible := False;
  DBGridDevolucao.Columns[7].Visible := False;
  DBGridLocacao.Columns[0].Width := 110;
  DBGridLocacao.Columns[1].Width := 461;
  DBGridLocacao.Columns[2].Visible := False;
  DBGridLocacao.Columns[3].Width := 110;
  DBGridLocacao.Columns[4].Visible := False;
  DBGridLocacao.Columns[5].Visible := False;
end;

end.
