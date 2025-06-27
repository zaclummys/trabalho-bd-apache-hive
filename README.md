
## Como Rodar

Siga os passos abaixo para executar o projeto:

1. **Iniciar o ambiente**  
    Execute o comando abaixo para configurar o ambiente:  
    ```bash
    make up
    ```

2. **Copiar o esquema para o servidor Hive**  
    Rode o script para copiar o esquema para o servidor Hive:  
    ```bash
    ./copy-schema-to-hive-server.sh
    ```

3. **Copiar os dados para o servidor Hive**  
    Execute o script para transferir os dados para o servidor Hive:  
    ```bash
    ./copy-data-to-hive-server.sh
    ```

4. **Executar consultas no Hive**  
    Utilize o comando abaixo para abrir o Beeline e realizar as consultas:  
    ```bash
    make beeline
    ```
