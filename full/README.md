# Build container:
```
docker build -t attackdocker .
```

# Run container with SSH:
```
docker run -p 2222:22 --name attackct -it attackdocker
```
