unit pdColaborador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfrmColaborador = class(TForm)
    PageControl: TPageControl;
    TabDataGrid: TTabSheet;
    TabCadastro: TTabSheet;
    PanPrincipalCadColab: TPanel;
    GroupBoxOptCadColab: TGroupBox;
    SpeedBCancelar: TSpeedButton;
    SpeedBSalvar: TSpeedButton;
    GroupBoxCadColaborador: TGroupBox;
    Lab: TLabel;
    LabSeqcolaborador: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    RbMasculino: TRadioButton;
    RbFeminino: TRadioButton;
    EdNome: TEdit;
    EdEmail: TEdit;
    DtpDataNascimento: TDateTimePicker;
    DBGridColaborador: TDBGrid;
    GroupBox1: TGroupBox;
    SpeedBEditar: TSpeedButton;
    SpeedBInativar: TSpeedButton;
    SpeedBIncluir: TSpeedButton;
    dsColaborador: TDataSource;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    RbFiltroMasculino: TRadioButton;
    RbFiltroFeminino: TRadioButton;
    RbFiltroInativo: TRadioButton;
    RbFiltroAtivo: TRadioButton;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    RbFiltroTodosSituacao: TRadioButton;
    SpeedBPesquisar: TSpeedButton;
    EdFiltroNome: TEdit;
    SpeedBLimpar: TSpeedButton;
    RbAtivo: TRadioButton;
    RbInativo: TRadioButton;
    GroupBox8: TGroupBox;
    RbFiltroTodosSexo: TRadioButton;
    procedure LimpaCampos;
    procedure AjustarExibicaoDBGrid;
    function ValidaDados:Boolean;
    procedure SpeedBIncluirClick(Sender: TObject);
    procedure SpeedBEditarClick(Sender: TObject);
    procedure SpeedBInativarClick(Sender: TObject);
    procedure SpeedBSalvarClick(Sender: TObject);
    procedure SpeedBCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedBPesquisarClick(Sender: TObject);
    procedure SpeedBLimparClick(Sender: TObject);
    procedure DBGridColaboradorColEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmColaborador: TfrmColaborador;

implementation

uses pdDM1;

{$R *.dfm}

procedure TfrmColaborador.DBGridColaboradorColEnter(Sender: TObject);
begin
  if DBGridColaborador.SelectedIndex <> 0 then
     DBGridColaborador.SelectedIndex := 0;
end;

procedure TfrmColaborador.FormActivate(Sender: TObject);
begin
  TabDataGrid.TabVisible := False;
  TabCadastro.TabVisible := False;
  TabDataGrid.Visible := True;
  EdFiltroNome.SetFocus();
  RbFiltroAtivo.Checked := True;
  RbFiltroTodosSexo.Checked := True;
  AjustarExibicaoDBGrid;
  if not DBGridColaborador.DataSource.DataSet.IsEmpty then
    SpeedBPesquisar.OnClick(Sender);
end;

procedure TfrmColaborador.SpeedBCancelarClick(Sender: TObject);
begin
  with DM1 do
  begin
    tbColaborador.Cancel;
    ShowMessage('Opera��o Cancelada!');
  end;
  TabDataGrid.Visible := True;
  TabCadastro.Visible := False;
end;

procedure TfrmColaborador.SpeedBEditarClick(Sender: TObject);
begin
  TabDataGrid.Visible := False;
  TabCadastro.Visible := True;
  RbInativo.Visible := True;
  with DM1 do
  begin
    tbColaborador.Edit;
    LabSeqcolaborador.Caption := IntToStr(tbColaboradorseqcolaborador.Value);
    EdNome.Text := tbColaboradornome.Value;
    EdEmail.Text := tbColaboradoremail.Value;
    if tbColaboradorsexo.Value = 'M' then
      RbMasculino.Checked := True
    else
      RbFeminino.Checked := True;
    DtpDataNascimento.Date := tbColaboradordtanascimento.Value;
    if tbColaboradorsituacao.Value = 'A' then
      RbAtivo.Checked := True
    else
      RbInativo.Checked := True;
    DtpDataNascimento.Date := tbColaboradordtanascimento.Value;
  end;
end;

