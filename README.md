# Desafio-Tecnico-GS3

## Índice
- [Instalação](#instalação)
- [Arquitetura](#arquitetura)

## Instalação

### Pre-requisitos

- Flutter 3.35.5 • channel stable

### Passo a passo

- clone este repositório e instale as dependências:

    ```bash
        git clone https://github.com/Arthurlima544/Desafio-Tecnico-GS3.git
    ```

- instale a vesão que foi utilizada para o desenvolvimento do projeto (mais recente):

    ```bash
        fvm install 3.35.5
        fvm use 3.35.5
    ```

- instale as dependências do projeto:

    ```bash
        flutter pub get
    ```

- execute o projeto:

    ```bash
        flutter run
    ```

## Arquitetura

- O projeto foi desenvolvido utilizando a arquitetura MVVM (Model-View-ViewModel) seguindo a propria documentacao do flutter sobre arquitetura recomendada sobre e adaptando algumas nomeclaturaras que fazem mais sentido para o contexto.https://docs.flutter.dev/app-architecture/guide

- A estrutura de pastas do projeto é a seguinte:

```
lib
│── domain
│   ├── entities
│   ├── repository
│── service
│   ├── api
│   ├── exceptions
│   └── dto
├── view
├── viewmodel
└── utils
```

### Domain

A camada de domínio contém a lógica de negócio pura e independente do framework. É dividida em:

- **entities**: Representa as entidades do domínio com suas regras de negócio
  - `card_entity.dart`: Define a entidade de cartão de crédito (uuid, número, titular, limite, melhor dia)
  - `transaction_entity.dart`: Define a entidade de transação (uuid, nome, ícone, data, valor, parcelas, etc.)

- **repository**: Define as interfaces (contratos) para acesso aos dados
  - `card/card_repository.dart`: Interface para operações relacionadas a cartões
  - `transaction/transaction_repository.dart`: Interface para operações relacionadas a transações

### Service

A camada de serviço gerencia a comunicação com APIs externas e a conversão de dados. Contém:

- **api**: Implementação dos serviços de API
  - `api_service.dart`: Interface abstrata que define os métodos de comunicação com a API
  - `api_service_impl.dart`: Implementação concreta do serviço de API
  - `fake_data_responses.dart`: Dados mock para testes e desenvolvimento

- **dtos**: Data Transfer Objects para serialização/deserialização
  - `card_dto.dart`: DTO para transferência de dados de cartão (inclui campos adicionais como CVV e validade)
  - `transaction_dto.dart`: DTO para transferência de dados de transação

- **exceptions**: Tratamento de exceções específicas do serviço

- Implementações dos repositórios (`card_repository_impl.dart`, `transaction_repository_impl.dart`) que conectam o domínio aos serviços

### View

A camada de visualização contém todos os componentes de UI do Flutter. Organizada em:

- **home**: Tela principal do aplicativo
  - `home.dart`: Widget principal da tela home com carrossel de cartões, favoritos e últimas transações
  - `widgets/`: Componentes reutilizáveis da home (carrossel de cartões, barra de navegação, etc.)

- **login**: Tela de autenticação do usuário

- **widgets**: Componentes de UI reutilizáveis globalmente

### ViewModel

A camada de ViewModel implementa o padrão MVVM gerenciando o estado e lógica de apresentação:

- **home/home_view_model.dart**: 
  - Gerencia o estado da tela home usando `ChangeNotifier`
  - Implementa `Command` pattern para operações assíncronas
  - Carrega cartões e transações através dos repositórios
  - Calcula limite disponível baseado nas transações da fatura atual
  - Agrupa transações por data para visualização

- **login/login_view_model.dart**: Gerencia o estado e lógica da tela de login

### Utils

Contém classes de utilitários, padrões e recursos compartilhados:

- **result.dart**: Implementa o padrão Result para tratamento de erros funcionais (`Ok<T>` e `Error<T>`)
- **command.dart**: Implementa o padrão Command para operações assíncronas com estado (`Command0`, `Command1`)
- **dependecies.dart**: Configuração de injeção de dependências usando Provider
- **app_exception.dart**: Definição de exceções customizadas da aplicação
- **functions.dart**: Funções auxiliares (como cálculo de período de fatura)

- **design/**: Sistema de design da aplicação
  - Cores (`app_colors.dart`)
  - Ícones (`app_icons.dart`)
  - Espaçamentos (`app_spacings.dart`)
  - Estilos de texto (`app_text_styles.dart`)
  - Tema (`app_theme.dart`)