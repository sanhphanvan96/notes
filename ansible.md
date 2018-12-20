##

```sh
ansible-doc apt
ansible all -i inventory_test -m setup -a "filter=ansible_en*"
ansible web -i inventory_test -m service -a "name=httpd enabled=yes state=started" --become
ansible all -i inventory -m ping
ansible-galaxy init app.common
ansible-galaxy install geerlingguy.git -p roles



```
