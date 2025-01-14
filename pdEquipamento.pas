unit pdEquipamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, Grids, DBGrids, StdCtrls, ComCtrls, DBCtrls, ExtCtrls;

type
  TfrmEquipamentos = class(TForm)
    GroupBox2: TGroupBox;
    DBGridEquipamento: TDBGrid;
    GroupBox1: TGroupBox;
    SpeedBEditar: TSpeedButton;
    SpeedBInativar: TSpeedButton;
    SpeedBIncluir: TSpeedButton;
    PageControl: TPageControl;
    TabDataGrid: TTabSheet;
    TabCadastro: TTabSheet;
    PanPrincipalCadEquip: TPanel;
    GroupBoxCadEquip: TGroupBox;
    LabSeqequipamento: TLabel;
    Lab: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    LookupComboEspecie: TDBLookupComboBox;
    EdNome: TEdit;
    GroupBoxOptCadColab: TGroupBox;
    SpeedBCancelar: TSpeedButton;
    SpeedBSalvar: TSpeedButton;
    dsEquipamento: TDataSource;
    dsEspecie: TDataSource;
    dsEquipamentoDBGridEquipamento: TDataSource;
    GroupBox4: TGroupBox;
    SpeedBPesquisar: TSpeedButton;
    SpeedBLimpar: TSpeedButton;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    RbFiltroInativo: TRadioButton;
    RbFiltroAtivo: TRadioButton;
    RbFiltroTodos: TRadioButton;
    GroupBox7: TGroupBox;
    EdFiltroNome: TEdit;
    LookupComboFiltroEspecie: TDBLookupComboBox;
    GroupBox8: TGroupBox;
    RbAtivo: TRadioButton;
    RbInativo: TRadioButton;
    dsEspecieDual: TDataSource;
    procedure LimpaCampos;
    function ValidaDados:Boolean;
    procedure AjustarExibicaoDBGrid;
    procedure SpeedBIncluirClick(Sender: TObject);
    procedure SpeedBEditarClick(Sender: TObject);
    procedure SpeedBInativarClick(Sender: TObject);
    procedure SpeedBSalvarClick(Sender: TObject);
    procedure SpeedBCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedBPesquisarClick(Sender: TObject);
    procedure SpeedBLimparClick(Sender: TObject);
    procedure DBGridEquipamentoColEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEquipamentos: TfrmEquipamentos;

implementation

uses pdDM1;

{$R *.dfm}

procedure TfrmEquipamentos.SpeedBCancelarClick(Sender: TObject);
begin
  with DM1 do
  begin
    tbEquipamento.Cancel;
    ShowMessage('Opera��o Cancelada!');
  end;
  TabDataGrid.Visible := True;
  TabCadastro.Visible := False;
end;

