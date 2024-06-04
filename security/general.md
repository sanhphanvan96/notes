## Project Discovery
- install pdmt https://github.com/projectdiscovery/pdtm
    - pdtm requires go1.19
```
go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest
pdtm -i subfinder
pdtm -i httpx
pdtm -i nuclei
```
- one line test:
```
subfinder -d example.com -silent | httpx -silent | nuclei
```
