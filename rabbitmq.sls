{% set versions = [
  ('3.8.14', 'v3.8.14'),
  ('3.8.13', 'v3.8.13'),
  ('3.8.12', 'v3.8.12'),
  ('3.8.11', 'v3.8.11'),
  ('3.8.9', 'v3.8.9'),
  ('3.8.8', 'v3.8.8'),
  ('3.8.7', 'v3.8.7'),
  ('3.8.6', 'v3.8.6'),
  ('3.8.5', 'v3.8.5'),
  ('3.8.4', 'v3.8.4'),
  ('3.8.3', 'v3.8.3'),
  ('3.8.2', 'v3.8.2'),
  ('3.8.1', 'v3.8.1'),
  ('3.8.0', 'v3.8.0'),
  ('3.7.7', 'v3.7.7'),
  ('3.6.9', 'rabbitmq_v3_6_9'),
] %}
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
