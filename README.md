# Utilizando o Session Manager - AWS System Manager

## O que é o System Manager?

O [System Manager](https://aws.amazon.com/pt/systems-manager/), também conhecido como SSM, é um serviço que permite acompanhar e gerenciar sua infraestrutura. Sendo possível automatizar tarefas, manter a conformidade e segurança de instâncias EC2 e também servidores locais.
  
Ele é composto por cinco (05) categorias: [Operations Management](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-ops-center.html), [Application Management](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-application-management.html), [Change Management](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-actions-and-change.html), [Node Management](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-instances-and-nodes.html), e [Shared Resources](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-shared-resources.html).

## O que é o Session Manager?

O [Session Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager.html#session-manager-benefits) permite o gerenciamento de instâncias EC2 e/ou máquinas locais, através de um shell baseado em browser e também através do AWS CLI.

Principais benefícios na utilização:

- Controle quem pode utilizar o Session Manager e quais instâncias podem eles podem acessar, de forma centralizada através do IAM.

- Não é necessário ter portas SSH abertas para realizar um acesso remoto, como isso também não é necessário ficar gerenciando chaves SSH e certificados.

- Logging e auditora da sessão, fornecendo o registro de conexões, comandos executados na instância e notificações de início/término de uma sessão.

## Configurando o System Manager, para o Session Manager

Por padrão o System Manager não tem permissão para executar ações nas instâncias. Para isso é necessário utilizar um IAM Profile para conceder acesso, então algumas políticas podem ser necessárias:

- *AmazonSSMManagedInstanceCore*: Essa política permite a utilização principal do serviço do System Manager. Sendo de uso obrigatório.

- *AmazonSSMDirectoryServiceAccess*: Necessário quando você deseja associar a instância a um Directory Service.

- *CloudWatchAgentServerPolicy*: Necessário quando você pretende utilizar recursos do Amazon EventBridge ou CloudWatch Logs na instância.

**Criei um código Terraform para servir de exemplo de criação de uma politica, role e IAM Profile, confere lá no meu Github o repositório [aws-ssm-policy](https://github.com/rafaelonline/aws-ssm-policy/)**

A política deve ser associada a role utilizada pelas instâncias. Se a instância não tenha nenhuma role, é possível associar a role que criamos com o código Terraform anterior.

Caso deseje utilizar o KMS para criptografar a conexão ou exportar logs para o S3 , por exemplo, será necessário permissões adicionais, consulte a [documentação](https://docs.aws.amazon.com/systems-manager/latest/userguide/getting-started-create-iam-instance-profile.html) para maiores detalhes:

É possível também restringir a utilização por usuários/grupos, para isso verifique a [documentação](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-getting-started-restrict-access.html)

## Utilizando o Session Manager

Via Console EC2

1. Selecione a instância e escolha **Conectar** .  
2. Para **Método de conexão**, escolha **Gerenciador de sessão**.
3. Escolha **conectar** .

Via AWS CLI

1. Para iniciar uma sessão usando o AWS CLI, execute o seguinte comando.

```sh
 aws ssm start-session --target instance-id
```

O AWS CLI deve estar instalado e configurado no computador de origem.

Outros métodos podem ser consultados na [documentação](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-sessions-start.html).

## Sobre o SSM agent

O SSM agent deve estar instalado em cada instância para que seja possível o gerenciamento por parte do System Manager.

Por padrão o agente vem pré-instalado nas seguintes AMIs fornecidas pela AWS:

- Amazon Linux 1 e 2
- Amazon Linux 2 ECS-Optimized
- Ubuntu Server 16.04, 18.04 e 20.04
- Windows Server 2008-2019
- macOS 10.14.x e 10.15.x

Mais detalhes sobre o serviço, consulta de logs do agente e atualizações, acesse a página da [documentação](https://docs.aws.amazon.com/systems-manager/latest/userguide/ssm-agent.html).
