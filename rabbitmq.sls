rabbitmq:
  '3.6.9':
    full_name: 'RabbitMQ'
    installer: 'https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_6_9/rabbitmq-server-3.6.9.exe'
    install_flags: '/S'
    uninstaller: 'C:\Program Files\RabbitMQ Server\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
