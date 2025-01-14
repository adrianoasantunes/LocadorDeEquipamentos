unit pdCadastroColaborador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, ComCtrls, Buttons, DB;

type
  TfrmCadColaborador = class(TForm)
    PanPrincipalCadColab: TPanel;
    DBGridColaborador: TDBGrid;
    SpeedBSalvar: TSpeedButton;
    SpeedBEditar: TSpeedButton;
    SpeedBExcluir: TSpeedButton;
    SpeedBCancelar: TSpeedButton;
    SpeedBIncluir: TSpeedButton;
    GroupBoxOptCadColab: TGroupBox;
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
    dsColaborador: TDataSource;
    procedure BloqueiaCampos;
    procedure LimpaCampos;
    procedure SpeedBEditarClick(Sender: TObject);
    procedure SpeedBSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedBCancelarClick(Sender: TObject);
    procedure SpeedBIncluirClick(Sender: TObject);
    procedure SpeedBExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadColaborador: TfrmCadColaborador;
  estado : Integer;

implementation

uses pdPrincipal, pdDM1;

{$R *.dfm}

procedure TfrmCadColaborador.FormActivate(Sender: TObject);
begin
  estado := 0;
  BloqueiaCampos;
end;

procedure TfrmCadColaborador.SpeedBCancelarClick(Sender: TObject);
begin
  with DM1 do
  begin
    tbColaborador.Cancel;
    ShowMessage('Opera��o Cancelada!');
  end;
  estado := 0;
  LimpaCampos;
  BloqueiaCampos;
end;

procedure TfrmCadColaborador.SpeedBEditarClick(Sender: TObject);
begin
  estado := 2;
  BloqueiaCampos;
  with DM1 do
  begin
    tbColaborador.Edit;
    LabSeqcolaborador.Caption := IntToStr(tbColaboradorseqcolaborador.Value);
    EdNome.Text := tbColaboradornome.Value;
    if tbColaboradorsexo.Value = 'M' then
      RbMasculino.Checked := True
    else
      RbFeminino.Checked := True;
    DtpDataNascimento.Date := tbColaboradordtanascimento.Value;
  end;
end;

procedure TfrmCadColaborador.SpeedBExcluirClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Deseja realmente excluir o colaborador: ' + DM1.tbColaboradornome.Value + '?'),
   'Aviso!',
   MB_YESNO + MB_ICONQUESTION) = ID_YES then
     DM1.tbColaborador.Delete;
  estado := 0;
  BloqueiaCampos;
end;

procedure TfrmCadColaborador.SpeedBIncluirClick(Sender: TObject);
begin
  estado := 1;
  BloqueiaCampos;
  EdNome.SetFocus;
  DM1.tbColaborador.Append;
end;

procedure TfrmCadColaborador.SpeedBSalvarClick(Sender: TObject);
begin
  with DM1 do
  begin
    tbColaboradornome.Value := EdNome.Text;
    if RbMasculino.Checked = True then
      tbColaboradorsexo.Value := 'M'
    else
      tbColaboradorsexo.Value := 'F';
    tbColaboradordtanascimento.Value := dtpDataNascimento.Date;
    tbColaborador.Post;
    ShowMessage('Opera��o Salva!');
  end;
  estado := 0;
  LimpaCampos;
  BloqueiaCampos;
end;

procedure TfrmCadColaborador.BloqueiaCampos;
begin
  if estado = 0 then begin   
      EdNome.Enabled := False;
      EdEmail.Enabled := False;
      DtpDataNascimento.Enabled := False;
      RbMasculino.Enabled := False;
      RbFeminino.Enabled := False;
      SpeedBIncluir.Enabled := True;
      SpeedBEditar.Enabled := True;
      SpeedBExcluir.Enabled := True;
      SpeedBSalvar.Enabled := False;
      SpeedBCancelar.Enabled := True;
   end else if estado = 1 then begin
      EdNome.Enabled := True;
      EdEmail.Enabled := True;
      DtpDataNascimento.Enabled := True;
      RbMasculino.Enabled := True;
      RbFeminino.Enabled := True;
      SpeedBEditar.Enabled := False;
      SpeedBExcluir.Enabled := False;
      SpeedBSalvar.Enabled := True;
      SpeedBCancelar.Enabled := True;
   end else if estado = 2 then begin
      EdNome.Enabled := True;
      EdEmail.Enabled := True;
      DtpDataNascimento.Enabled := True;
      RbMasculino.Enabled := True;
      RbFeminino.Enabled := True;
      SpeedBIncluir.Enabled := False;
      SpeedBEditar.Enabled := False;
      SpeedBExcluir.Enabled := False;
      SpeedBSalvar.Enabled := True;
      SpeedBCancelar.Enabled := True;
    end;
end;

procedure TfrmCadColaborador.LimpaCampos;
begin
  LabSeqcolaborador.Caption := '';
  EdNome.Text := '';
  EdEmail.Text := '';
  DtpDataNascimento.Date := Now();
  RbMasculino.Checked := False;
  RbFeminino.Checked := False;
end;

end.
