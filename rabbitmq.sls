{% set versions = [('3.6.9', 'rabbitmq_v3_6_9'), ('3.7.7', 'v3.7.7')] %}
rabbitmq:
  {% for version, tag in versions %}
  '{{ version }}':
    full_name: 'RabbitMQ Server {{ version }}'
    installer: 'https://github.com/rabbitmq/rabbitmq-server/releases/download/{{ tag }}/rabbitmq-server-{{ version }}.exe'
    install_flags: '/S'
    uninstaller: 'C:\Program Files\RabbitMQ Server\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
