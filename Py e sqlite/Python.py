import sqlite3

def conectar():
    return sqlite3.connect('cafeteria.db')

def listar_tabela(nome_tabela):
    conn = conectar()
    cursor = conn.cursor()
    try:
        cursor.execute(f"SELECT * FROM {nome_tabela} LIMIT 10")
        resultados = cursor.fetchall()
        print(f"\n📋 Conteúdo da tabela {nome_tabela}:")
        for linha in resultados:
            print(linha)
    except Exception as e:
        print(f"Erro ao consultar {nome_tabela}: {e}")
    conn.close()

def clientes_sem_pedidos():
    conn = conectar()
    cursor = conn.cursor()
    print("\n📌 Clientes que ainda não fizeram pedidos:")
    cursor.execute("""
        SELECT nome, id_clientes FROM clientes
        WHERE id_clientes NOT IN (SELECT idcliente FROM pedidos)
    """)
    for linha in cursor.fetchall():
        print(linha)
    conn.close()

def produtos_mais_vendidos():
    conn = conectar()
    cursor = conn.cursor()
    print("\n📦 Produtos mais vendidos (top 5):")
    cursor.execute("""
        SELECT p.nome, SUM(ip.quantidade) AS total_vendido
        FROM itenspedidos ip
        JOIN produtos p ON ip.idprodutos = p.id_produtos
        GROUP BY p.nome
        ORDER BY total_vendido DESC
        LIMIT 5;
    """)
    for linha in cursor.fetchall():
        print(linha)
    conn.close()

def faturamento_por_mes():
    conn = conectar()
    cursor = conn.cursor()
    print("\n💰 Faturamento por mês:")
    cursor.execute("""
        SELECT 
            strftime('%Y-%m', Dia) AS Mes,
            SUM(FaturamentoTotal) AS Total
        FROM FaturamentoDiario
        GROUP BY Mes
        ORDER BY Mes;
    """)
    for linha in cursor.fetchall():
        print(linha)
    conn.close()

def pedidos_por_status():
    conn = conectar()
    cursor = conn.cursor()
    print("\n📈 Total de pedidos por status:")
    cursor.execute("""
        SELECT status, COUNT(*) FROM pedidos
        GROUP BY status;
    """)
    for linha in cursor.fetchall():
        print(linha)
    conn.close()

def filtro_pedidos_por_data():
    conn = conectar()
    cursor = conn.cursor()
    inicio = input("\n🔎 Digite a data inicial (YYYY-MM-DD): ")
    fim = input("🔎 Digite a data final (YYYY-MM-DD): ")
    print(f"\n🕒 Pedidos entre {inicio} e {fim}:")
    cursor.execute("""
        SELECT id_pedidos, datahora, status FROM pedidos
        WHERE DATE(datahora) BETWEEN ? AND ?
    """, (inicio, fim))
    for linha in cursor.fetchall():
        print(linha)
    conn.close()

def buscar_produtos_por_categoria():
    conn = conectar()
    cursor = conn.cursor()
    categoria = input("\n🔎 Digite a categoria (Ex: Café, Almoço, Sobremesa): ")
    print(f"\n🍽️ Produtos da categoria: {categoria}")
    cursor.execute("""
        SELECT id_produtos, nome, preço FROM produtos
        WHERE categoria = ?
    """, (categoria,))
    for linha in cursor.fetchall():
        print(linha)
    conn.close()

def ver_views():
    conn = conectar()
    cursor = conn.cursor()
    views = ['viewclientes', 'ViewValorTotalPedido', 'ViewPedidosColaboradores', 'ViewEstoqueBaixo', 'ViewProdutosFornecedores', 'ViewItensPedidoDetalhado']
    for v in views:
        print(f"\n🔎 View: {v}")
        try:
            cursor.execute(f"SELECT * FROM {v} LIMIT 5")
            for linha in cursor.fetchall():
                print(linha)
        except Exception as e:
            print(f"Erro na view {v}: {e}")
    conn.close()

def menu():
    while True:
        print("\n 🍵 MENU CAFETERIA 🍵 ")
        print("1 - Listar tabela clientes")
        print("2 - Listar tabela produtos")
        print("3 - Listar tabela pedidos")
        print("4 - Listar tabela itenspedidos")
        print("5 - Clientes sem pedidos")
        print("6 - Produtos mais vendidos")
        print("7 - Faturamento por mês")
        print("8 - Pedidos por status")
        print("9 - Pedidos por intervalo de data")
        print("10 - Produtos por categoria")
        print("11 - Ver Views")
        print("0 - Sair")
        opcao = input("\nEscolha uma opção: ")

        if opcao == '1':
            listar_tabela('clientes')
        elif opcao == '2':
            listar_tabela('produtos')
        elif opcao == '3':
            listar_tabela('pedidos')
        elif opcao == '4':
            listar_tabela('itenspedidos')
        elif opcao == '5':
            clientes_sem_pedidos()
        elif opcao == '6':
            produtos_mais_vendidos()
        elif opcao == '7':
            faturamento_por_mes()
        elif opcao == '8':
            pedidos_por_status()
        elif opcao == '9':
            filtro_pedidos_por_data()
        elif opcao == '10':
            buscar_produtos_por_categoria()
        elif opcao == '11':
            ver_views()
        elif opcao == '0':
            print("\n✅ Encerrando o sistema da cafeteria. Até logo!")
            break
        else:
            print("\n❌ Opção inválida, tente novamente.")

if __name__ == '__main__':
    menu()
