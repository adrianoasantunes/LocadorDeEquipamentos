﻿unit pdPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, DB, Grids, DBGrids, Menus, jpeg;

type
  TfrmPrincipal = class(TForm)
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    MenuCadastros: TMenuItem;
    SubMenuCadColaborador: TMenuItem;
    SubMenuCadEquipamento: TMenuItem;
    MenuProcessos: TMenuItem;
    MenuSair: TMenuItem;
    MenuSobre: TMenuItem;
    SubMenuCadLocacao: TMenuItem;
    Relatrios1: TMenuItem;
    LocaesLista1: TMenuItem;
    ImgFundo: TImage;
    SubMenuCadDevolucao: TMenuItem;
    procedure SubMenuCadColaboradorClick(Sender: TObject);
    procedure SubMenuCadEquipamentoClick(Sender: TObject);
    procedure SubMenuCadLocacaoClick(Sender: TObject);
    procedure SubMenuCadDevolucaoClick(Sender: TObject);
    procedure LocaesLista1Click(Sender: TObject);
    procedure MenuSairClick(Sender: TObject);
    procedure MenuSobreClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses pdCadastroColaborador, pdCadastroEquipamento, pdColaborador, pdEquipamento,
  pdLocacao, pdRelatorio;

{$R *.dfm}

procedure TfrmPrincipal.SubMenuCadDevolucaoClick(Sender: TObject);
begin
  frmLocacao := TfrmLocacao.Create(nil);
  frmLocacao.dsEquipamentosDisponiveis.DataSet.Active := True;
  frmLocacao.TabDataGrideDevolucao.TabVisible := False;
  frmLocacao.TabDataGrideDevolucao.Visible := True;
  frmLocacao.TabDataGridAlocar.TabVisible := False;
  frmLocacao.TabAlocarDevolver.TabVisible := False;
  frmLocacao.ShowModal;
  frmLocacao.dsEquipamentosDisponiveis.DataSet.Active := False;
  FreeAndNil(frmLocacao);
end;

procedure TfrmPrincipal.LocaesLista1Click(Sender: TObject);
begin
  frmRelatorios := TfrmRelatorios.Create(nil);
  frmRelatorios.ShowModal;
  FreeAndNil(frmRelatorios);
end;

procedure TfrmPrincipal.MenuSairClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Deseja realmente encerrar a aplicação?'),
   'Aviso!',
   MB_YESNO + MB_ICONQUESTION) = ID_YES then begin
    frmPrincipal.Close;
  end;
end;

procedure TfrmPrincipal.MenuSobreClick(Sender: TObject);
begin
  ShowMessage('Projeto de locação de equipamentos criado para o programa de '
  +'aceleração de carreira SpeedToHero, com a finalidade de controlar a '
  +'locação e devolução de equipamentos por colaboradores.' + #13#13 +
  'Feito por: Adriano Antunes e Leandro Viana' + #13#13 +
  'Torre de VAREJO SUPERMERCADOS CENTRO DE DESENVOLVIMENTO - RIBEIRÃO PRETO.');
end;

procedure TfrmPrincipal.SubMenuCadColaboradorClick(Sender: TObject);
var
  frmCadColaborador :  TfrmCadColaborador;
begin
  frmColaborador := TfrmColaborador.Create(nil);
  frmColaborador.ShowModal;
  FreeAndNil(frmColaborador);
end;

procedure TfrmPrincipal.SubMenuCadEquipamentoClick(Sender: TObject);
begin
  frmEquipamentos := TfrmEquipamentos.Create(nil);
  frmEquipamentos.ShowModal;
  FreeAndNil(frmEquipamentos);
end;

procedure TfrmPrincipal.SubMenuCadLocacaoClick(Sender: TObject);
begin
  frmLocacao := TfrmLocacao.Create(nil);
  frmLocacao.dsEquipamentosDisponiveis.DataSet.Active := True;
  frmLocacao.TabDataGridAlocar.TabVisible := False;
  frmLocacao.TabDataGridAlocar.Visible := True;
  frmLocacao.TabDataGrideDevolucao.TabVisible := False;
  frmLocacao.TabAlocarDevolver.TabVisible := False;
  frmLocacao.ShowModal;
  frmLocacao.dsEquipamentosDisponiveis.DataSet.Active := False;
  FreeAndNil(frmLocacao);
end;

end.