procedure TfrmEquipamentos.SpeedBEditarClick(Sender: TObject);
begin
  with DM1 do
  begin
    if tbEquipamentosDBGridEquipamentosituacao.Value = 'I' then begin
      ShowMessage('O registro ''' + tbEquipamentosDBGridEquipamentonome.Value +
      ''' n�o pode ser editado por ser um registro com situa��o ''inativado''!');
    end else begin
      TabDataGrid.Visible := False;
      TabCadastro.Visible := True;
    end;
    if tbEquipamento.Locate('seqequipamento',
     VarArrayOf([IntToStr(tbEquipamentosDBGridEquipamentoseqequipamento.Value)]),
     [loCaseInsensitive]) then begin
      LabSeqequipamento.Caption := IntToStr(tbEquipamentosDBGridEquipamentoseqequipamento.Value);
      EdNome.Text := tbEquipamentosDBGridEquipamentonome.Value;
      LookupComboEspecie.KeyValue := tbEquipamentosDBGridEquipamentoseqespecie.Value;
      if tbEquipamentosDBGridEquipamentosituacao.Value = 'A' then
        RbAtivo.Checked := True
      else
        RbInativo.Checked := True;
    end;
    tbEquipamento.Edit;
  end;
end;

procedure TfrmEquipamentos.SpeedBInativarClick(Sender: TObject);
var
 Lseqequipamento : integer;
begin
  with DM1 do
  begin
    if Application.MessageBox(PChar('Deseja realmente inativar o equipamento: '''
     + tbEquipamentosDBGridEquipamentonome.Value + ''' ?'),
     'Aviso!',
     MB_YESNO + MB_ICONQUESTION) = ID_YES then begin
      if (tbLocacao.Locate('seqequipamento;dtadevolucao',
       VarArrayOf([ IntToStr(tbEquipamentosDBGridEquipamentoseqequipamento.Value),
       Null]),
       [loCaseInsensitive])) then begin
        ShowMessage('Colaborador possui equipamento(s) alocado(s), antes de inativ�-lo, utilize o processo ''devolver''!');
      end else begin
        if tbEquipamento.Locate('seqequipamento',
         VarArrayOf([IntToStr(tbEquipamentosDBGridEquipamentoseqequipamento.Value)]),
         [loCaseInsensitive]) then begin
          tbEquipamento.Edit;
          tbEquipamentosituacao.Value := 'I';
          tbEquipamento.Post;
          tbEquipamentosDBGridEquipamento.Refresh;
        end;
      end;
    end;
  end;
end;

procedure TfrmEquipamentos.SpeedBIncluirClick(Sender: TObject);
begin
  TabDataGrid.Visible := False;
  TabCadastro.Visible := True;
  RbAtivo.Checked := True;
  LimpaCampos;
  EdNome.SetFocus;
  DM1.tbEquipamento.Append;
end;

procedure TfrmEquipamentos.SpeedBLimparClick(Sender: TObject);
begin
  RbFiltroTodos.Checked := False;
  RbFiltroAtivo.Checked := True;
  RbFiltroInativo.Checked := False;
  LookupComboFiltroEspecie.KeyValue := 0;
  EdFiltroNome.Clear;
  EdFiltroNome.SetFocus;
  SpeedBPesquisar.OnClick(Sender);
end;

procedure TfrmEquipamentos.SpeedBPesquisarClick(Sender: TObject);
var
  LFiltro : String;
begin
  if RbFiltroInativo.Checked then begin
    SpeedBEditar.Enabled := False;
    SpeedBInativar.Enabled := False;
  end else begin
    SpeedBEditar.Enabled := True;
    SpeedBInativar.Enabled := True;
  end;
  with DM1 do
  begin
    tbEquipamentosDBGridEquipamento.Refresh;
    tbEquipamentosDBGridEquipamento.Filtered := True;
    LFiltro := '1 = 1';
    if EdFiltroNome.Text <> EmptyStr then
      LFiltro := LFiltro +  ' AND nome LIKE ' + '''*' + EdFiltroNome.Text + '*''';
    if RbFiltroAtivo.Checked then begin
      LFiltro := LFiltro +  ' AND situacao = ''A''';
    end else if RbFiltroInativo.Checked then begin
        LFiltro := LFiltro +  ' AND situacao = ''I''';
    end;
    if (LookupComboFiltroEspecie.KeyValue = Null)
     or (LookupComboFiltroEspecie.KeyValue = 0) then
      tbEquipamentosDBGridEquipamento.Filter := LFiltro
    else
      LFiltro := LFiltro +  ' AND seqespecie = ' + IntToStr(LookupComboFiltroEspecie.KeyValue);
    tbEquipamentosDBGridEquipamento.Filter := LFiltro;
  end;
  if DBGridEquipamento.DataSource.DataSet.IsEmpty then
    ShowMessage('Nenhum registro encontrado com os filtros selecionados!');
end;

procedure TfrmEquipamentos.SpeedBSalvarClick(Sender: TObject);
begin
  if ValidaDados then begin
    ShowMessage('Opera��o N�o Conclu�da!');
  end else begin
    with DM1 do
    begin
      tbEquipamentonome.Value := EdNome.Text;
      tbEquipamentoseqespecie.Value := LookupComboEspecie.KeyValue;
      tbEquipamentosituacao.Value := 'A';
      tbEquipamento.Post;
      tbEquipamentosDBGridEquipamento.Refresh;
      ShowMessage('Opera��o Salva!');
    end;
    LimpaCampos;
    TabCadastro.Visible := False;
    TabDataGrid.Visible := True;
  end;
end;

procedure TfrmEquipamentos.DBGridEquipamentoColEnter(Sender: TObject);
begin
  if DBGridEquipamento.SelectedIndex <> 0 then
     DBGridEquipamento.SelectedIndex := 0;
end;

procedure TfrmEquipamentos.FormActivate(Sender: TObject);
begin
  TabDataGrid.TabVisible := False;
  TabCadastro.TabVisible := False;
  TabDataGrid.Visible := True;
  EdFiltroNome.SetFocus;
  AjustarExibicaoDBGrid;
  RbFiltroAtivo.Checked := True;
  if not DBGridEquipamento.DataSource.DataSet.IsEmpty then
    SpeedBPesquisar.OnClick(Sender);
end;

procedure TfrmEquipamentos.LimpaCampos;
begin
  EdNome.Text := '';
  LookupComboEspecie.KeyValue := 0;
end;

function TfrmEquipamentos.ValidaDados:Boolean;
begin
  if EdNome.Text = EmptyStr then begin
    ShowMessage('Para concluir opera��o desejada � preciso preencher o campo ''Nome''!');
    EdNome.SetFocus();
  end else if LookupComboEspecie.KeyValue = 0 then begin
    ShowMessage('Para concluir opera��o desejada � preciso preencher o campo ''Esp�cie''!');
    LookupComboEspecie.SetFocus();
  end else begin
    Result := False;
  end;
end;

procedure TfrmEquipamentos.AjustarExibicaoDBGrid;
begin
  DBGridEquipamento.Columns[0].Width := 50;
  DBGridEquipamento.Columns[1].Width := 480;
  DBGridEquipamento.Columns[2].Visible := False;
  DBGridEquipamento.Columns[3].Width := 90;
  DBGridEquipamento.Columns[4].Visible := False;
  DBGridEquipamento.Columns[5].Width := 60;
end;

end.
