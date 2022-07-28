object frmRelatorios: TfrmRelatorios
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rios'
  ClientHeight = 483
  ClientWidth = 751
  Color = clBtnFace
  Constraints.MaxHeight = 514
  Constraints.MaxWidth = 759
  Constraints.MinHeight = 514
  Constraints.MinWidth = 759
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
    Width = 751
    Height = 483
    ActivePage = TabRelAlocadosDevolvidos
    Align = alClient
    TabOrder = 0
    object TabRelAlocadosDevolvidos: TTabSheet
      Caption = 'RelAlocadosDevolvidos'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 2
        Top = 112
        Width = 737
        Height = 340
        Caption = 'Relat'#243'rio de Loca'#231#245'es'
        TabOrder = 0
        object DBGridRelLocacoes: TDBGrid
          Left = 3
          Top = 16
          Width = 731
          Height = 321
          DataSource = dsLocacaoRelatorios
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnColEnter = DBGridRelLocacoesColEnter
        end
      end
      object GroupBox4: TGroupBox
        Left = 2
        Top = 3
        Width = 737
        Height = 103
        Caption = 'Filtros'
        TabOrder = 1
        object SpeedBPesquisar: TSpeedButton
          Left = 633
          Top = 18
          Width = 100
          Height = 42
          Caption = '&Pesquisar'
          OnClick = SpeedBPesquisarClick
        end
        object SpeedBLimpar: TSpeedButton
          Left = 633
          Top = 63
          Width = 100
          Height = 25
          Caption = '&Limpar'
          OnClick = SpeedBLimparClick
        end
        object GroupBox5: TGroupBox
          Left = 424
          Top = 13
          Width = 112
          Height = 75
          Caption = 'Por Esp'#233'cie'
          TabOrder = 0
          object LookupComboFiltroEspecie: TDBLookupComboBox
            Left = 7
            Top = 15
            Width = 102
            Height = 26
            DataField = 'especie'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'seqespecie'
            ListField = 'especie'
            ListSource = dsEquipamentoDual
            ParentFont = False
            TabOrder = 0
          end
        end
        object GroupBox6: TGroupBox
          Left = 539
          Top = 13
          Width = 90
          Height = 75
          Caption = 'Por Situa'#231#227'o'
          TabOrder = 1
          object RbFiltroDevolvidos: TRadioButton
            Left = 10
            Top = 51
            Width = 77
            Height = 15
            Caption = 'Devolvidos'
            TabOrder = 0
          end
          object RbFiltroAlocados: TRadioButton
            Left = 10
            Top = 33
            Width = 71
            Height = 15
            Caption = 'Alocados'
            TabOrder = 1
          end
          object RbFiltroTodos: TRadioButton
            Left = 10
            Top = 15
            Width = 51
            Height = 17
            Caption = 'Todos'
            TabOrder = 2
          end
        end
        object GroupBox7: TGroupBox
          Left = 11
          Top = 13
          Width = 396
          Height = 75
          Caption = 'Por Nome'
          TabOrder = 2
          object LookupComboFiltroColaborador: TDBLookupComboBox
            Left = 6
            Top = 15
            Width = 383
            Height = 26
            DataField = 'nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'seqcolaborador'
            ListField = 'nome'
            ListSource = dsColaboradorDual
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
  end
  object dsColaboradorDual: TDataSource
    DataSet = DM1.tbColaboradorDual
    Left = 648
    Top = 8
  end
  object dsEquipamentoDual: TDataSource
    DataSet = DM1.tbEspecieDual
    Left = 680
    Top = 8
  end
  object dsLocacaoRelatorios: TDataSource
    DataSet = DM1.tbLocacaoRelatorios
    Left = 713
    Top = 8
  end
end
