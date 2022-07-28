object frmLocacao: TfrmLocacao
  Left = 0
  Top = 0
  Caption = 'Locacao'
  ClientHeight = 485
  ClientWidth = 765
  Color = clBtnFace
  Constraints.MaxHeight = 516
  Constraints.MaxWidth = 773
  Constraints.MinHeight = 516
  Constraints.MinWidth = 773
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
    Width = 765
    Height = 485
    ActivePage = TabDataGridAlocar
    Align = alClient
    TabOrder = 0
    object TabDataGridAlocar: TTabSheet
      Caption = 'DataGridAlocar'
      object GroupBox1: TGroupBox
        Left = 8
        Top = 381
        Width = 740
        Height = 73
        Caption = 'Op'#231#245'es'
        TabOrder = 0
        object SpeedBAlocar: TSpeedButton
          Left = 312
          Top = 19
          Width = 100
          Height = 40
          Cursor = crHandPoint
          Caption = '&Alocar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedBAlocarClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 10
        Top = 3
        Width = 737
        Height = 372
        Caption = 'Lista de Equipamentos Dispon'#237'veis'
        TabOrder = 1
        object DBGridLocacao: TDBGrid
          Left = 11
          Top = 18
          Width = 716
          Height = 344
          DataSource = dsEquipamentosDisponiveis
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnColEnter = DBGridLocacaoColEnter
        end
      end
    end
    object TabAlocarDevolver: TTabSheet
      Caption = 'AlocacarDevolver'
      ImageIndex = 1
      object GroupBoxCadColaborador: TGroupBox
        Left = 16
        Top = 4
        Width = 729
        Height = 371
        Caption = 'Loca'#231#227'o'
        TabOrder = 0
        object LabSeqcolaborador: TLabel
          Left = 46
          Top = 16
          Width = 4
          Height = 18
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 24
          Top = 32
          Width = 92
          Height = 18
          Caption = 'Colaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabDataDevolucao: TLabel
          Left = 238
          Top = 159
          Width = 117
          Height = 18
          Caption = 'Data Devolu'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabDataLocacao: TLabel
          Left = 27
          Top = 159
          Width = 100
          Height = 18
          Caption = 'Data Loca'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 27
          Top = 95
          Width = 196
          Height = 18
          Caption = 'Equipamento Selecionado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabEquipamentoSelecionado: TLabel
          Left = 27
          Top = 119
          Width = 126
          Height = 23
          Caption = 'Equipamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DtpDataDevolucao: TDateTimePicker
          Left = 238
          Top = 183
          Width = 186
          Height = 26
          Date = 44753.463161284720000000
          Time = 44753.463161284720000000
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DtpDataLocacao: TDateTimePicker
          Left = 27
          Top = 183
          Width = 186
          Height = 26
          Date = 44753.463161284720000000
          Time = 44753.463161284720000000
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object LookupComboColaborador: TDBLookupComboBox
          Left = 24
          Top = 56
          Width = 673
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
          TabOrder = 2
        end
      end
      object GroupBoxOptCadColab: TGroupBox
        Left = 16
        Top = 381
        Width = 729
        Height = 73
        Caption = 'Op'#231#245'es'
        TabOrder = 1
        object SpeedBCancelar: TSpeedButton
          Left = 344
          Top = 19
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
          Left = 238
          Top = 19
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
    object TabDataGrideDevolucao: TTabSheet
      Caption = 'DataGridDevolucao'
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 10
        Top = 3
        Width = 737
        Height = 372
        Caption = 'Lista de Equipamento Alocados'
        TabOrder = 0
        object DBGridDevolucao: TDBGrid
          Left = 12
          Top = 18
          Width = 716
          Height = 344
          DataSource = dsEquipamentosIndisponiveis
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnColEnter = DBGridDevolucaoColEnter
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 381
        Width = 740
        Height = 73
        Caption = 'Op'#231#245'es'
        TabOrder = 1
        object SpeedBDevolver: TSpeedButton
          Left = 312
          Top = 19
          Width = 100
          Height = 40
          Cursor = crHandPoint
          Caption = '&Devolver'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedBDevolverClick
        end
      end
    end
  end
  object dsLocacao: TDataSource
    DataSet = DM1.tbLocacao
    Left = 736
    Top = 24
  end
  object dsColaborador: TDataSource
    DataSet = DM1.tbColaborador
    Left = 675
    Top = 24
  end
  object dsEquipamento: TDataSource
    DataSet = DM1.tbEquipamento
    Left = 643
    Top = 24
  end
  object dsEquipamentosIndisponiveis: TDataSource
    DataSet = DM1.tbEquipamentosIndisponiveis
    Left = 611
    Top = 24
  end
  object dsEquipamentosDisponiveis: TDataSource
    DataSet = DM1.tbEquipamentosDisponiveis
    Left = 579
    Top = 24
  end
  object dsColaboradorDual: TDataSource
    DataSet = DM1.tbColaboradorDual
    Left = 707
    Top = 24
  end
end
