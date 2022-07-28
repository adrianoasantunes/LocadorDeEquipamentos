unit pdDM1;

interface

uses
  SysUtils, Classes, ZConnection, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TDM1 = class(TDataModule)
    SQLDMConexao: TZConnection;
    tbColaborador: TZQuery;
    tbEquipamento: TZQuery;
    tbEspecie: TZQuery;
    tbLocacao: TZQuery;
    tbEspecieseqespecie: TIntegerField;
    tbEspecieespecie: TStringField;
    tbEquipamentosDisponiveis: TZQuery;
    tbEquipamentosIndisponiveis: TZQuery;
    tbEquipamentosDBGridEquipamento: TZQuery;
    tbLocacaoseqcolaborador: TIntegerField;
    tbLocacaoseqequipamento: TIntegerField;
    tbLocacaodtalocacao: TDateField;
    tbLocacaodtadevolucao: TDateField;
    tbEquipamentoseqequipamento: TIntegerField;
    tbEquipamentonome: TStringField;
    tbEquipamentoseqespecie: TIntegerField;
    tbEquipamentosituacao: TStringField;
    tbColaboradorseqcolaborador: TIntegerField;
    tbColaboradornome: TStringField;
    tbColaboradorsexo: TStringField;
    tbColaboradordecode_sexo: TStringField;
    tbColaboradordtanascimento: TDateField;
    tbColaboradoremail: TStringField;
    tbColaboradorsituacao: TStringField;
    tbColaboradordecode_situacao: TStringField;
    tbEquipamentosDBGridEquipamentoseqequipamento: TIntegerField;
    tbEquipamentosDBGridEquipamentonome: TStringField;
    tbEquipamentosDBGridEquipamentoseqespecie: TIntegerField;
    tbEquipamentosDBGridEquipamentoespecie: TStringField;
    tbEquipamentosDBGridEquipamentosituacao: TStringField;
    tbEquipamentosDBGridEquipamentodecode_situacao: TStringField;
    tbEspecieDual: TZQuery;
    tbColaboradorDual: TZQuery;
    tbEquipamentosDisponiveisseqequipamento: TIntegerField;
    tbEquipamentosDisponiveisnome: TStringField;
    tbEquipamentosDisponiveisseqespecie: TIntegerField;
    tbEquipamentosDisponiveisespecie: TStringField;
    tbEquipamentosDisponiveissituacao: TStringField;
    tbEquipamentosDisponiveisdecode_situacao: TStringField;
    tbLocacaoRelatorios: TZQuery;
    tbLocacaoRelatoriosseqcolaborador: TIntegerField;
    tbLocacaoRelatoriosnomecolaborador: TStringField;
    tbLocacaoRelatoriosseqequipamento: TIntegerField;
    tbLocacaoRelatoriosnomequipamento: TStringField;
    tbLocacaoRelatoriosseqespecie: TIntegerField;
    tbLocacaoRelatoriosespecie: TStringField;
    tbLocacaoRelatoriosdtalocacao: TDateField;
    tbLocacaoRelatoriosdtadevolucao: TDateField;
    tbLocacaoRelatoriosdecode_dtadevolucao: TStringField;
    tbEspecieDualseqespecie: TLargeintField;
    tbEspecieDualespecie: TStringField;
    tbEspecieDualordem: TLargeintField;
    tbColaboradorDualseqcolaborador: TLargeintField;
    tbColaboradorDualnome: TStringField;
    tbColaboradorDualsexo: TStringField;
    tbColaboradorDualdtanascimento: TStringField;
    tbColaboradorDualemail: TStringField;
    tbColaboradorDualsituacao: TStringField;
    tbColaboradorDualordem: TLargeintField;
    tbEquipamentosIndisponiveisseqcolaborador: TIntegerField;
    tbEquipamentosIndisponiveisnomecolaborador: TStringField;
    tbEquipamentosIndisponiveisseqequipamento: TIntegerField;
    tbEquipamentosIndisponiveisnomequipamento: TStringField;
    tbEquipamentosIndisponiveisseqespecie: TIntegerField;
    tbEquipamentosIndisponiveisespecie: TStringField;
    tbEquipamentosIndisponiveisdtalocacao: TDateField;
    tbEquipamentosIndisponiveisdtadevolucao: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM1: TDM1;

implementation

{$R *.dfm}

end.