procedure TfrmColaborador.SpeedBInativarClick(Sender: TObject);
begin
  with DM1 do
  begin
    if Application.MessageBox(PChar('Deseja realmente inativar o colaborador: '''
     + tbColaboradornome.Value + ''' ?'),
     'Aviso!',
     MB_YESNO + MB_ICONQUESTION) = ID_YES then begin
       if (tbLocacao.Locate('seqcolaborador;dtadevolucao',
        VarArrayOf([ IntToStr(tbColaboradorseqcolaborador.Value),
        Null]),
        [loCaseInsensitive])) then begin
         ShowMessage('Colaborador possui equipamento(s) alocado(s), antes de inativ�-lo, utilize o processo ''devolver''!');
        end else begin
          tbColaborador.Refresh;
          tbColaborador.Edit;
          tbColaboradorsituacao.Value := 'I';
          tbColaborador.Post;
        end;
    end;
  end;
end;

procedure TfrmColaborador.SpeedBIncluirClick(Sender: TObject);
begin
  TabDataGrid.Visible := False;
  TabCadastro.Visible := True;
  RbAtivo.Checked := True;
  RbInativo.Visible := False;
  LimpaCampos;
  EdNome.SetFocus;
  DM1.tbColaborador.Append;
end;

procedure TfrmColaborador.SpeedBLimparClick(Sender: TObject);
begin
  RbFiltroTodosSituacao.Checked := False;
  RbFiltroAtivo.Checked := True;
  RbFiltroInativo.Checked := False;
  RbFiltroTodosSexo.Checked := True;
  RbFiltroMasculino.Checked := False;
  RbFiltroFeminino.Checked := False;
  EdFiltroNome.Text := EmptyStr;
  EdFiltroNome.SetFocus;
  SpeedBPesquisar.OnClick(Sender);
end;

procedure TfrmColaborador.SpeedBSalvarClick(Sender: TObject);
begin
  if ValidaDados then begin
    ShowMessage('Opera��o N�o Conclu�da!');
  end else begin
    with DM1 do
    begin
      tbColaboradornome.Value := EdNome.Text;
      tbColaboradoremail.Value := EdEmail.Text;
      if RbMasculino.Checked = True then
        tbColaboradorsexo.Value := 'M'
      else if RbFeminino.Checked = True then
        tbColaboradorsexo.Value := 'F'
      else
        tbColaboradorsexo.Value := '';
      if RbAtivo.Checked = True then
        tbColaboradorsituacao.Value := 'A'
      else
        tbColaboradorsituacao.Value := 'I';
      tbColaboradordtanascimento.Value := dtpDataNascimento.Date;
      tbColaborador.Post;
      tbColaborador.Refresh;
      ShowMessage('Opera��o Salva!');
      TabCadastro.Visible := False;
      TabDataGrid.Visible := True;
      LimpaCampos;
    end;
  end;
end;

procedure TfrmColaborador.SpeedBPesquisarClick(Sender: TObject);
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
    tbColaborador.Refresh;
    tbColaborador.Filtered := True;
    LFiltro := '1 = 1';
    if EdFiltroNome.Text <> EmptyStr then
      LFiltro := LFiltro +  ' AND nome LIKE ' + '''*' + EdFiltroNome.Text + '*''';
    if RbFiltroAtivo.Checked then
      LFiltro := LFiltro +  ' AND situacao = ''A'''
    else if RbFiltroInativo.Checked then
      LFiltro := LFiltro +  ' AND situacao = ''I''';
    if RbFiltroMasculino.Checked then
        LFiltro := LFiltro +  ' AND sexo = ''M'''
    else if RbFiltroFeminino.Checked then
        LFiltro := LFiltro +  ' AND sexo = ''F''';
    tbColaborador.Filter := LFiltro;
  end;
  if DBGridColaborador.DataSource.DataSet.IsEmpty then
    ShowMessage('Nenhum registro encontrado com os filtros selecionados!');
end;

procedure TfrmColaborador.LimpaCampos;
begin
  EdNome.Text := '';
  EdEmail.Text := '';
  DtpDataNascimento.Date := Now();
  RbMasculino.Checked := False;
  RbFeminino.Checked := False;
end;

function TfrmColaborador.ValidaDados:Boolean;
begin
  if EdNome.Text = EmptyStr then begin
    ShowMessage('Para concluir opera��o desejada � preciso preencher o campo ''Nome''!');
    EdNome.SetFocus();
  end else begin
    Result := False;
  end;
end;

procedure TfrmColaborador.AjustarExibicaoDBGrid;
begin
  DBGridColaborador.Columns[0].Width := 40;
  DBGridColaborador.Columns[1].Width := 258;
  DBGridColaborador.Columns[2].Visible := False;
  DBGridColaborador.Columns[3].Width := 60;
  DBGridColaborador.Columns[4].Width := 100;
  DBGridColaborador.Columns[5].Width := 150;
  DBGridColaborador.Columns[6].Visible := False;
  DBGridColaborador.Columns[7].Width := 70;
end;

end.
