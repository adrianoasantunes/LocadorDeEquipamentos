object frmEquipamentos: TfrmEquipamentos
  Left = 0
  Top = 0
  Caption = 'Equipamentos'
  ClientHeight = 483
  ClientWidth = 778
  Color = clBtnFace
  Constraints.MaxHeight = 514
  Constraints.MaxWidth = 786
  Constraints.MinHeight = 514
  Constraints.MinWidth = 786
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 778
    Height = 483
    ActivePage = TabCadastro
    Align = alClient
    TabOrder = 0
    object TabDataGrid: TTabSheet
      Caption = 'DataGrid'
      object GroupBox1: TGroupBox
        Left = 16
        Top = 382
        Width = 737
        Height = 73
        Caption = 'Op'#231#245'es'
        TabOrder = 0
        object SpeedBEditar: TSpeedButton
          Left = 298
          Top = 21
          Width = 100
          Height = 40
          Cursor = crHandPoint
          Caption = '&Editar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedBEditarClick
        end
        object SpeedBInativar: TSpeedButton
          Left = 404
          Top = 21
          Width = 100
          Height = 40
          Cursor = crHandPoint
          Caption = '&Inativar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedBInativarClick
        end
        object SpeedBIncluir: TSpeedButton
          Left = 192
          Top = 21
          Width = 100
          Height = 40
          Cursor = crHandPoint
          Caption = '&Incluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedBIncluirClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 91
        Width = 737
        Height = 291
        Caption = 'Lista de Equipamentos'
        TabOrder = 1
        object DBGridEquipamento: TDBGrid
          Left = 3
          Top = 16
          Width = 716
          Height = 267
          DataSource = dsEquipamentoDBGridEquipamento
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnColEnter = DBGridEquipamentoColEnter
        end
      end
      object GroupBox4: TGroupBox
        Left = 15
        Top = 1
        Width = 737
        Height = 89
        Caption = 'Filtros'
        TabOrder = 2
        object SpeedBPesquisar: TSpeedButton
          Left = 627
          Top = 16
          Width = 100
          Height = 40
          Caption = '&Pesquisar'
          OnClick = SpeedBPesquisarClick
        end
        object SpeedBLimpar: TSpeedButton
          Left = 627
          Top = 62
          Width = 100
          Height = 22
          Caption = '&Limpar'
          OnClick = SpeedBLimparClick
        end
        object GroupBox5: TGroupBox
          Left = 379
          Top = 11
          Width = 112
          Height = 73
          Caption = 'Por Esp'#233'cie'
          TabOrder = 1
          object LookupComboFiltroEspecie: TDBLookupComboBox
            Left = 6
            Top = 15
            Width = 101
            Height = 26
            DataField = 'especie'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'seqespecie'
            ListField = 'especie'
            ListSource = dsEspecieDual
            ParentFont = False
            TabOrder = 0
          end
        end
        object GroupBox6: TGroupBox
          Left = 495
          Top = 11
          Width = 127
          Height = 73
          Caption = 'Por Situa'#231#227'o'
          TabOrder = 2
          object RbFiltroInativo: TRadioButton
            Left = 10
            Top = 51
            Width = 58
            Height = 15
            Caption = 'Inativo'
            TabOrder = 1
          end
          object RbFiltroAtivo: TRadioButton
            Left = 10
            Top = 34
            Width = 44
            Height = 15
            Caption = 'Ativo'
            TabOrder = 2
          end
          object RbFiltroTodos: TRadioButton
            Left = 10
            Top = 15
            Width = 51
            Height = 17
            Caption = 'Todos'
            TabOrder = 0
          end
        end
        object GroupBox7: TGroupBox
          Left = 11
          Top = 11
          Width = 362
          Height = 73
          Caption = 'Por Nome'
          TabOrder = 3
        end
        object EdFiltroNome: TEdit
          Left = 22
          Top = 26
          Width = 342
          Height = 26
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object PanPrincipalCadEquip: TPanel
        Left = 0
        Top = 0
        Width = 770
        Height = 455
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object GroupBoxCadEquip: TGroupBox
          Left = 23
          Top = 8
          Width = 729
          Height = 353
          Caption = 'Cadastro'
          TabOrder = 0
          object LabSeqequipamento: TLabel
            Left = 81
            Top = 21
            Width = 40
            Height = 18
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Lab: TLabel
            Left = 24
            Top = 21
            Width = 51
            Height = 18
            Caption = 'C'#243'digo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 24
            Top = 48
            Width = 43
            Height = 18
            Caption = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 24
            Top = 101
            Width = 57
            Height = 18
            Caption = 'Especie'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LookupComboEspecie: TDBLookupComboBox
            Left = 24
            Top = 125
            Width = 577
            Height = 26
            DataField = 'especie'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'seqespecie'
            ListField = 'especie'
            ListSource = dsEspecie
            ParentFont = False
            TabOrder = 0
          end
          object EdNome: TEdit
            Left = 24
            Top = 72
            Width = 577
            Height = 26
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object GroupBoxOptCadColab: TGroupBox
          Left = 23
          Top = 367
          Width = 729
          Height = 73
          Caption = 'Op'#231#245'es'
          TabOrder = 1
          object SpeedBCancelar: TSpeedButton
            Left = 360
            Top = 21
            Width = 100
            Height = 40
            Cursor = crHandPoint
            Caption = '&Cancelar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedBCancelarClick
          end
          object SpeedBSalvar: TSpeedButton
            Left = 254
            Top = 21
            Width = 100
            Height = 40
            Cursor = crHandPoint
            Caption = '&Salvar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedBSalvarClick
          end
        end
      end
      object GroupBox8: TGroupBox
        Left = 639
        Top = 62
        Width = 98
        Height = 97
        Caption = 'Situa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object RbAtivo: TRadioButton
          Left = 22
          Top = 33
          Width = 49
          Height = 17
          Caption = 'Ativo'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object RbInativo: TRadioButton
          Left = 22
          Top = 56
          Width = 89
          Height = 17
          Caption = 'Inativo'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  object dsEquipamento: TDataSource
    DataSet = DM1.tbEquipamento
    Left = 680
    Top = 24
  end
  object dsEspecie: TDataSource
    DataSet = DM1.tbEspecie
    Left = 712
    Top = 24
  end
  object dsEquipamentoDBGridEquipamento: TDataSource
    DataSet = DM1.tbEquipamentosDBGridEquipamento
    Left = 648
    Top = 24
  end
  object dsEspecieDual: TDataSource
    DataSet = DM1.tbEspecieDual
    Left = 744
    Top = 24
  end
end
