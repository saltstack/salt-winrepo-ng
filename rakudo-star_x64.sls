# rakudo-star_x64:
#
#  placeholder name, Rakudo Star re-use the version number '1.0.0' for each and every release
# so we have to treat each and every Rakudo Star release as a separate pkg in its own right
#
{% for star_version, number, guid in ( ('2020.05.1', '-15', '{4762F693-2C3A-4B0F-BC05-C3585669F7D7}'), 
                                       ('2020.01', '-14', '{E8982F92-0BFC-4381-89F4-49EBAA0CAD34}'), 
                                       ('2019.03', '-13', '{2612A516-13DD-4C59-8196-B34544084AF5}'), 
                                       ('2018.10', '-12', '{93EDC490-BBE1-4FB6-8B79-D71DEDBE5FC0}'), 
                                       ('2018.06', '-11', '{687C4DCF-0DCD-4DD8-8413-CBBFE8A3CE56}'), 
                                       ('2018.04', '-10', '{5873E1BD-BC62-4CC6-806C-FDCD8CDAF905}'), 
                                       ('2018.01', '-9', '{2BC1F425-919B-4643-96C0-276B781D66A4}'), 
                                       ('2017.10', '-8', '{C76048D0-CCE1-4B79-AB66-FF88B5105E99}'),                                           ('2017.07', '-7', '{4593B5F3-B1AE-4632-80ED-8DECC493A2C4}'), 
                                       ('2017.04', '-6', '{F58CFF77-A2A5-42ED-9C21-81EEA410D1C8}'), 
                                       ('2017.01', '-5', '{72ED036A-8340-4228-9D47-8D10A4E56256}'), 
                                       ('2016.11', '-4', '{E817B182-BDEB-43F9-97C2-5051B8B0ECF7}'), 
                                       ('2016.07', '-3', '{73C56149-1826-4EA4-B5D0-FAA643AAC906}'), 
                                       ('2016.04', '-2', '{D5447817-6E7F-410B-B68B-5EB715A1AAAE}') 
                                 ) %}
#
rakudo-star-{{ star_version }}_x64:
  '{{ star_version }}':
    full_name: 'Rakudo Star {{ star_version }}'
    installer: 'https://rakudo.org/dl/star/rakudo-star-{{ star_version }}-01-win-x86_64-(JIT).msi'
    install_flags: '/qn /norestart'
    uninstaller: 'misexec'
    uninstall_flags: '/x {{ guid }} /qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
#
