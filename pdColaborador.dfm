object frmColaborador: TfrmColaborador
  Left = 0
  Top = 0
  Caption = 'Colaborador'
  ClientHeight = 539
  ClientWidth = 781
  Color = clBtnFace
  Constraints.MaxHeight = 570
  Constraints.MaxWidth = 789
  Constraints.MinHeight = 570
  Constraints.MinWidth = 789
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
    Width = 781
    Height = 539
    ActivePage = TabCadastro
    Align = alClient
    TabOrder = 0
    object TabDataGrid: TTabSheet
      Caption = 'DataGrid'
      object GroupBox1: TGroupBox
        Left = 16
        Top = 433
        Width = 737
        Height = 73
        Caption = 'Op'#231#245'es'
        TabOrder = 2
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
        Height = 340
        Caption = 'Lista de Colaboradores'
        TabOrder = 1
        object DBGridColaborador: TDBGrid
          Left = 11
          Top = 18
          Width = 716
          Height = 312
          DataSource = dsColaborador
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnColEnter = DBGridColaboradorColEnter
        end
      end
      object GroupBox4: TGroupBox
        Left = 16
        Top = 0
        Width = 737
        Height = 89
        Caption = 'Filtros'
        TabOrder = 0
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
          Top = 58
          Width = 100
          Height = 22
          Caption = '&Limpar'
          OnClick = SpeedBLimparClick
        end
        object GroupBox5: TGroupBox
          Left = 451
          Top = 11
          Width = 86
          Height = 74
          Caption = 'Por Sexo'
          TabOrder = 2
          object RbFiltroMasculino: TRadioButton
            Left = 15
            Top = 35
            Width = 113
            Height = 15
            Caption = 'Masculino'
            TabOrder = 1
          end
          object RbFiltroFeminino: TRadioButton
            Left = 15
            Top = 52
            Width = 113
            Height = 15
            Caption = 'Feminino'
            TabOrder = 2
          end
          object RbFiltroTodosSexo: TRadioButton
            Left = 15
            Top = 17
            Width = 100
            Height = 17
            Caption = 'Todos'
            TabOrder = 0
          end
        end
        object GroupBox6: TGroupBox
          Left = 543
          Top = 11
          Width = 74
          Height = 74
          Caption = 'Por Situa'#231#227'o'
          TabOrder = 3
          object RbFiltroInativo: TRadioButton
            Left = 10
            Top = 52
            Width = 58
            Height = 15
            Caption = 'Inativo'
            TabOrder = 2
          end
          object RbFiltroAtivo: TRadioButton
            Left = 10
            Top = 35
            Width = 44
            Height = 15
            Caption = 'Ativo'
            TabOrder = 1
          end
          object RbFiltroTodosSituacao: TRadioButton
            Left = 10
            Top = 17
            Width = 51
            Height = 17
            Caption = 'Todos'
            TabOrder = 0
          end
        end
        object GroupBox7: TGroupBox
          Left = 11
          Top = 11
          Width = 434
          Height = 74
          Caption = 'Por Nome'
          TabOrder = 1
        end
        object EdFiltroNome: TEdit
          Left = 22
          Top = 30
          Width = 411
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
      object PanPrincipalCadColab: TPanel
        Left = 0
        Top = 0
        Width = 773
        Height = 511
        Align = alClient
        TabOrder = 0
        object GroupBoxOptCadColab: TGroupBox
          Left = 23
          Top = 431
          Width = 729
          Height = 73
          Caption = 'Op'#231#245'es'
          TabOrder = 1
          object SpeedBCancelar: TSpeedButton
            Left = 356
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
            Left = 250
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
        object GroupBoxCadColaborador: TGroupBox
          Left = 23
          Top = 16
          Width = 729
          Height = 409
          Caption = 'Cadastro'
          TabOrder = 0
          object Lab: TLabel
            Left = 24
            Top = 16
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
          object LabSeqcolaborador: TLabel
            Left = 81
            Top = 16
            Width = 46
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
          object Label3: TLabel
            Left = 24
            Top = 165
            Width = 127
            Height = 18
            Caption = 'Data Nascimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 24
            Top = 104
            Width = 47
            Height = 18
            Caption = 'E-mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object GroupBox3: TGroupBox
            Left = 256
            Top = 165
            Width = 170
            Height = 87
            Caption = 'Sexo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            object RbMasculino: TRadioButton
              Left = 16
              Top = 32
              Width = 113
              Height = 17
              Caption = 'Masculino'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object RbFeminino: TRadioButton
              Left = 16
              Top = 55
              Width = 113
              Height = 17
              Caption = 'Feminino'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object EdNome: TEdit
            Left = 24
            Top = 72
            Width = 673
            Height = 26
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object EdEmail: TEdit
            Left = 24
            Top = 128
            Width = 673
            Height = 26
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DtpDataNascimento: TDateTimePicker
            Left = 24
            Top = 189
            Width = 186
            Height = 26
            Date = 44753.463161284720000000
            Time = 44753.463161284720000000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object GroupBox8: TGroupBox
            Left = 448
            Top = 165
            Width = 170
            Height = 87
            Caption = 'Situa'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
          object RbAtivo: TRadioButton
            Left = 464
            Top = 197
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
            TabOrder = 5
          end
          object RbInativo: TRadioButton
            Left = 464
            Top = 220
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
            TabOrder = 6
          end
        end
      end
    end
  end
  object dsColaborador: TDataSource
    DataSet = DM1.tbColaborador
    Left = 752
    Top = 24
  end
end
