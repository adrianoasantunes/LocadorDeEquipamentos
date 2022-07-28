object DM1: TDM1
  OldCreateOrder = False
  Height = 464
  Width = 1054
  object SQLDMConexao: TZConnection
    Protocol = 'mysql'
    HostName = 'localhost'
    Port = 3306
    Database = 'consinco'
    User = 'consinco'
    Password = 'consinco'
    TransactIsolationLevel = tiReadCommitted
    Connected = True
    Left = 56
    Top = 32
  end
  object tbColaborador: TZQuery
    Connection = SQLDMConexao
    Active = True
    SQL.Strings = (
      'SELECT a.seqcolaborador,'
      '       a.nome,'
      '       a.sexo,'
      '       IF(a.sexo='#39'M'#39','#39'Masculino'#39','#39'Feminino'#39') AS decode_sexo,'
      '       a.dtanascimento,'
      '       a.email,'
      '       a.situacao,'
      '       IF(a.situacao='#39'A'#39','#39'Ativo'#39','#39'Inativo'#39') AS decode_situacao'
      'FROM tb_speedtoherocolaborador a;')
    Params = <>
    Left = 160
    Top = 32
    object tbColaboradorseqcolaborador: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'seqcolaborador'
      Required = True
    end
    object tbColaboradornome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object tbColaboradorsexo: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'sexo'
      Size = 1
    end
    object tbColaboradordecode_sexo: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'decode_sexo'
      ReadOnly = True
      Size = 9
    end
    object tbColaboradordtanascimento: TDateField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'dtanascimento'
    end
    object tbColaboradoremail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 100
    end
    object tbColaboradorsituacao: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'situacao'
      Required = True
      Size = 1
    end
    object tbColaboradordecode_situacao: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'decode_situacao'
      ReadOnly = True
      Size = 7
    end
  end
  object tbEquipamento: TZQuery
    Connection = SQLDMConexao
    Active = True
    SQL.Strings = (
      'SELECT a.seqequipamento,'
      '       a.nome,'
      '       a.seqespecie,'
      '       a.situacao'
      'FROM tb_speedtoheroequipamento a;')
    Params = <>
    Left = 160
    Top = 168
    object tbEquipamentoseqequipamento: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'seqequipamento'
      Required = True
    end
    object tbEquipamentonome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object tbEquipamentoseqespecie: TIntegerField
      DisplayLabel = 'C'#243'digo Esp'#233'cie'
      FieldName = 'seqespecie'
      Required = True
    end
    object tbEquipamentosituacao: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'situacao'
      Size = 1
    end
  end
  object tbEspecie: TZQuery
    Connection = SQLDMConexao
    Active = True
    SQL.Strings = (
      'SELECT a.seqespecie,'
      '       a.especie '
      'FROM tb_speedtoheroespecie a;')
    Params = <>
    Left = 160
    Top = 96
    object tbEspecieseqespecie: TIntegerField
      FieldName = 'seqespecie'
      Required = True
    end
    object tbEspecieespecie: TStringField
      FieldName = 'especie'
      Required = True
      Size = 100
    end
  end
  object tbLocacao: TZQuery
    Connection = SQLDMConexao
    CachedUpdates = True
    Active = True
    SQL.Strings = (
      'SELECT a.seqcolaborador,'
      '       a.seqequipamento,'
      '       a.dtalocacao,'
      '       a.dtadevolucao'
      'FROM tb_speedtoherolocacao a;')
    Params = <>
    Left = 160
    Top = 232
    object tbLocacaoseqcolaborador: TIntegerField
      FieldName = 'seqcolaborador'
      Required = True
    end
    object tbLocacaoseqequipamento: TIntegerField
      FieldName = 'seqequipamento'
      Required = True
    end
    object tbLocacaodtalocacao: TDateField
      FieldName = 'dtalocacao'
      Required = True
    end
    object tbLocacaodtadevolucao: TDateField
      FieldName = 'dtadevolucao'
    end
  end
  object tbEquipamentosDisponiveis: TZQuery
    Connection = SQLDMConexao
    Active = True
    SQL.Strings = (
      'SELECT a.seqequipamento,'
      '       a.nome,'
      '       a.seqespecie,'
      '       b.especie,'
      '       a.situacao,'
      '       IF(a.situacao='#39'A'#39','#39'Ativo'#39','#39'Inativo'#39') as decode_situacao'
      'FROM tb_speedtoheroequipamento a,'
      '     tb_speedtoheroespecie b'
      'WHERE a.seqespecie =  b.seqespecie'
      'AND a.situacao = '#39'A'#39
      'AND NOT EXISTS( SELECT 1'
      #9'                FROM tb_speedtoherolocacao c'
      '                 WHERE a.seqequipamento = c.seqequipamento'
      '                 AND c.dtadevolucao IS NULL'
      '              )'
      'ORDER BY a.seqequipamento asc;')
    Params = <>
    Left = 272
    Top = 168
    object tbEquipamentosDisponiveisseqequipamento: TIntegerField
      DisplayLabel = 'C'#243'digo Equipamento'
      FieldName = 'seqequipamento'
      Required = True
    end
    object tbEquipamentosDisponiveisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object tbEquipamentosDisponiveisseqespecie: TIntegerField
      DisplayLabel = 'C'#243'digo Esp'#233'cie'
      FieldName = 'seqespecie'
      Required = True
    end
    object tbEquipamentosDisponiveisespecie: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'especie'
      Required = True
      Size = 100
    end
    object tbEquipamentosDisponiveissituacao: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'situacao'
      Required = True
      Size = 1
    end
    object tbEquipamentosDisponiveisdecode_situacao: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'decode_situacao'
      ReadOnly = True
      Size = 7
    end
  end
  object tbEquipamentosIndisponiveis: TZQuery
    Connection = SQLDMConexao
    Active = True
    SQL.Strings = (
      'SELECT b.seqcolaborador,'
      '       d.nome as nomecolaborador,'
      '       a.seqequipamento,'
      '       a.nome as nomequipamento,'
      '       a.seqespecie,'
      '       c.especie,'
      '       b.dtalocacao,'
      '       b.dtadevolucao'
      'FROM tb_speedtoheroequipamento a,'
      '     tb_speedtoherolocacao b,'
      '     tb_speedtoheroespecie c,'
      '     tb_speedtoherocolaborador d'
      'WHERE a.seqequipamento = b.seqequipamento'
      'AND a.seqespecie = c.seqespecie'
      'AND b.seqcolaborador = d.seqcolaborador'
      'AND b.dtadevolucao IS NULL'
      'ORDER BY a.seqequipamento asc;')
    Params = <>
    Left = 416
    Top = 168
    object tbEquipamentosIndisponiveisseqcolaborador: TIntegerField
      DisplayLabel = 'C'#243'digo Colaborador'
      FieldName = 'seqcolaborador'
      Required = True
    end
    object tbEquipamentosIndisponiveisnomecolaborador: TStringField
      DisplayLabel = 'Nome Colaborador'
      FieldName = 'nomecolaborador'
      Required = True
      Size = 100
    end
    object tbEquipamentosIndisponiveisseqequipamento: TIntegerField
      DisplayLabel = 'C'#243'digo Equipamento'
      FieldName = 'seqequipamento'
      Required = True
    end
    object tbEquipamentosIndisponiveisnomequipamento: TStringField
      DisplayLabel = 'Nome Equipamento'
      FieldName = 'nomequipamento'
      Required = True
      Size = 100
    end
    object tbEquipamentosIndisponiveisseqespecie: TIntegerField
      DisplayLabel = 'C'#243'digo Esp'#233'cie'
      FieldName = 'seqespecie'
      Required = True
    end
    object tbEquipamentosIndisponiveisespecie: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'especie'
      Required = True
      Size = 100
    end
    object tbEquipamentosIndisponiveisdtalocacao: TDateField
      DisplayLabel = 'Data Loca'#231#227'o'
      FieldName = 'dtalocacao'
      Required = True
    end
    object tbEquipamentosIndisponiveisdtadevolucao: TDateField
      DisplayLabel = 'Data Devolu'#231#227'o'
      FieldName = 'dtadevolucao'
    end
  end
  object tbEquipamentosDBGridEquipamento: TZQuery
    Connection = SQLDMConexao
    Active = True
    SQL.Strings = (
      'SELECT a.seqequipamento,'
      '       a.nome,'
      '       a.seqespecie,'
      '       b.especie,'
      '       a.situacao,'
      '       IF(a.situacao = '#39'A'#39','#39'Ativo'#39','#39'Inativo'#39') AS decode_situacao'
      'FROM tb_speedtoheroequipamento a,'
      '     tb_speedtoheroespecie b'
      'WHERE a.seqespecie = b.seqespecie'
      'ORDER BY a.seqequipamento ASC;')
    Params = <>
    Left = 576
    Top = 168
    object tbEquipamentosDBGridEquipamentoseqequipamento: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'seqequipamento'
      Required = True
    end
    object tbEquipamentosDBGridEquipamentonome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object tbEquipamentosDBGridEquipamentoseqespecie: TIntegerField
      DisplayLabel = 'C'#243'digo Esp'#233'cie'
      FieldName = 'seqespecie'
      Required = True
    end
    object tbEquipamentosDBGridEquipamentoespecie: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'especie'
      Required = True
      Size = 100
    end
    object tbEquipamentosDBGridEquipamentosituacao: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'situacao'
      Required = True
      Size = 1
    end
    object tbEquipamentosDBGridEquipamentodecode_situacao: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'decode_situacao'
      ReadOnly = True
      Size = 7
    end
  end
  object tbEspecieDual: TZQuery
    Connection = SQLDMConexao
    Active = True
    SQL.Strings = (
      'SELECT 0 AS seqespecie,'
      '       '#39'Todos'#39' AS especie,'
      '       0 AS ordem'
      ' FROM DUAL'
      'UNION'
      'SELECT a.seqespecie,'
      '       a.especie,'
      '       1 AS ordem'
      'FROM tb_speedtoheroespecie a'
      'ORDER BY ordem, especie;'
      '')
    Params = <>
    Left = 272
    Top = 96
    object tbEspecieDualseqespecie: TLargeintField
      FieldName = 'seqespecie'
      ReadOnly = True
    end
    object tbEspecieDualespecie: TStringField
      FieldName = 'especie'
      ReadOnly = True
      Size = 100
    end
    object tbEspecieDualordem: TLargeintField
      FieldName = 'ordem'
      ReadOnly = True
    end
  end
  object tbColaboradorDual: TZQuery
    Connection = SQLDMConexao
    Active = True
    SQL.Strings = (
      'SELECT 0 AS seqcolaborador,'
      '       '#39'Todos'#39' AS nome,'
      '       '#39#39' AS sexo,'
      '       '#39#39' AS dtanascimento,'
      '       '#39#39' AS email,'
      '       '#39#39' AS situacao,'
      '       0 AS ordem'
      'FROM DUAL'
      'UNION'
      'SELECT a.seqcolaborador,'
      '       a.nome,'
      '       a.sexo,'
      '       a.dtanascimento,'
      '       a.email,'
      '       a.situacao,'
      '       1 AS ordem'
      'FROM tb_speedtoherocolaborador a'
      'WHERE a.situacao = '#39'A'#39
      'ORDER BY ordem, nome;')
    Params = <>
    Left = 275
    Top = 33
    object tbColaboradorDualseqcolaborador: TLargeintField
      FieldName = 'seqcolaborador'
      ReadOnly = True
    end
    object tbColaboradorDualnome: TStringField
      FieldName = 'nome'
      ReadOnly = True
      Size = 100
    end
    object tbColaboradorDualsexo: TStringField
      FieldName = 'sexo'
      ReadOnly = True
      Size = 1
    end
    object tbColaboradorDualdtanascimento: TStringField
      FieldName = 'dtanascimento'
      ReadOnly = True
      Size = 10
    end
    object tbColaboradorDualemail: TStringField
      FieldName = 'email'
      ReadOnly = True
      Size = 100
    end
    object tbColaboradorDualsituacao: TStringField
      FieldName = 'situacao'
      ReadOnly = True
      Size = 1
    end
    object tbColaboradorDualordem: TLargeintField
      FieldName = 'ordem'
      ReadOnly = True
    end
  end
  object tbLocacaoRelatorios: TZQuery
    Connection = SQLDMConexao
    Active = True
    SQL.Strings = (
      'SELECT a.seqcolaborador,'
      '       b.nome AS nomecolaborador,'
      '       a.seqequipamento,'
      '       c.nome AS nomequipamento,'
      '       d.seqespecie,'
      '       d.especie,'
      '       a.dtalocacao,'
      '       a.dtadevolucao,'
      
        '       IF(a.dtadevolucao IS NULL,'#39#39',(DATE_FORMAT(a.dtadevolucao,' +
        #39'%d/%m/%Y'#39'))) AS decode_dtadevolucao       '
      'FROM tb_speedtoherolocacao a,'
      '     tb_speedtoherocolaborador b,'
      '     tb_speedtoheroequipamento c,'
      '     tb_speedtoheroespecie d'
      'WHERE a.seqcolaborador = b.seqcolaborador'
      'AND a.seqequipamento = c.seqequipamento'
      'AND c.seqespecie = d.seqespecie;')
    Params = <>
    Left = 272
    Top = 232
    object tbLocacaoRelatoriosseqcolaborador: TIntegerField
      DisplayLabel = 'C'#243'digo Colaborador'
      FieldName = 'seqcolaborador'
      Required = True
    end
    object tbLocacaoRelatoriosnomecolaborador: TStringField
      DisplayLabel = 'Nome Colaborador'
      FieldName = 'nomecolaborador'
      Required = True
      Size = 100
    end
    object tbLocacaoRelatoriosseqequipamento: TIntegerField
      DisplayLabel = 'C'#243'digo Equipamento'
      FieldName = 'seqequipamento'
      Required = True
    end
    object tbLocacaoRelatoriosnomequipamento: TStringField
      DisplayLabel = 'Nome Equipamento'
      FieldName = 'nomequipamento'
      Required = True
      Size = 100
    end
    object tbLocacaoRelatoriosseqespecie: TIntegerField
      DisplayLabel = 'C'#243'digo Esp'#233'cie'
      FieldName = 'seqespecie'
      Required = True
    end
    object tbLocacaoRelatoriosespecie: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'especie'
      Required = True
      Size = 100
    end
    object tbLocacaoRelatoriosdtalocacao: TDateField
      DisplayLabel = 'Data Loca'#231#227'o'
      FieldName = 'dtalocacao'
      Required = True
    end
    object tbLocacaoRelatoriosdtadevolucao: TDateField
      DisplayLabel = 'Data Devolu'#231#227'o'
      FieldName = 'dtadevolucao'
    end
    object tbLocacaoRelatoriosdecode_dtadevolucao: TStringField
      DisplayLabel = 'Data Devolu'#231#227'o'
      FieldName = 'decode_dtadevolucao'
      ReadOnly = True
      Size = 10
    end
  end
end
