o# Projeto Banco de Dados
 Projeto Oficina
### **Fundamentos de Banco de Dados** 
### Banco de Dados II
## **Noções Básicas** 
<details>	
  <summary><a> Linguagens SQL</a></summary>
  - **DDL** (Linguagem de Definição de Dados), que lida com esquemas e descrições de banco de dados.
  - **DML** (Linguagem de Manipulação de Dados), que lida com a manipulação de dados e inclui instruções SQL mais comuns, como SELECT, INSERT, UPDATE, DELETE etc.
  - **DCL** (Linguagem de Controle de Dados), que inclui comandos como GRANT, e principalmente relacionado com direitos, permissões e outros controles do sistema de banco de dados.
  <br/>
</details>

<details>	
  <summary><a> Transações</a></summary>
  Transação em banco de dados é uma coleção de várias operações ex: `SELECT`, `UPDATE`, `DELETE` ou `INSERT` como uma **única unidade de trabalho**.
  <br/>
  Podemos definir onde a transação começará e quando terminará. Para iniciar a transação, usamos a sintaxe `BEGIN`.
  <br/>
  Se as consultas em uma transação foram executadas com sucesso, salvamos as alterações usando a sintaxe `COMMIT`. Se as consultas em uma transação falharem na execução, então reverteremos as alterações antes da execução da transação usando a sintaxe `ROLLBACK`.
  
 
  
  Ex:
  ```sql
  SELECT BALANCE FROM ACCOUNT WHERE ID = 1
  UPDATE ACCOUNT SET BALANCE = BALANCE - 100 WHERE ID = 1
  UPDATE ACCOUNT SET BALANCE = BALANCE + 100 WHERE ID = 2
  ```
  
  
  
  <br/>
  
  <details>	
  
  <summary><a> Propriedades das Transações</a></summary>
    
  Todo banco de dados RELACIONAL deve possuir as propriedades ACID:
  - **ATOMICIDADE**: todas as operações de uma transação são realizadas. Isso significa que em caso de sucesso deve ser executada totalmente e em casos de erros ou falhas deve ser abortada por completo.
  - **CONSISTENCIA**: leva o DB de um estado consistente para outro estado consistente.
  - **INDEPENDENCIA**: o processamento de transações não deve interferir em outras transações.
  - **DURABILIDADE**: resultados de operações confirmadas não devem interferir em outras transações


<details>	
  <summary><a> Otimização de Consultas</a></summary>
 
  É sempre necessário levar em conta:
  - replicação dos dados
  - reconstrução das relações a partir de fragmentos
  - tempo de recuperação
  - tempo de processamento
  - transmissão pela rede
  
  #### Fragmentação de Dados
  Um dado ou relação será fragmentado e armazenado em diferentes nodos.<br>
  A fragmentação pode ser de 2 formas:
  - Horizontal: os fragmentos são definidos por SELEÇÃO
  - Vertical: os fragmentos são definidos por PROJEÇÃO
  <br/>
</details>
